#' Compare projections from different DB-SRA cases
#'
#' @param case_name name of a case.
#' @param projection_output_data Output data frame from different DB-SRA cases.
#' @param projection_year A vector of projection years.
#' @param model_year A vector of model years.
#' @param lag Lag between biomass of menhaden-like species and indices.
#' @param amo AMO data.
#' @param pdsi Palmer drought severity index data.
#' @param bassB Biomass of Striped bass data.
#' @param menhadenC Catch of menhaden-like species from the EwE operating model.
#' @param menhadenE Fishing effort of menhaden-like species from the EwE operating model.
#' @param menhadenCPUE Catch per unit effort of menhaden-like species from the EwE operating model.
#' @param bassCPUE Catch per unit effort of bass-like species from the EwE operating model.
#' @param herringCPUE Catch per unit effort of herring-like species from the EwE operating model.
#' @param menhadenV Ex-vessel value of menhaden-like species.
#' @param indices Indices will be used in the analysis.
#' @return A data list that includes slope values from linear regression models (lm_slope), status of indicator output (soi_data), adjusted TAC output (tac_data), reshaped status of indicator output (soi_data_melt), reshaped adjusted TAC output (tac_data_melt), and median adjusted tac over years (tac_data_melt_median).
#' @export
compare_projections_dbsra <- function(case_name,
                                      projection_output_data,
                                      projection_year,
                                      model_year,
                                      lag = 0,
                                      amo,
                                      pdsi,
                                      bassB,
                                      menhadenC,
                                      menhadenE,
                                      menhadenCPUE,
                                      bassCPUE,
                                      herringCPUE,
                                      menhadenV,
                                      indices) {

  amo_unsmooth_lag1 <- amo
  palmer_drought_severity_index <- pdsi
  bass_bio <- bassB
  menhaden_catch <- menhadenC
  menhaden_effort <- menhadenE
  menhaden_cpue <- menhadenCPUE
  bass_cpue <- bassCPUE
  herring_cpue <- herringCPUE
  menhaden_value <- menhadenV

  lm_slope <- data.frame(
    case = case_name,
    projection_year = projection_year,
    amo = NA,
    pdsi = NA,
    bassB = NA,
    menhadenC = NA,
    menhadenE = NA,
    menhadenCPUE = NA,
    bassCPUE = NA,
    herringCPUE = NA,
    menhadenV = NA
  )

  Bt_BMSY_list <- vector(mode = "list", length = length(projection_year))

  for (projection_year_id in 1:length(projection_year)){
    projection_output <- projection_output_data
    menhaden_b <- apply(projection_output[[projection_year_id]]$Btrend, 2, median)
    year_id <- seq(1, nrow(amo_unsmooth_lag1), by = 12)[1:(length(model_year)+projection_year_id-1)]

    if (projection_year_id == 1) {
      index_year = model_year
    } else {
      index_year <- c(model_year, projection_year[1:(projection_year_id-1)])
    }

    biomass_lag_id <- (1+lag):length(index_year)
    index_lag_id <- 1:(length(index_year)-lag)

    shapiro.test(menhaden_b[biomass_lag_id]) # < 0.05, data is not normally distributed
    shapiro.test(log(menhaden_b[biomass_lag_id])) # < 0.05, data is not normally distributed
    log_menhaden_b <- log(menhaden_b[biomass_lag_id])

    # Linear regression model -----------------------------------------

    amo <- amo_unsmooth_lag1[year_id, ]
    amo_lm <- lm(log_menhaden_b ~ amo$scaled_value[index_lag_id])
    summary(amo_lm)
    amo_fit <- fitted(amo_lm)
    lm_slope$amo[projection_year_id] <- paste0(
      round(summary(amo_lm)$coefficients[2, 1], digits = 2),
      if(summary(amo_lm)$coefficients[2, 4] <= 0.05) {"*"})

    pdsi <- palmer_drought_severity_index[year_id, ]
    pdsi_lm <- lm(log_menhaden_b ~ pdsi$scaled_value[index_lag_id])
    pdsi_fit <- fitted(pdsi_lm)
    lm_slope$pdsi[projection_year_id] <- paste0(
      round(summary(pdsi_lm)$coefficients[2, 1], digits = 2),
      if(summary(pdsi_lm)$coefficients[2, 4] <= 0.05) {"*"})

    bassB <- bass_bio[bass_bio$Year %in% year_id, ]
    shapiro.test(bassB$bass_bio[index_lag_id]) # > 0.05, data is normally distributed
    bassB_lm <- lm(log_menhaden_b ~ bassB$bass_bio[index_lag_id])
    summary(bassB_lm)
    bassB_fit <- fitted(bassB_lm)
    lm_slope$bassB[projection_year_id] <- paste0(
      round(summary(bassB_lm)$coefficients[2, 1], digits = 2),
      if(summary(bassB_lm)$coefficients[2, 4] <= 0.05) {"*"})

    menhadenC <- sa_data$fishery$obs_total_catch_biomass$fleet1[1:length(year_id)]
    shapiro.test(menhadenC) # < 0.05, data is not normally distributed
    shapiro.test(log(menhadenC)) # < 0.05, data is not normally distributed
    menhadenC_lm <- lm(log_menhaden_b ~ log(menhadenC[index_lag_id]))
    summary(menhadenC_lm)
    menhadenC_fit <- fitted(menhadenC_lm)
    lm_slope$menhadenC[projection_year_id] <- paste0(
      round(summary(menhadenC_lm)$coefficients[2, 1], digits = 2),
      if(summary(menhadenC_lm)$coefficients[2, 4] <= 0.05) {"*"})

    menhadenE <- menhaden_effort[1:length(year_id)]
    shapiro.test(menhadenE) # < 0.05, data is not normally distributed
    shapiro.test(log(menhadenE)) # < 0.05, data is not normally distributed
    menhadenE_lm <- lm(log_menhaden_b ~ log(menhadenE[index_lag_id]))
    summary(menhadenE_lm)
    menhadenE_fit <- fitted(menhadenE_lm)
    lm_slope$menhadenE[projection_year_id] <- paste0(
      round(summary(menhadenE_lm)$coefficients[2, 1], digits = 2),
      if(summary(menhadenE_lm)$coefficients[2, 4] <= 0.05) {"*"})

    menhadenCPUE <- menhaden_cpue[1:length(year_id)]
    shapiro.test(menhadenCPUE) # < 0.05, data is not normally distributed
    shapiro.test(log(menhadenCPUE)) # < 0.05, data is not normally distributed
    menhadenCPUE_lm <- lm(log_menhaden_b ~ menhadenCPUE[index_lag_id])
    summary(menhadenCPUE_lm)
    menhadenCPUE_fit <- fitted(menhadenCPUE_lm)
    lm_slope$menhadenCPUE[projection_year_id] <- paste0(
      round(summary(menhadenCPUE_lm)$coefficients[2, 1], digits = 2),
      if(summary(menhadenCPUE_lm)$coefficients[2, 4] <= 0.05) {"*"})

    bassCPUE <- bass_cpue[1:length(year_id)]
    shapiro.test(bassCPUE) # > 0.05, data is normally distributed
    bassCPUE_lm <- lm(log_menhaden_b ~ bassCPUE[index_lag_id])
    summary(bassCPUE_lm)
    bassCPUE_fit <- fitted(bassCPUE_lm)
    lm_slope$bassCPUE[projection_year_id] <- paste0(
      round(summary(bassCPUE_lm)$coefficients[2, 1], digits = 2),
      if(summary(bassCPUE_lm)$coefficients[2, 4] <= 0.05) {"*"})

    herringCPUE <- herring_cpue[1:length(year_id)]
    shapiro.test(herringCPUE) # < 0.05, data is not normally distributed
    shapiro.test(log(herringCPUE)) # < 0.05, data is not normally distributed
    herringCPUE_lm <- lm(log_menhaden_b ~ herringCPUE[index_lag_id])
    summary(herringCPUE_lm)
    herringCPUE_fit <- fitted(herringCPUE_lm)
    lm_slope$herringCPUE[projection_year_id] <- paste0(
      round(summary(herringCPUE_lm)$coefficients[2, 1], digits = 2),
      if(summary(herringCPUE_lm)$coefficients[2, 4] <= 0.05) {"*"})

    menhadenV <- menhaden_value[1:length(year_id)]
    shapiro.test(menhadenV) # < 0.05, data is not normally distributed
    shapiro.test(log(menhadenV)) # < 0.05, data is not normally distributed
    menhadenV_lm <- lm(log_menhaden_b ~ log(menhadenV[index_lag_id]))
    summary(menhadenV_lm)
    menhadenV_fit <- fitted(menhadenV_lm)
    lm_slope$menhadenV[projection_year_id] <- paste0(
      round(summary(menhadenV_lm)$coefficients[2, 1], digits = 2),
      if(summary(menhadenV_lm)$coefficients[2, 4] <= 0.05) {"*"})

    if (projection_year_id == 1) {
      lm_data_em <- rbind(
        data.frame(
          Menhaden_Biomass = log_menhaden_b,
          Variable = "AMO",
          Index_Value = amo$scaled_value[index_lag_id]
        ),
        data.frame(
          Menhaden_Biomass = log_menhaden_b,
          Variable = "PDSI",
          Index_Value = pdsi$scaled_value[index_lag_id]
        ),
        data.frame(
          Menhaden_Biomass = log_menhaden_b,
          Variable = "Biomass of Striped bass",
          Index_Value = bassB$bass_bio[index_lag_id]
        ),
        data.frame(
          Menhaden_Biomass = log_menhaden_b,
          Variable = "Menhaden Catch",
          Index_Value = log(menhadenC[index_lag_id])
        ),
        data.frame(
          Menhaden_Biomass = log_menhaden_b,
          Variable = "Menhaden fishing effort",
          Index_Value = log(menhadenE[index_lag_id])
        ),
        data.frame(
          Menhaden_Biomass = log_menhaden_b,
          Variable = "Menhaden CPUE",
          Index_Value = menhadenCPUE[index_lag_id]
        ),
        data.frame(
          Menhaden_Biomass = log_menhaden_b,
          Variable = "Bass CPUE",
          Index_Value = bassCPUE[index_lag_id]
        ),
        data.frame(
          Menhaden_Biomass = log_menhaden_b,
          Variable = "Herring CPUE",
          Index_Value = herringCPUE[index_lag_id]
        ),
        data.frame(
          Menhaden_Biomass = log_menhaden_b,
          Variable = "Menhaden Ex-vessel Value",
          Index_Value = log(menhadenV[index_lag_id])
        )
      )
      lm_data_em$model <- "EM"
    }

    # if (projection_year_id == length(projection_year)){
    #
    #   par(mfrow = c(ceiling(length(indices)/2), 2))
    #
    #   if ("amo" %in% indices){
    #     plot(amo$scaled_value[index_lag_id], menhaden_b[biomass_lag_id],
    #          xlab = "AMO values",
    #          ylab = "Biomass of menhaden-like species"
    #     )
    #     abline(amo_lm)
    #   }
    #
    #   if ("pcp" %in% indices){
    #     plot(pcp$scaled_value[index_lag_id], menhaden_b[biomass_lag_id],
    #          xlab = "Precipitation values",
    #          ylab = "Biomass of menhaden-like species"
    #     )
    #     abline(pcp_lm)
    #   }
    #
    #   if ("pdsi" %in% indices){
    #     plot(pdsi$scaled_value[index_lag_id], menhaden_b[biomass_lag_id],
    #          xlab = "PDSI values",
    #          ylab = "Biomass of menhaden-like species"
    #     )
    #     abline(pdsi_lm)
    #   }
    #
    #   if ("bassB" %in% indices){
    #     plot(bassB$bass_bio[index_lag_id], menhaden_b[biomass_lag_id],
    #          xlab = "Biomass of Striped bass",
    #          ylab = "Biomass of menhaden-like species"
    #     )
    #     abline(bassB_lm)
    #   }
    #
    #   if ("price" %in% indices){
    #     plot(sub_menhadenP[index_lag_id], sub_menhaden_b[biomass_lag_id],
    #          xlab = "Menhaden price",
    #          ylab = "Biomass of menhaden-like species"
    #     )
    #     abline(price_lm)
    #   }
    #
    #   if ("effort" %in% indices){
    #     plot(effort[index_lag_id], menhaden_b[biomass_lag_id],
    #          xlab = "Fishing effort of menhaden-like species",
    #          ylab = "Biomass of menhaden-like species"
    #     )
    #     abline(effort_lm)
    #   }
    #
    # }

    # status of indicators --------------------------------------------

    amo_soi <- calc_soi(
      indicator_data = amo$scaled_value,
      slope = coef(amo_lm)[2]
    )

    pdsi_soi <- calc_soi(
      indicator_data = pdsi$scaled_value,
      slope = coef(pdsi_lm)[2]
    )

    bassB_soi <- calc_soi(
      indicator_data = bassB$bass_bio,
      slope = coef(bassB_lm)[2]
    )

    menhadenC_soi <- calc_soi(
      indicator_data = menhadenC,
      slope = coef(menhadenC_lm)[2]
    )

    menhadenE_soi <- calc_soi(
      indicator_data = menhadenE,
      slope = coef(menhadenE_lm)[2]
    )

    menhadenCPUE_soi <- calc_soi(
      indicator_data = menhadenCPUE,
      slope = coef(menhadenCPUE_lm)[2]
    )

    bassCPUE_soi <- calc_soi(
      indicator_data = bassCPUE,
      slope = coef(bassCPUE_lm)[2]
    )

    herringCPUE_soi <- calc_soi(
      indicator_data = herringCPUE,
      slope = coef(herringCPUE_lm)[2]
    )

    menhadenV_soi <- calc_soi(
      indicator_data = menhadenV,
      slope = coef(menhadenV_lm)[2]
    )

    if (projection_year_id == 1) {
      scaled_data <- data.frame(
        year = model_year,
        projection_year_id = projection_year[projection_year_id],
        amo = scale(amo$scaled_value)[,1],
        pdsi = scale(pdsi$scaled_value)[,1],
        bassB = scale(bassB$bass_bio)[,1],
        menhadenC = scale(menhadenC)[,1],
        menhadenE = scale(menhadenE)[,1],
        menhadenCPUE = scale(menhadenCPUE)[,1],
        bassCPUE = scale(bassCPUE)[,1],
        herringCPUE = scale(herringCPUE)[,1],
        menhadenV = scale(menhadenV)[,1],
        menhadenB = scale(menhaden_b)[,1]
      )

      soi_data <- data.frame(
        year = model_year,
        projection_year_id = projection_year[projection_year_id],
        amo = amo_soi,
        pdsi = pdsi_soi,
        bassB = bassB_soi,
        menhadenC = menhadenC_soi,
        menhadenE = menhadenE_soi,
        menhadenCPUE = menhadenCPUE_soi,
        bassCPUE = bassCPUE_soi,
        herringCPUE = herringCPUE_soi,
        menhadenV = menhadenV_soi
      )
    } else{
      scaled_data <- rbind(
        scaled_data,
        data.frame(
          year = index_year,
          projection_year_id = projection_year[projection_year_id],
          amo = scale(amo$scaled_value)[,1],
          pdsi = scale(pdsi$scaled_value)[,1],
          bassB = scale(bassB$bass_bio)[,1],
          menhadenC = scale(menhadenC)[,1],
          menhadenE = scale(menhadenE)[,1],
          menhadenCPUE = scale(menhadenCPUE)[,1],
          bassCPUE = scale(bassCPUE)[,1],
          herringCPUE = scale(herringCPUE)[,1],
          menhadenV = scale(menhadenV)[,1],
          menhadenB = scale(menhaden_b)[,1]
        )
      )

      soi_data <- rbind(
        soi_data,
        data.frame(
          year = index_year,
          projection_year_id = projection_year[projection_year_id],
          amo = amo_soi,
          pdsi = pdsi_soi,
          bassB = bassB_soi,
          menhadenC = menhadenC_soi,
          menhadenE = menhadenE_soi,
          menhadenCPUE = menhadenCPUE_soi,
          bassCPUE = bassCPUE_soi,
          herringCPUE = herringCPUE_soi,
          menhadenV = menhadenV_soi
        )
      )
    }

    # Adjusted TAC ----------------------------------------------------

    Bt_BMSY <- projection_output[[projection_year_id]]$Bt_Kstore / projection_output[[projection_year_id]]$BMSY_K_Mstore
    Bt_BMSY_list[[projection_year_id]] <- Bt_BMSY
    amo_tac <- adjust_projection_dbsra(
      # tac = projection_output[[projection_year_id]]$TAC,
      tac = projection_output[[projection_year_id]]$FMSYstore,
      soi = tail(amo_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    pdsi_tac <- adjust_projection_dbsra(
      # tac = projection_output[[projection_year_id]]$TAC,
      tac = projection_output[[projection_year_id]]$FMSYstore,
      soi = tail(pdsi_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    bassB_tac <- adjust_projection_dbsra(
      # tac = projection_output[[projection_year_id]]$TAC,
      tac = projection_output[[projection_year_id]]$FMSYstore,
      soi = tail(bassB_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    menhadenC_tac <- adjust_projection_dbsra(
      # tac = projection_output[[projection_year_id]]$TAC,
      tac = projection_output[[projection_year_id]]$FMSYstore,
      soi = tail(menhadenC_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    menhadenE_tac <- adjust_projection_dbsra(
      # tac = projection_output[[projection_year_id]]$TAC,
      tac = projection_output[[projection_year_id]]$FMSYstore,
      soi = tail(menhadenE_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    menhadenCPUE_tac <- adjust_projection_dbsra(
      # tac = projection_output[[projection_year_id]]$TAC,
      tac = projection_output[[projection_year_id]]$FMSYstore,
      soi = tail(menhadenCPUE_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    bassCPUE_tac <- adjust_projection_dbsra(
      # tac = projection_output[[projection_year_id]]$TAC,
      tac = projection_output[[projection_year_id]]$FMSYstore,
      soi = tail(bassCPUE_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    herringCPUE_tac <- adjust_projection_dbsra(
      # tac = projection_output[[projection_year_id]]$TAC,
      tac = projection_output[[projection_year_id]]$FMSYstore,
      soi = tail(herringCPUE_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    menhadenV_tac <- adjust_projection_dbsra(
      # tac = projection_output[[projection_year_id]]$TAC,
      tac = projection_output[[projection_year_id]]$FMSYstore,
      soi = tail(menhadenV_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )

    if (projection_year_id == 1){
      tac_data <- data.frame(
        iter = 1:length(amo_tac),
        projection_year_id = projection_year[projection_year_id],
        DBSRA = projection_output[[projection_year_id]]$TAC,
        FMSY = projection_output[[projection_year_id]]$FMSYstore,
        amo = amo_tac,
        pdsi = pdsi_tac,
        bassB = bassB_tac,
        menhadenC = menhadenC_tac,
        menhadenE = menhadenE_tac,
        menhadenCPUE = menhadenCPUE_tac,
        bassCPUE = bassCPUE_tac,
        herringCPUE = herringCPUE_tac,
        menhadenV = menhadenV_tac
      )
    } else {
      tac_data <- rbind(
        tac_data,
        data.frame(
          iter = 1:length(amo_tac),
          projection_year_id = projection_year[projection_year_id],
          DBSRA = projection_output[[projection_year_id]]$TAC,
          FMSY = projection_output[[projection_year_id]]$FMSYstore,
          amo = amo_tac,
          pdsi = pdsi_tac,
          bassB = bassB_tac,
          menhadenC = menhadenC_tac,
          menhadenE = menhadenE_tac,
          menhadenCPUE = menhadenCPUE_tac,
          bassCPUE = bassCPUE_tac,
          herringCPUE = herringCPUE_tac,
          menhadenV = menhadenV_tac
        )
      )
    }
  }

  lm_slope <- lm_slope[, c("case", "projection_year", indices)]
  scaled_data <- scaled_data[, c("year", "projection_year_id", indices, "menhadenB")]
  soi_data <- soi_data[, c("year", "projection_year_id", indices)]
  fmsy_data <- tac_data[, c("iter", "projection_year_id", "FMSY", indices)]
  tac_data <- tac_data[, c("iter", "projection_year_id", "DBSRA", indices)]


  soi_data_melt <- reshape2::melt(
    soi_data,
    id = c("year", "projection_year_id")
  )
  soi_data_melt$projection_year_id <- as.factor(soi_data_melt$projection_year_id)

  tac_data_melt <- reshape2::melt(
    tac_data,
    id = c("iter", "projection_year_id")
  )
  tac_data_melt$projection_year_id <- as.factor(tac_data_melt$projection_year_id)

  tac_data_melt_median <- aggregate(value ~ projection_year_id+variable, data = tac_data_melt, median)
  tac_data_melt_median$projection_year_id <- as.numeric(as.character(tac_data_melt_median$projection_year_id))

  fmsy_data_melt <- reshape2::melt(
    fmsy_data,
    id = c("iter", "projection_year_id")
  )
  fmsy_data_melt$projection_year_id <- as.factor(fmsy_data_melt$projection_year_id)

  fmsy_data_melt_median <- aggregate(value ~ projection_year_id+variable, data = fmsy_data_melt, median)
  fmsy_data_melt_median$projection_year_id <- as.numeric(as.character(fmsy_data_melt_median$projection_year_id))

  return(list(
    lm_data_em = lm_data_em,
    lm_slope = lm_slope,
    soi_data = soi_data,
    tac_data = tac_data,
    soi_data_melt = soi_data_melt,
    tac_data_melt = tac_data_melt,
    tac_data_melt_median = tac_data_melt_median,
    fmsy_data_melt = fmsy_data_melt,
    fmsy_data_melt_median = fmsy_data_melt_median,
    Bt_BMSY_list = Bt_BMSY_list
  ))

}
