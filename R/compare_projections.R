#' Compare projections from different DB-SRA cases
#'
#' @param case_name name of a case.
#' @param projection_output_data Output data frame from different DB-SRA cases.
#' @param projection_year A vector of projection years.
#' @param model_year A vector of model years.
#' @param amo AMO data.
#' @param pcp Precipitation data.
#' @param bassB Biomass of Striped bass data.
#' @param price Price of menhaden data.
#' @return A data list that includes slope values from linear regression models (lm_slope), status of indicator output (soi_data), adjusted TAC output (tac_data), reshaped status of indicator output (soi_data_melt), reshaped adjusted TAC output (tac_data_melt), and median adjusted tac over years (tac_data_melt_median).
#' @export
compare_projections_dbsra <- function(case_name,
                                      projection_output_data,
                                      projection_year,
                                      model_year,
                                      amo,
                                      pcp,
                                      bassB,
                                      price) {

  amo_unsmooth_lag1 <- amo
  precipitation <- pcp
  bass_bio <- bassB
  menhaden_price <- price

  lm_slope <- data.frame(
    case = case_name,
    projection_year = projection_year,
    amo = NA,
    pcp = NA,
    bassB = NA,
    price = NA
  )

  for (projection_year_id in 1:length(projection_year)){
    projection_output <- projection_output_data
    menhaden_b <- apply(projection_output[[projection_year_id]]$Btrend, 2, median)
    year_id <- seq(1, nrow(amo_unsmooth_lag1), by = 12)[1:(length(model_year)+projection_year_id-1)]

    if (projection_year_id == 1) {
      index_year = model_year
    } else {
      index_year <- c(model_year, projection_year[1:(projection_year_id-1)])
    }


    # Linear regression model -----------------------------------------

    amo <- amo_unsmooth_lag1[year_id, ]
    amo_lm <- lm(menhaden_b ~ amo$raw_value)
    summary(amo_lm)
    amo_fit <- fitted(amo_lm)
    lm_slope$amo[projection_year_id] <- paste0(
      round(summary(amo_lm)$coefficients[2, 1], digits = 2),
      if(summary(amo_lm)$coefficients[2, 4] <= 0.05) {"*"})

    pcp <- precipitation[year_id, ]
    pcp_lm <- lm(menhaden_b ~ pcp$raw_value)
    summary(pcp_lm)
    pcp_fit <- fitted(pcp_lm)
    lm_slope$pcp[projection_year_id] <- paste0(
      round(summary(pcp_lm)$coefficients[2, 1], digits = 2),
      if(summary(pcp_lm)$coefficients[2, 4] <= 0.05) {"*"})

    bassB <- bass_bio[bass_bio$Year %in% index_year, ]
    bassB_lm <- lm(menhaden_b ~ bassB$bass_bio)
    summary(bassB_lm)
    bassB_fit <- fitted(bassB_lm)
    lm_slope$bassB[projection_year_id] <- paste0(
      round(summary(bassB_lm)$coefficients[2, 1], digits = 2),
      if(summary(bassB_lm)$coefficients[2, 4] <= 0.05) {"*"})

    sub_menhaden_b <- menhaden_b[index_year %in% menhaden_price$Year]
    sub_menhadenP <- menhaden_price$Inflation.Adjust.Price.Per.MT[menhaden_price$Year %in% index_year]
    price_lm <- lm(sub_menhaden_b ~ sub_menhadenP)
    summary(price_lm)
    price_fit <- fitted(price_lm)
    lm_slope$price[projection_year_id] <- paste0(
      round(summary(price_lm)$coefficients[2, 1], digits = 2),
      if(summary(price_lm)$coefficients[2, 4] <= 0.05) {"*"})

    if (projection_year_id == length(projection_year)){

      par(mfrow = c(2, 2))

      plot(amo$raw_value, menhaden_b,
           xlab = "AMO raw values",
           ylab = "Biomass of menhaden-like species"
      )
      lines(amo$raw_value, amo_fit, lty = 2, col = "blue")

      plot(pcp$raw_value, menhaden_b,
           xlab = "Precipitation raw values",
           ylab = "Biomass of menhaden-like species"
      )
      lines(pcp$raw_value, pcp_fit, lty = 2, col = "blue")

      plot(bassB$bass_bio, menhaden_b,
           xlab = "Biomass of Striped bass",
           ylab = "Biomass of menhaden-like species"
      )
      lines(bassB$bass_bio, bassB_fit, lty = 2, col = "blue")

      plot(sub_menhadenP, sub_menhaden_b,
           xlab = "Menhaden price",
           ylab = "Biomass of menhaden-like species"
      )
      lines(sub_menhadenP, price_fit, lty = 2, col = "blue")

    }


    # status of indicators --------------------------------------------

    amo_soi <- calc_soi(
      indicator_data = amo$raw_value,
      slope = coef(amo_lm)[2]
    )

    pcp_soi <- calc_soi(
      indicator_data = pcp$raw_value,
      slope = coef(pcp_lm)[2]
    )

    bassB_soi <- calc_soi(
      indicator_data = bassB$bass_bio,
      slope = coef(bassB_lm)[2]
    )

    price_soi <- calc_soi(
      indicator_data = sub_menhadenP,
      slope = coef(price_lm)[2]
    )

    if (projection_year_id == 1) {
      scaled_data <- data.frame(
        year = model_year,
        projection_year_id = projection_year[projection_year_id],
        amo = scale(amo$raw_value)[,1],
        pcp = scale(pcp$raw_value)[,1],
        bassB = scale(bassB$bass_bio)[,1],
        price = scale(sub_menhadenP)[,1],
        menhadenB = scale(menhaden_b)[,1]
      )

      soi_data <- data.frame(
        year = model_year,
        projection_year_id = projection_year[projection_year_id],
        amo = amo_soi,
        pcp = pcp_soi,
        bass_b = bassB_soi,
        price = price_soi
      )
    } else{
      scaled_data <- rbind(
        scaled_data,
        data.frame(
          year = index_year,
          projection_year_id = projection_year[projection_year_id],
          amo = scale(amo$raw_value)[,1],
          pcp = scale(pcp$raw_value)[,1],
          bassB = scale(bassB$bass_bio)[,1],
          price = scale(sub_menhadenP)[,1],
          menhadenB = scale(menhaden_b)[,1]
        )
      )

      soi_data <- rbind(
        soi_data,
        data.frame(
          year = index_year,
          projection_year_id = projection_year[projection_year_id],
          amo = amo_soi,
          pcp = pcp_soi,
          bass_b = bassB_soi,
          price = price_soi
        )
      )
    }



    # Adjusted TAC ----------------------------------------------------

    Bt_BMSY <- projection_output[[projection_year_id]]$Bt_Kstore / projection_output[[projection_year_id]]$BMSY_K_Mstore

    amo_tac <- adjust_projection_dbsra(
      tac = projection_output[[projection_year_id]]$TAC,
      soi = tail(amo_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    pcp_tac <- adjust_projection_dbsra(
      tac = projection_output[[projection_year_id]]$TAC,
      soi = tail(pcp_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    bassB_tac <- adjust_projection_dbsra(
      tac = projection_output[[projection_year_id]]$TAC,
      soi = tail(bassB_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )
    price_tac <- adjust_projection_dbsra(
      tac = projection_output[[projection_year_id]]$TAC,
      soi = tail(price_soi, n = 1),
      Bt_BMSY = Bt_BMSY
    )

    if (projection_year_id == 1){
      tac_data <- data.frame(
        iter = 1:length(amo_tac),
        projection_year_id = projection_year[projection_year_id],
        DBSRA = projection_output[[projection_year_id]]$TAC,
        amo = amo_tac,
        pcp = pcp_tac,
        bassB = bassB_tac,
        price = price_tac
      )
    } else {
      tac_data <- rbind(
        tac_data,
        data.frame(
          iter = 1:length(amo_tac),
          projection_year_id = projection_year[projection_year_id],
          DBSRA = projection_output[[projection_year_id]]$TAC,
          amo = amo_tac,
          pcp = pcp_tac,
          bassB = bassB_tac,
          price = price_tac
        )
      )
    }
  }

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

  return(list(
    lm_slope = lm_slope,
    soi_data = soi_data,
    tac_data = tac_data,
    soi_data_melt = soi_data_melt,
    tac_data_melt = tac_data_melt,
    tac_data_melt_median = tac_data_melt_median
  ))

}
