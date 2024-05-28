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

  for (projection_year_id in 1:length(projection_year)) {
    projection_output <- projection_output_data
    menhaden_b <- apply(projection_output[[projection_year_id]]$Btrend, 2, median)
    year_id <- seq(1, nrow(amo_unsmooth_lag1), by = 12)[1:(length(model_year) + projection_year_id - 1)]

    if (projection_year_id == 1) {
      index_year <- model_year
    } else {
      index_year <- c(model_year, projection_year[1:(projection_year_id - 1)])
    }

    biomass_lag_id <- (1 + lag):length(index_year)
    index_lag_id <- 1:(length(index_year) - lag)

    # y <- data_transformation(menhaden_b[biomass_lag_id])
    y <- log(menhaden_b[biomass_lag_id])

    # Linear regression model -----------------------------------------
    # amo
    amo <- amo_unsmooth_lag1[year_id, ]
    amo_x <- amo$scaled_value[index_lag_id]
    lm_slope$amo[projection_year_id] <- regression_analysis(x = amo_x, y)[[1]]
    amo_model <- regression_analysis(x = amo_x, y)[[2]]

    # pdsi
    pdsi <- palmer_drought_severity_index[year_id, ]
    pdsi_x <- pdsi$scaled_value[index_lag_id]
    lm_slope$pdsi[projection_year_id] <- regression_analysis(x = pdsi_x, y)[[1]]
    pdsi_model <- regression_analysis(x = pdsi_x, y)[[2]]

    # bassB
    bassB <- bass_bio[bass_bio$Year %in% year_id, ]
    bassB_x <- bassB$bass_bio[index_lag_id]
    lm_slope$bassB[projection_year_id] <- regression_analysis(x = bassB_x, y)[[1]]
    bassB_model <- regression_analysis(x = bassB_x, y)[[2]]

    # menhadenC
    menhadenC <- sa_data$fishery$obs_total_catch_biomass$fleet1[1:length(year_id)]
    menhadenC_x <- menhadenC[index_lag_id]
    lm_slope$menhadenC[projection_year_id] <- regression_analysis(x = menhadenC_x, y)[[1]]
    menhadenC_model <- regression_analysis(x = menhadenC_x, y)[[2]]

    # menhadenE
    menhadenE <- menhaden_effort[1:length(year_id)]
    menhadenE_x <- menhadenE[index_lag_id]
    lm_slope$menhadenE[projection_year_id] <- regression_analysis(x = menhadenE_x, y)[[1]]
    menhadenE_model <- regression_analysis(x = menhadenE_x, y)[[2]]

    # menhadenCPUE
    menhadenCPUE <- menhaden_cpue[1:length(year_id)]
    menhadenCPUE_x <- menhadenCPUE[index_lag_id]
    lm_slope$menhadenCPUE[projection_year_id] <- regression_analysis(x = menhadenCPUE_x, y)[[1]]
    menhadenCPUE_model <- regression_analysis(x = menhadenCPUE_x, y)[[2]]

    # bassCPUE
    bassCPUE <- bass_cpue[1:length(year_id)]
    bassCPUE_x <- bassCPUE[index_lag_id]
    lm_slope$bassCPUE[projection_year_id] <- regression_analysis(x = bassCPUE_x, y)[[1]]
    bassCPUE_model <- regression_analysis(x = bassCPUE_x, y)[[2]]

    # herringCPUE
    herringCPUE <- herring_cpue[1:length(year_id)]
    herringCPUE_x <- herringCPUE[index_lag_id]
    lm_slope$herringCPUE[projection_year_id] <- regression_analysis(x = herringCPUE_x, y)[[1]]
    herringCPUE_model <- regression_analysis(x = herringCPUE_x, y)[[2]]

    menhadenV <- menhaden_value[1:length(year_id)]
    menhadenV_x <- menhadenV[index_lag_id]
    lm_slope$menhadenV[projection_year_id] <- regression_analysis(x = menhadenV_x, y)[[1]]
    menhadenV_model <- regression_analysis(x = menhadenV_x, y)[[2]]

    if (projection_year_id == 1) {
      lm_data_em <- rbind(
        data.frame(
          Menhaden_Biomass = y,
          Variable = "AMO",
          Index_Value = amo_x
        ),
        data.frame(
          Menhaden_Biomass = y,
          Variable = "PDSI",
          Index_Value = pdsi_x
        ),
        data.frame(
          Menhaden_Biomass = y,
          Variable = "Biomass of Striped bass",
          Index_Value = bassB_x
        ),
        data.frame(
          Menhaden_Biomass = y,
          Variable = "Menhaden Catch",
          Index_Value = menhadenC_x
        ),
        data.frame(
          Menhaden_Biomass = y,
          Variable = "Menhaden fishing effort",
          Index_Value = menhadenE_x
        ),
        data.frame(
          Menhaden_Biomass = y,
          Variable = "Menhaden CPUE",
          Index_Value = menhadenCPUE_x
        ),
        data.frame(
          Menhaden_Biomass = y,
          Variable = "Bass CPUE",
          Index_Value = bassCPUE_x
        ),
        data.frame(
          Menhaden_Biomass = y,
          Variable = "Herring CPUE",
          Index_Value = herringCPUE_x
        ),
        data.frame(
          Menhaden_Biomass = y,
          Variable = "Menhaden Ex-vessel Value",
          Index_Value = menhadenV_x
        )
      )
      lm_data_em$model <- "EM"
    }

    # status of indicators --------------------------------------------

    amo_soi <- calc_soi(
      # indicator_data = data_transformation(amo$scaled_value),
      indicator_data = amo$scaled_value,
      slope = coef(amo_model)["x_vec"]
    )

    pdsi_soi <- calc_soi(
      # indicator_data = data_transformation(pdsi$scaled_value),
      indicator_data = pdsi$scaled_value,
      slope = coef(pdsi_model)["x_vec"]
    )

    bassB_soi <- calc_soi(
      # indicator_data = bassB$bass_bio,
      indicator_data = data_transformation(bassB$bass_bio),
      slope = coef(bassB_model)["x_vec"]
    )

    menhadenC_soi <- calc_soi(
      # indicator_data = data_transformation(menhadenC),
      indicator_data = menhadenC,
      slope = coef(menhadenC_model)["x_vec"]
    )

    menhadenE_soi <- calc_soi(
      # indicator_data = data_transformation(menhadenE),
      indicator_data = menhadenE,
      slope = coef(menhadenE_model)["x_vec"]
    )

    menhadenCPUE_soi <- calc_soi(
      # indicator_data = data_transformation(menhadenCPUE),
      indicator_data = menhadenCPUE,
      slope = coef(menhadenCPUE_model)["x_vec"]
    )

    bassCPUE_soi <- calc_soi(
      # indicator_data = data_transformation(bassCPUE),
      indicator_data = bassCPUE,
      slope = coef(bassCPUE_model)["x_vec"]
    )

    herringCPUE_soi <- calc_soi(
      # indicator_data = data_transformation(herringCPUE),
      indicator_data = herringCPUE,
      slope = coef(herringCPUE_model)["x_vec"]
    )

    menhadenV_soi <- calc_soi(
      # indicator_data = data_transformation(menhadenV),
      indicator_data = menhadenV,
      slope = coef(menhadenV_model)["x_vec"]
    )

    if (projection_year_id == 1) {
      scaled_data <- data.frame(
        year = model_year,
        projection_year_id = projection_year[projection_year_id],
        amo = scale(amo$scaled_value)[, 1],
        pdsi = scale(pdsi$scaled_value)[, 1],
        bassB = scale(bassB$bass_bio)[, 1],
        menhadenC = scale(menhadenC)[, 1],
        menhadenE = scale(menhadenE)[, 1],
        menhadenCPUE = scale(menhadenCPUE)[, 1],
        bassCPUE = scale(bassCPUE)[, 1],
        herringCPUE = scale(herringCPUE)[, 1],
        menhadenV = scale(menhadenV)[, 1],
        menhadenB = scale(menhaden_b)[, 1]
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
    } else {
      scaled_data <- rbind(
        scaled_data,
        data.frame(
          year = index_year,
          projection_year_id = projection_year[projection_year_id],
          amo = scale(amo$scaled_value)[, 1],
          pdsi = scale(pdsi$scaled_value)[, 1],
          bassB = scale(bassB$bass_bio)[, 1],
          menhadenC = scale(menhadenC)[, 1],
          menhadenE = scale(menhadenE)[, 1],
          menhadenCPUE = scale(menhadenCPUE)[, 1],
          bassCPUE = scale(bassCPUE)[, 1],
          herringCPUE = scale(herringCPUE)[, 1],
          menhadenV = scale(menhadenV)[, 1],
          menhadenB = scale(menhaden_b)[, 1]
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

    if (projection_year_id == 1) {
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

  tac_data_melt_median <- aggregate(value ~ projection_year_id + variable, data = tac_data_melt, median)
  tac_data_melt_median$projection_year_id <- as.numeric(as.character(tac_data_melt_median$projection_year_id))

  fmsy_data_melt <- reshape2::melt(
    fmsy_data,
    id = c("iter", "projection_year_id")
  )
  fmsy_data_melt$projection_year_id <- as.factor(fmsy_data_melt$projection_year_id)

  fmsy_data_melt_median <- aggregate(value ~ projection_year_id + variable, data = fmsy_data_melt, median)
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
