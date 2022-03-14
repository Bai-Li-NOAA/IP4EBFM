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

#' Cumulative normal distribution
#'
#' @param x A normalized "Z" score value (subtract the mean and divide by the standard deviation).
#' @return Probability that of an observation will exceed the argument.
#'
#' @export
cumd_norm <- function(x) {

  # rewrite ADMB cumd_norm function in R: http://api.admb-project.org/cumdist_8cpp_source.html#l00090
  b1 <- 0.319381530
  b2 <- -0.356563782
  b3 <- 1.781477937
  b4 <- -1.821255978
  b5 <- 1.330274429
  p <- 0.2316419
  if (is.na(x)) {
    z <- NA
  } else {
    if (x >= 0) {
      u <- 1.0 / (1 + p * x)
      y <- ((((b5 * u + b4) * u + b3) * u + b2) * u + b1) * u
      z <- 1.0 - 0.3989422804 * exp(-0.5 * x * x) * y
    } else {
      w <- -x
      u <- 1.0 / (1 + p * w)
      y <- ((((b5 * u + b4) * u + b3) * u + b2) * u + b1) * u
      z <- 0.3989422804 * exp(-0.5 * x * x) * y
    }
  }


  return(z)
}
