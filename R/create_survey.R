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
#' @return A data list that includes survey indices and composition data from the EwE operating model, and observed survey indices and composition data for each survey. Each survey has time series catch with lognormal error and composition data with sampling error.
#'
#' @export
create_survey <- function(file_path, skip_nrows, species, species_labels, years, survey_num, survey_time, selectivity = NULL, catchability, CV, sample_num, waa_path) {
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

  # Calculate OM biomass-at-age (baa), number-at-age (naa), total abundance, and abundance index after including selectivity and catchability
  survey_name <- names(survey_time)
  om_baa <-
    om_naa <- om_abundance <- om_abundance_index <-
    vector(mode = "list", length = survey_num)
  names(om_baa) <-
    names(om_naa) <- names(om_abundance) <- names(om_abundance_index) <-
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
    naa_sel <- om_naa[[survey_name[i]]][, species_labels] * survey_selectivity[[survey_name[i]]][selectivity_id, ]

    catchability_id <- which(names(survey_catchability[[survey_name[i]]]) %in% survey_time[[survey_name[i]]]$year)

    om_abundance_index[[survey_name[i]]] <- apply(naa_sel, 1, sum) * survey_catchability[[survey_name[i]]][catchability_id]
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

  output_data <- list(
    om_baa = om_baa,
    om_naa = om_naa,
    om_total_abundance = om_abundance,
    om_abundance_index = om_abundance_index,
    om_cv = survey_CV,
    om_sample_number = survey_sample_num,
    om_waa_mt = waa,
    obs_abundance_index = obs_abundance_index,
    units_info = list(
      units_biomass = "mt",
      units_abundance = "number of fish",
      units_weight = "mt"
    )
  )
  return(output_data)
}
