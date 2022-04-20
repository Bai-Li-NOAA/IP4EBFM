#' Calculate status of an indicator over time
#'
#' @param indicator_data A time series data of an indicator (e.g., environmental, ecological, and economical indicators).
#' @param slope A single slope value from first-order linear regression analysis.
#' @return Status of an indicator over time.
#' @export
calc_soi <- function(indicator_data, slope) {
  min_val <- min(indicator_data, na.rm = T)
  max_val <- max(indicator_data, na.rm = T)

  if (slope > 0) soi <- (indicator_data - min_val) / (max_val - min_val)
  if (slope < 0) soi <- 1 - (indicator_data - min_val) / (max_val - min_val)

  return(soi)
}
