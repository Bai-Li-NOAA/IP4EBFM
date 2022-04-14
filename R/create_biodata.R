#' @title Create biological data
#'
#' @description This function creates a data list that contains remaining biological data for a stock assessment
#'
#' @details The function takes EwE input or output data to create weight-at-age matrix, maturity-at-age matrix,
#'
#' @family create_data functions
#'
#'@param nsex Number of sexes of the species.
#'@param narea Number of areas.
#'@param ages A vector of ages.
#'@param years A vector of years for extracting EwE data.
#'@param length_bin A vector of length bins.
#'@param mid_length_bin A vector of middle point of the length bins.
#'@param nbin Total number of bins.
#'@param bin_width Width of bins.
#'@param length_CV CV about length.
#'@param annual_weight_path A character string shows path to Ecosim annual weight-at-age output file is located.
#'@param monthly_weight_path A character string shows path to Ecosim monthly weight-at-age output file is located.
#'@param species The species to create fishery for. A vector of column names from the catch_annual.csv.
#'@param species_labels Customized names for species columns.
#'@param skip_nrows integer; the number of lines of the data file to skip before reading data.
#'@param lw_a Length-weight coefficients a. W=a*L^b. Default EwE value is 0.01.
#'@param lw_b Length-weight coefficients b. W=a*L^b. Default EwE value is 3.
#'@param k Growth rate parameter of the von Bertalanffy model.
#'@param t0 Theoretical age at size 0. Default EwE value is -0.1.
#'@param winf Asymptotic average weight. EwE weight-at-age calculated as Wa = (1-exp(k*age))^3.
#'@param maturity_at_age A vector of maturity-at-age value or time-varying maturity-at-age matrix with rows present years and columns represent ages.
#'@param natural_mortality_at_age A vector of natural mortality-at-age value or time-varying natural mortality-at-age matrix with rows present years and columns represent ages.
#'@return A data list that includes biological data for set up a stock assessment.
#'
#' @export
create_biodata <- function(nsex=1, narea=1, ages, years, length_bin, mid_length_bin, nbin, bin_width, length_CV, annual_weight_path, monthly_weight_path, species, species_labels, skip_nrows, lw_a=0.01, lw_b=3, k, t0=-0.1, winf, maturity_at_age, natural_mortality_at_age) {

  species_vec <- paste0("X", species)

  # Load monthly weight data
  weight <- scan(monthly_weight_path, what = "", sep = "\n")
  waa <- weight[-c(1:skip_nrows)]
  waa <- read.table(
    text = as.character(waa),
    sep = ",",
    col.names = read.table(text = weight[skip_nrows], sep = ",")
  )
  waa$year <- rep(years, each = 12)
  waa$month <- rep(1:12, times = length(years))

  monthly_waa <- waa[, c("timestep.group", "year", "month", species_vec)]
  colnames(monthly_waa) <- c("year", "year", "month", species_labels)

  monthly_waa[, species_labels] <- monthly_waa[, species_labels] / 1000 # weight in kg and need divide the value by 1000 to get mt

  # Load annual weight data
  annual_weight <- scan(annual_weight_path, what = "", sep = "\n")
  waa <- annual_weight[-c(1:skip_nrows)]
  waa <- read.table(
    text = as.character(waa),
    sep = ",",
    col.names = read.table(text = annual_weight[skip_nrows], sep = ",")
  )
  annual_waa <- waa[which(waa$year.group %in% years), c("year.group", species_vec)]
  colnames(annual_waa) <- c("year", species_labels)
  annual_waa[, species_labels] <- annual_waa[, species_labels] / 1000 # weight in kg and need divide the value by 1000 to get mt

  # maturity-at-age matrix
  if (length(maturity_at_age) == length(ages)) maturity_matrix <- t(replicate(length(years), maturity_at_age))
  if (length(maturity_at_age) != length(ages)) maturity_matrix <- maturity_at_age
  colnames(maturity_matrix) <- paste0("age", ages)
  row.names(maturity_matrix) <- years

  # natural mortality matrix
  if (length(natural_mortality_at_age) == length(ages)) natural_mortality_matrix <- t(replicate(length(years), natural_mortality_at_age))
  if (length(natural_mortality_at_age) != length(ages)) natural_mortality_matrix <- natural_mortality_at_age

  colnames(natural_mortality_matrix) <- paste0("age", ages)
  row.names(natural_mortality_matrix) <- years

  output <- list(
    nsex = nsex,
    narea = narea,
    ages = ages,
    years = years,
    length_bin = length_bin,
    mid_length_bin = mid_length_bin,
    nbin = nbin,
    bin_width = bin_width,
    length_CV = length_CV,
    monthly_waa = monthly_waa,
    annual_waa = annual_waa,
    lw_a = lw_a,
    lw_b = lw_b,
    k = k,
    t0 = t0,
    winf = winf,
    maturity_matrix = maturity_matrix,
    natural_mortality_matrix = natural_mortality_matrix

  )

  return(output)

}
