#' @title Create survey from Ecopath with Ecosim (EwE) output data
#'
#' @description This function creates survey observations for an Ecosim scenario.
#'
#' @details The function takes biomass data from an Ecosim scenario.
#' The biomass data are read in from Ecosim biomass_annual.csv or biomass_monthly.csv.
#' The function reads in total biomass-at-age data of a specific species by age classes and time.
#'
#' @param file_path A character string shows path to Ecosim biomass output file (e.g., biomass_monthly.csv) is located.
#' @param skip_nrows integer; the number of lines of the data file to skip before reading data.
#' @param species The species to create fishery for. A vector of column names from the catch_annual.csv.
#' @param species_labels Customized names for species columns.
#' @param years A vector of years for extracting EwE data.
#' @param survey_num Number of surveys.
#' @param survey_time Survey years and months. A list of data frame for defining survey time. Each list represent a survey. For each data frame, columns represent year and month.
#' @param selectivity Selectivity-at-age. A list of data frame defining selectivity-at-age for a species over time. Each list represent a survey. For each data frame, columns represent age classes and rows represent years.
#' @param cathability Catchability of survey indices. A vector of catchability values for individual surveys.
#' @param CV Coefficient of variation of survey indices. A vector of CVs for individual surveys.
#' @param sample_num Annual sample size. A vector of sample sizes for individual surveys.
#' @param waa_path A character string shows path to Ecosim weight output file (e.g., weight_monthly.csv) is located.
#' @param lw_a Length-weight coefficients a. W=a*L^b. Default EwE value is 0.01.
#' @param lw_b Length-weight coefficients b. W=a*L^b. Default EwE value is 3.
#' @param length_bin A vector of length bins.
#' @param mid_length_bin A vector of middle point of the length bins.
#' @param nbin Total number of bins.
#' @param bin_width Width of bins.
#' @param length_CV CV about length.
#' @return A data list that includes survey indices and composition data from the EwE operating model, and observed survey indices and composition data for each survey. Each survey has time series catch with lognormal error and composition data with sampling error.
#'
#' @export
create_survey <- function(file_path, skip_nrows, species, species_labels, years,
                          survey_num, survey_time, selectivity = NULL, catchability, CV,
                          sample_num, waa_path, lw_a = 0.01, lw_b = 3,
                          length_bin, mid_length_bin, nbin, bin_width, length_CV) {
  species_vec <- paste0("X", species)

  # Load biomass data
  temp <- scan(file_path, what = "", sep = "\n")
  data <- temp[-c(1:skip_nrows)]
  data <- read.table(
    text = as.character(data),
    sep = ",",
    col.names = read.table(text = temp[skip_nrows], sep = ",")
  )

  data$year <- rep(years, each = 12)
  data$month <- rep(1:12, times = length(years))

  data <- data[, c("timestep.group", "year", "month", species_vec)]
  data[, species_vec] <- data[, species_vec] * 1000000 # biomass in mt
  colnames(data) <- c("timestep", "year", "month", species_labels)

  # Load weight data
  weight <- scan(waa_path, what = "", sep = "\n")
  waa <- weight[-c(1:skip_nrows)]
  waa <- read.table(
    text = as.character(waa),
    sep = ",",
    col.names = read.table(text = weight[skip_nrows], sep = ",")
  )
  waa$year <- rep(years, each = 12)
  waa$month <- rep(1:12, times = length(years))

  waa <- waa[, c("timestep.group", "year", "month", species_vec)]
  colnames(waa) <- c("year", "year", "month", species_labels)

  waa[, species_labels] <- waa[, species_labels] / 1000 # weight in kg and need divide the value by 1000 to get mt


  # calculate length-at-age
  laa <- waa
  laa[, species_labels] <- (waa[, species_labels] * 1000 * 1000 / lw_a)^(1 / lw_b) # lw_a and lw_b are default values from EwE user manual: https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.122.6467&rep=rep1&type=pdf, unit of laa is cm.

  # Calculate OM biomass-at-age (baa), number-at-age (naa), total abundance, and abundance index after including selectivity and catchability
  survey_name <- names(survey_time)
  om_baa <-
    om_naa <- om_abundance <- om_abundance_index <-
      naa_sel <-
    vector(mode = "list", length = survey_num)
  names(om_baa) <-
    names(om_naa) <- names(om_abundance) <- names(om_abundance_index) <-
      names(naa_sel) <-
    survey_name

  for (i in 1:survey_num) {
    subdata_id <- which((data$year %in% survey_time[[survey_name[i]]]$year) & (data$month %in% survey_time[[survey_name[i]]]$month))
    sub_waa <- waa[subdata_id, ]

    om_baa[[survey_name[i]]] <- data[subdata_id, ]

    om_naa[[survey_name[i]]] <- om_baa[[survey_name[i]]]
    om_naa[[survey_name[i]]][, species_labels] <- om_baa[[survey_name[i]]][, species_labels] / sub_waa[, species_labels]

    om_abundance[[survey_name[i]]] <- apply(om_naa[[survey_name[i]]][, species_labels], 1, sum)
    names(om_abundance[[survey_name[i]]]) <- om_naa[[survey_name[i]]]$year

    selectivity_id <- which(row.names(survey_selectivity[[survey_name[i]]]) %in% survey_time[[survey_name[i]]]$year)
    naa_sel[[survey_name[i]]] <- om_naa[[survey_name[i]]][, species_labels] * survey_selectivity[[survey_name[i]]][selectivity_id, ]
    row.names(naa_sel[[survey_name[i]]]) <- om_naa[[survey_name[i]]]$year

    catchability_id <- which(names(survey_catchability[[survey_name[i]]]) %in% survey_time[[survey_name[i]]]$year)

    om_abundance_index[[survey_name[i]]] <- apply(naa_sel[[survey_name[i]]], 1, sum) * survey_catchability[[survey_name[i]]][catchability_id]
    names(om_abundance_index[[survey_name[i]]]) <- om_naa[[survey_name[i]]]$year
  }

  # create observed abundance index
  obs_abundance_index <- vector(mode = "list", length = survey_num)
  names(obs_abundance_index) <- survey_name

  for (i in 1:survey_num) {
    n <- length(om_abundance_index[[survey_name[i]]])
    cv_id <- which(names(survey_CV[[survey_name[i]]]) %in% survey_time[[survey_name[i]]]$year)
    sd <- sqrt(log(1 + survey_CV[[survey_name[i]]][cv_id]^2)) # SD in log space, given CV in arithmetic space
    ln <- rnorm(n, mean = rep(0, length(survey_time[[survey_name[i]]]$year)), sd = sd) # log error
    obs_abundance_index[[i]] <- om_abundance_index[[survey_name[i]]] * exp(ln) # multiplicative lognormal error
  }

  # create observed length composition data (compute matrix of length at age, based on the normal distribution)
  # create variation in length-at-age
  sigma_at_age <- vector(mode = "list", length = survey_num)
  names(sigma_at_age) <- survey_name


  for (i in 1:survey_num) {
    subdata_id <- which((data$year %in% survey_time[[survey_name[i]]]$year) & (data$month %in% survey_time[[survey_name[i]]]$month))
    sigma_at_age[[survey_name[i]]] <- matrix(NA, nrow = length(subdata_id), ncol = length(ages))
    for (j in 1:length(subdata_id)) {
      sigma_at_age[[i]][j, ] <- as.numeric(laa[subdata_id[j], species_labels] * length_CV[[survey_name[i]]])
    }
    row.names(sigma_at_age[[i]]) <- survey_time[[survey_name[i]]]$year
    colnames(sigma_at_age[[i]]) <- species_labels
  }

  # create age-length population structure
  nage <- length(ages)
  phi <- vector(mode = "list", length = survey_num)
  names(phi) <- survey_name

  # SS3 approach
  for (i in 1:survey_num) {
    subdata_id <- which((data$year %in% survey_time[[survey_name[i]]]$year) & (data$month %in% survey_time[[survey_name[i]]]$month))
    phi[[survey_name[i]]] <- matrix(NA, nrow = length(length_bin), ncol = length(ages))
    colnames(phi[[survey_name[i]]]) <- species_labels
    row.names(phi[[survey_name[i]]]) <- mid_length_bin
    for (j in 1:length(subdata_id)) {
      for (k in 1:nage) {
        # first length bin
        phi[[i]][1, k] <- pnorm(length_bin[1 + 1], as.numeric(laa[subdata_id[j], species_labels[k]]), sigma_at_age[[i]][j, k])
        total_phi <- phi[[i]][1, k]
        for (l in 2:(length(length_bin) - 1)) {
          p <- pnorm(length_bin[l + 1], as.numeric(laa[subdata_id[j], species_labels[k]]), sigma_at_age[[i]][j, k])
          phi[[i]][l, k] <- p - total_phi
          total_phi <- p
        }
        phi[[i]][nbin, k] <- 1 - total_phi
      }
    }
  }

  len_dist_ss3 <- laa_num_ss3 <- vector(mode = "list", length = survey_num)
  names(len_dist_ss3) <- names(laa_num_ss3) <- survey_name
  for (i in 1:survey_num) {
      subdata_id <- which((data$year %in% survey_time[[survey_name[i]]]$year) & (data$month %in% survey_time[[survey_name[i]]]$month))

      len_dist_ss3[[i]] <- laa_num_ss3[[i]] <- matrix(NA, nrow=length(subdata_id), ncol=nbin)
      row.names(len_dist_ss3[[i]]) <- row.names(laa_num_ss3[[i]]) <- survey_time[[survey_name[i]]]$year
      colnames(len_dist_ss3[[i]]) <- colnames(laa_num_ss3[[i]]) <- mid_length_bin
      for (j in 1:length(subdata_id)) {

          if (!is.na(sample_num[[i]][paste0(survey_time[[survey_name[i]]]$year[j])])) {
            len_dist_ss3[[i]][j, ] <- phi[[i]] %*% as.numeric(naa_sel[[i]][j, ])/sum(naa_sel[[i]][j, ])
          } else {
            len_dist_ss3[[i]][j, ] <- NA
          }

          laa_num_ss3[[i]][j, ] <- round(sample_num[[i]][paste0(survey_time[[survey_name[i]]]$year[j])] * len_dist_ss3[[i]][j, ])

      }
  }


  # BAM approach
  sigma_at_age <- lenpro <- vector(mode = "list", length = survey_num)
  names(sigma_at_age) <- names(lenpro) <- survey_name

  for (i in 1:survey_num) {
    subdata_id <- which((data$year %in% survey_time[[survey_name[i]]]$year) & (data$month %in% survey_time[[survey_name[i]]]$month))

    sigma_at_age[[survey_name[i]]] <- matrix(NA, nrow = length(subdata_id), ncol = length(ages))
    row.names(sigma_at_age[[i]]) <- survey_time[[survey_name[i]]]$year
    colnames(sigma_at_age[[i]]) <- species_labels

    lenpro[[survey_name[[i]]]] <- vector(mode = "list", length = length(subdata_id))
    names(lenpro[[survey_name[[i]]]]) <- survey_time[[survey_name[i]]]$year

    for (j in 1:length(subdata_id)) {
      sigma_at_age[[i]][j, ] <- as.numeric(laa[subdata_id[j], species_labels] * length_CV[[survey_name[i]]])

      lenpro[[survey_name[[i]]]][[j]] <- matrix(NA, nrow = nage, ncol = nbin)
      row.names(lenpro[[survey_name[[i]]]][[j]]) <- species_labels
      colnames(lenpro[[survey_name[[i]]]][[j]]) <- mid_length_bin

      for (k in 1:nage) {
        # standardized normal values for length = 0
        zscore_lzero <- (0 - as.numeric(laa[subdata_id[j], species_labels[k]])) / sigma_at_age[[i]][j, k]
        # length probability mass below zero, used for computing lenprob
        cprob_lzero <- cumd_norm(zscore_lzero)

        # first length bin
        # standardized normal values used for computing lenprob
        zscore_l <- ((mid_length_bin[1] + 0.5 * bin_width) - as.numeric(laa[subdata_id[j], species_labels[k]])) / sigma_at_age[[i]][j, k]
        # cumulative probabilities used for computing lenprob
        cprob_l <- c()
        cprob_l[1] <- cumd_norm(zscore_l) # includes any probability mass below zero
        lenpro[[i]][[j]][k, 1] <- cprob_l[1] - cprob_lzero # removes any probability mass below zero

        # most other length bins
        for (l in 2:(length(mid_length_bin) - 1)) {
            zscore_l <- ((mid_length_bin[l] + 0.5 * bin_width) - as.numeric(laa[subdata_id[j], species_labels[k]])) / sigma_at_age[[i]][j, k]
            cprob_l[l] <- cumd_norm(zscore_l)
            lenpro[[i]][[j]][k, l] <- cprob_l[l] - cprob_l[l-1]

        }
        # last length bin is a plus group
        zscore_l <- ((tail(mid_length_bin, 1) + 0.5 * bin_width) - as.numeric(laa[subdata_id[j], species_labels[k]])) / sigma_at_age[[i]][j, k]
        lenpro[[i]][[j]][k, length(mid_length_bin)] <- 1 - cumd_norm(zscore_l)
        lenpro[[i]][[j]][k, ] <- lenpro[[i]][[j]][k, ]/(1.0-cprob_lzero)
      }
    }

  }

  len_dist_bam <- laa_num_bam <- vector(mode = "list", length = survey_num)
  names(len_dist_bam) <- names(laa_num_bam) <- survey_name
  for (i in 1:survey_num) {
      subdata_id <- which((data$year %in% survey_time[[survey_name[i]]]$year) & (data$month %in% survey_time[[survey_name[i]]]$month))

      len_dist_bam[[i]] <- laa_num_bam[[i]] <- matrix(NA, nrow=length(subdata_id), ncol=nbin)
      row.names(len_dist_bam[[i]]) <- row.names(laa_num_bam[[i]]) <- survey_time[[survey_name[i]]]$year
      colnames(len_dist_bam[[i]]) <- colnames(laa_num_bam[[i]]) <- mid_length_bin
      for (j in 1:length(subdata_id)) {

          if (!is.na(sample_num[[i]][paste0(survey_time[[survey_name[i]]]$year[j])])) {
            len_dist_bam[[i]][j, ]<-t(lenpro[[i]][[j]]) %*% as.numeric(naa_sel[[i]][j, ])/sum(naa_sel[[i]][j, ])
          } else {
            len_dist_bam[[i]][j, ] <- NA
          }
          laa_num_bam[[i]][j, ] <- round(sample_num[[i]][paste0(survey_time[[survey_name[i]]]$year[j])] * len_dist_bam[[i]][j, ])
      }
  }

  output_data <- list(
    om_baa = om_baa,
    om_naa = om_naa,
    om_total_abundance = om_abundance,
    om_abundance_index = om_abundance_index,
    om_cv = survey_CV,
    om_sample_number = survey_sample_num,
    om_waa_mt = waa,
    om_laa = laa,
    obs_abundance_index = obs_abundance_index,
    obs_lencomp_proportion_ss3 = len_dist_ss3,
    obs_lencomp_proportion_bam = len_dist_bam,
    obs_lencomp_num_ss3 = laa_num_ss3,
    obs_lencomp_num_bam = laa_num_bam,
    units_info = list(
      units_biomass = "mt",
      units_abundance = "number of fish",
      units_weight = "mt",
      units_length = "cm"
    )
  )
  return(output_data)
}
