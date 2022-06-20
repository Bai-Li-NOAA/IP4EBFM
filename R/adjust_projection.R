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

#' Adjust FMSY based on JABBA outputs
#'
#' @param FMSY A vector of FMSY estimates from JABBA outputs.
#' @param soi Status of indicator over time.
#' @param Bt_BMSY Biomass over BMSY estimates from JABBA outputs.
#' @return Adjusted projection values (i.e., FMSY).
#' @export
adjust_projection_jabba <- function(FMSY, soi, Bt_BMSY) {
  FMSY_lower <- min(FMSY)
  FMSY_upper <- max(FMSY)
  adjust_FMSY <- c()

  for (i in 1:length(FMSY)) {
    if (Bt_BMSY[i] > 1) adjust_FMSY[i] <- FMSY_lower + soi * (FMSY_upper - FMSY_lower)
    if (Bt_BMSY[i] <= 1 & Bt_BMSY[i] > 0.5) adjust_FMSY[i] <- soi * Bt_BMSY[i] * FMSY[i]
    if (Bt_BMSY[i] <= 0.5) adjust_FMSY[i] <- 0
  }

  return(adjust_FMSY)
}

#' Calculate catch for projections based on JABBA outputs
#'
#' @param fmsy_melted Melted data frame of Fmsy objects.
#' @param Bt Biomass in terminal model year from JABBA outputs.
#' @return Adjusted projection values (i.e., FMSY).
#' @export
adjust_projection_catcheco_jabba <- function(fmsy_melted, Bt){
  #Calculate projected catch by multiplying biomass by Feco
  projection_catch <- Bt * fmsy_melted$value
  return(projection_catch)
}
