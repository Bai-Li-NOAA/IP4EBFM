#' Adjust TAC based on DB-SRA outputs
#'
#' @param TAC A vector of TAC estimates from DB-SRA outputs.
#' @param soi Status of indicator over time.
#' @param Bt_BMSY Biomass over BMSY estimates from DB-SRA outputs.
#' @return Adjusted projection values (i.e., TAC).
#' @export
adjust_projection_dbsra <- function(tac, soi, Bt_BMSY) {
  tac_lower <- min(tac)
  tac_upper <- max(tac)
  adjust_tac <- c()

  for (i in 1:length(tac)) {
    if (Bt_BMSY[i] > 1) adjust_tac[i] <- tac_lower + soi * (tac_upper - tac_lower)
    if (Bt_BMSY[i] <= 1 & Bt_BMSY[i] > 0.5) adjust_tac[i] <- soi * Bt_BMSY[i] * tac[i]
    if (Bt_BMSY[i] <= 0.5) adjust_tac[i] <- 0
  }

  return(adjust_tac)
}
