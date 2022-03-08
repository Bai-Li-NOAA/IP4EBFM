#' Download AMO data
#'
#' @description It downloads data from https://psl.noaa.gov/data/timeseries/AMO/, reshape the data to one column, and save the data to a specified location. It returns a dataframe with 2 columns. One column contains raw values and the other column contains scaled values with specified output range. 
#'
#' @param url url for downloading data.
#' @param years a vector of years.
#' @param output_dir path to output csv file.
#' @param scale_range output range (numeric vector of length two).
#' @import scales
#' @import data.table
#' @export
download_amo <- function(url, years, output_dir, scale_range=c(0, 2)) {
  data <- data.table::fread(url, fill = TRUE)
  data <- as.data.frame(data)
  amo <- data[data[, 1] %in% as.character(years), ]
  amo <- amo[, -1]
  amo <- data.table(v1 = c(t(amo)))
  amo <- as.data.frame(amo)
  colnames(amo) <- "raw_value"
  row.names(amo) <- paste0(rep(years, each=12), "_", rep(1:12, times=length(years)))
  amo$raw_value <- as.numeric(amo$raw_value)
  amo$scaled_value <- scales::rescale(amo$raw_value, to = scale_range)
  write.csv(amo, file = output_dir)
  return(amo)
}

#' Download data from NOAA NCEI
#'
#' @description It downloads monthly data from NOAA National Centers for Environmental Information (NCEI; https://www.ncdc.noaa.gov/cag/statewide/time-series), reshape the data to one column, and save the data to a specified location. It returns a dataframe with 2 columns. One column contains raw values and the other column contains scaled values with specified outpSut range. The values are average values from all states.
#'
#' @param years a vector of years.
#' @param states a vector of state names.
#' @param states_id a vector of corresponding state ids from the NCEI website.
#' @param parameter name of the parameter. Either "pcp" or "pdsi". pcp means precipitation and pdsi means Palmer Drought Severity Index.
#' @param output_dir path to output csv file.
#' @param scale_range output range (numeric vector of length two).
#' @import scales
#' @import data.table
#' @export
download_ncei <- function(years, states, states_id, parameter, output_dir, scale_range=c(0, 2)) {
  
  return_data <- as.data.frame(matrix(NA, nrow = length(years)*12, ncol=length(states_id)))

  for (i in 1:ncol(return_data)){
      data <- data.table::fread(paste0("https://www.ncdc.noaa.gov/cag/statewide/time-series/", states_id[i], "-", parameter, "-all-1-", years[1], "-", years[length(years)]+1, ".csv"))
      data <- as.data.frame(data)
      data <- data[-nrow(data), ]
      return_data[, i] <- data$Value
  }

  mean_value <- apply(return_data, 1, mean)
  mean_data <- data.frame(
    raw_value = mean_value,
    scaled_value = scales::rescale(mean_value, to = scale_range)
  )
  write.csv(mean_data, file = output_dir)
  return(mean_data)

}