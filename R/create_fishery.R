#' @title Create fishery from Ecopath with Ecosim (EwE) output data
#'
#' @description This function creates fishery observations for an Ecosim scenario.
#'
#' @details The function takes fishery catch data from an Ecosim scenario.
#' The catch data are read in from Ecosim catch_annual.csv and the catch data are in biomass.
#' The function reads in total catch-at-age data of a specific species by age classes and time.
#' EwE already applies a fishery selectivity internally, so no need to reallocate catch if there is only one fleet for the fishery.
#'
#' @family create_data functions
#'
#' @param file_path A character string shows path to Ecosim catch output file (e.g., catch_annual.csv) is located.
#' @param skip_nrows interger; the number of lines of the data file to skip before reading data.
#' @param species The species to create fishery for. A vector of column names from the catch_annual.csv.
#' @param species_labels Customized names for species columns.
#' @param years A vector of years.
#' @param fleet_num Fleet number.
#' @param selectivity Selectivity at age. A data frame defining selectivity-at-age for a species over time. Columns represent age classes and rows represent years. Provide selectivity data only if \code{fleet_num} is greater than 1.
#' @param CV Coefficient of variation of catch. A vector of CVs for individual fleets.
#' @param sample_num Annual sample size. A vector of sample sizes for individual fleets.
#' @param waa_path A character string shows path to Ecosim weight output file (e.g., weight_annual.csv) is located.
#' @return A data list that includes catch and composition data from the EwE operating model, and observed catch and composition data for each fleet. Each fleet has time series catch with lognormal error and composition data with sampling error.
#'
#' @export
create_fishery <- function(file_path, skip_nrows, species, species_labels, years, fleet_num, selectivity = NULL, CV, sample_num, waa_path) {
  species_vec <- paste0("X", species)
  names(CV) <- years
  names(sample_num) <- years

  # Load catch data from catch_annual.csv
  temp <- scan(file_path, what = "", sep = "\n")
  data <- temp[-c(1:skip_nrows)]
  data <- read.table(
    text = as.character(data),
    sep = ",",
    col.names = read.table(text = temp[skip_nrows], sep = ",")
  )

  data <- data[which(data$year.group %in% years), c("year.group", species_vec)]
  data[, species_vec] <- data[, species_vec] * 1000000 # biomass in mt
  colnames(data) <- c("year", species_labels)

  annual_weight <- scan(waa_path, what = "", sep = "\n")
  waa <- annual_weight[-c(1:skip_nrows)]
  waa <- read.table(
    text = as.character(waa),
    sep = ",",
    col.names = read.table(text = annual_weight[skip_nrows], sep = ",")
  )
  waa <- waa[which(waa$year.group %in% years), c("year.group", species_vec)]
  colnames(waa) <- c("year", species_labels)
  waa[, species_labels] <- waa[, species_labels] / 1000 # weight in kg and need divide the value by 1000 to get mt

  catch_age_biomass <- data[, species_labels] # biomass in mt
  row.names(catch_age_biomass) <- years
  total_catch_biomass <- apply(catch_age_biomass, 1, sum)
  names(total_catch_biomass) <- years


  catch_age_abundance <- round(catch_age_biomass / (waa[, species_labels]))
  row.names(catch_age_abundance) <- years
  total_catch_abundance <- apply(catch_age_abundance, 1, sum)
  names(total_catch_abundance) <- years

  # create observed catch
  catch_obs <- vector(mode = "list", length = fleet_num)
  names(catch_obs) <- paste("fleet", 1:fleet_num, sep = "")
  if (fleet_num == 1) {
    n_catch <- length(total_catch_biomass)
    sd_catch <- sqrt(log(1 + CV^2)) # SD in log space, given CV in arithmetic space
    ln_catch <- rnorm(n_catch, mean = rep(0, length(years)), sd = sd_catch) # log error
    catch_obs[[1]] <- total_catch_biomass * exp(ln_catch) # multiplicative lognormal error
  }

  catch_age_obs <- vector(mode = "list", length = fleet_num)
  names(catch_age_obs) <- paste("fleet", 1:fleet_num, sep = "")

  for (i in 1:fleet_num) {
    catch_age_obs[[i]] <- catch_age_abundance
    for (j in 1:length(catch_obs[[i]])) {
      if (catch_obs[[i]][j] == 0) {
        probs <- rep(0, length(catch_age_obs[[i]][j, ]))
        catch_age_obs[[i]][j, ] <- rep(0, length(catch_age_obs[[i]][j, ]))
      } else {
        probs <- catch_age_obs[[i]][j, ] / sum(catch_age_obs[[i]][j, ])
        catch_age_obs[[i]][j, ] <- rmultinom(n = 1, size = sample_num[j], prob = probs) / sample_num[j]
      }
    }
    row.names(catch_age_obs[[i]]) <- years
  }

  output_data <- list(
    om_total_catch_biomass = total_catch_biomass,
    om_total_catch_abundance = total_catch_abundance,
    om_caa_abundance = catch_age_abundance,
    om_caa_biomass = catch_age_biomass,
    om_cv = CV,
    om_sample_number = sample_num,
    om_waa_mt = waa,
    obs_total_catch_biomass = catch_obs,
    obs_caa_prop = catch_age_obs,
    units_info = list(
      units_biomass = "mt",
      units_abundance = "number of fish",
      units_weight = "mt"
    )
  )
  return(output_data)
}
