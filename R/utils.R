#' Compute various logistic patterns
#'
#' @param pattern logistic function option. Options: "simple_logistic" and "double_logistic"
#' @param x Vector or scalar of indepenent variable
#' @param slope_asc Slope parameter for ascending curve
#' @param location_asc Location parameter for ascending curve
#' @param slope_desc Slope parameter for descending curve
#' @param location_desc Location parameter for descending curve
#' @return Values of function at \code{x}.
#' @examples
#' \dontrun{
#' logistic(pattern = "simple_logistic", x = c(1:12), slope_asc = 3, location_asc = 1.5)
#' logistic(pattern = "double_logistic", x = c(1:12), slope_asc = 3, location_asc = 1.5, slope_desc = 2, location_desc = 10)
#' }
#' @export
logistic <- function(pattern, x, slope_asc = NULL, location_asc = NULL, slope_desc = NULL, location_desc = NULL) {
  if (pattern == "simple_logistic") {
    output <- 1 / (1 + exp(-slope_asc * (x - location_asc)))
  }
  if (pattern == "double_logistic") {
    output_initial <- (1 / (1 + exp(-slope_asc * (x - location_asc)))) * (1 - (1 / (1 + exp(-slope_desc * (x - location_desc)))))
    output <- output_initial / max(output_initial)
  }
  return(output)
}
