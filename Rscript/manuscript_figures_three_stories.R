combine_figures <- function(lm_data, soi_data, bratio_data, projection_data,
                            em_name, scenario, indicator_id,
                            projection_indicator_name,
                            model_year, projection_year, figure_path,
                            scale_projection = TRUE) {

  if (length(indicator_id) == 0) {
    include_model <- c("OM")
    indicator_id <- paste0("I", 1:9)
    original_indicator_id <- 0
  } else {
    include_model <- c("OM", em_name)
    original_indicator_id <- 1
  }

  model_color <- hue_pal()(4)
  names(model_color) <- c(
    "OM", "Data-poor EM",
    "Data-moderate EM",
    "Data-rich EM"
  )
  indicator_color <- hue_pal()(11)
  names(indicator_color) <- c("OM", "FMSY-EM", paste0("Fadj-I", 1:9))

  indicator_shape <- 0:10
  names(indicator_shape) <- c("OM", "FMSY-EM", paste0("Fadj-I", 1:9))
  # Linear regression analysis figures
  data_subset <- lm_data[which(lm_data$model %in% c("OM", em_name) &
    lm_data$scenario == scenario &
    lm_data$model %in% include_model &
    lm_data$Variable %in% indicator_id), ]

  s1_lm_data <- data_subset[which(data_subset$Variable %in% paste0("I", c(1:3, 5, 6, 7))), ]

  lm_figure <- ggplot(
    data_subset,
    aes(x = Index_Value, y = Menhaden_Biomass, color = model)
  ) +
    geom_point() +
    scale_colour_manual(values = model_color[c("OM", em_name)]) +
    geom_smooth(method = lm) +
    facet_wrap(~ scenario + Variable, scales = "free", labeller = labeller(.multi_line = F)) +
    labs(
      x = "Indicator Value",
      y = "Log biomass (mt)"
    ) +
    theme_bw() +
    theme(
      legend.position = "none",
      axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
      strip.text = element_text(size = 15),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 15, face = "bold"),
      legend.text = element_text(size = 15),
      legend.title = element_text(size = 15, face = "bold")
    )

  # Status of indicators

  data_subset <- soi_data[which(soi_data$model %in% c("OM", em_name) &
    soi_data$scenario == scenario &
    soi_data$projection_year_id == 2013 &
    soi_data$model %in% include_model &
    soi_data$variable %in% indicator_id), ]

  s1_soi_data <- data_subset[which(data_subset$variable %in% paste0("I", c(1:3, 5, 6, 7))), ]

  soi_figure <- ggplot(
    data_subset,
    aes(x = year, y = value, color = model)
  ) +
    geom_point(data_subset[which(data_subset$year == tail(model_year, n = 1)), ],
      mapping = aes(x = year, y = value, pch = model), size = 2, alpha = 0.5
    ) +
    scale_colour_manual(values = model_color[c("OM", em_name)]) +
    geom_line(alpha = 0.5, linewidth = 1, aes(linetype = model)) +
    geom_hline(yintercept = 0.5, lty = 2) +
    facet_wrap(~ scenario + variable, labeller = labeller(.multi_line = F)) +
    labs(
      label = "",
      x = "Year",
      y = "Status of Indicator"
    ) +
    theme_bw() +
    theme(
      axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
      legend.position = "bottom",
      strip.text = element_text(size = 15),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 15, face = "bold"),
      legend.text = element_text(size = 15),
      legend.title = element_text(size = 15, face = "bold")
    )

  if(original_indicator_id == 0 &
     scenario == "S2" &
     em_name == "Data-poor EM"){

    lm_figure <- ggplot(
      s1_lm_data,
      aes(x = Index_Value, y = Menhaden_Biomass, color = model)
    ) +
      geom_point() +
      scale_colour_manual(values = model_color[c("OM", em_name)]) +
      geom_smooth(method = lm) +
      facet_wrap(~ scenario + Variable, scales = "free", labeller = labeller(.multi_line = F)) +
      labs(
        x = "Indicator Value",
        y = "Log biomass (mt)"
      ) +
      theme_bw() +
      theme(
        legend.position = "none",
        axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
        strip.text = element_text(size = 15),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 15, face = "bold"),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 15, face = "bold")
      )

    soi_figure <- ggplot(
      s1_soi_data,
      aes(x = year, y = value, color = model)
    ) +
      geom_point(data_subset[which(data_subset$year == tail(model_year, n = 1)), ],
                 mapping = aes(x = year, y = value, pch = model), size = 2, alpha = 0.5
      ) +
      scale_colour_manual(values = model_color[c("OM", em_name)]) +
      geom_line(alpha = 0.5, linewidth = 1, aes(linetype = model)) +
      geom_hline(yintercept = 0.5, lty = 2) +
      facet_wrap(~ scenario + variable, labeller = labeller(.multi_line = F)) +
      labs(
        label = "",
        x = "Year",
        y = "Status of Indicator"
      ) +
      theme_bw() +
      theme(
        axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
        legend.position = "bottom",
        strip.text = element_text(size = 15),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 15, face = "bold"),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 15, face = "bold")
      )
  }


  # Bratio

  data_subset <- bratio_data[which(bratio_data$model %in% c("OM", em_name) &
    bratio_data$scenario == scenario), ]

  bratio_figure <- ggplot(
    data_subset[!(data_subset$model == "OM"), ],
    aes(x = scenario, y = bratio)
  ) +
    geom_boxplot(outlier.size = 0.5, color = model_color[em_name]) +
    labs(
      x = "Scenario",
      y = bquote(B[2012] / B[MSY])
    ) +
    geom_point(data_subset[data_subset$model == "OM", ],
      mapping = aes(x = scenario, y = bratio), pch = 8,
      color = model_color["OM"], size = 5
    ) +
    theme_bw() +
    theme(
      axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
      legend.position = "bottom",
      strip.text = element_text(size = 15),
      axis.text = element_text(size = 12),
      axis.title = element_text(size = 15, face = "bold"),
      legend.text = element_text(size = 15),
      legend.title = element_text(size = 15, face = "bold")
    )


  # Projection

  data_subset <- projection_data[which(
    projection_data$Scenario == scenario &
      projection_data$Model %in% projection_indicator_name
  ), ]

  ensemble_data <- data_subset[which(data_subset$Year_type == "Projection" &
    data_subset$Data_type == "median" &
    !(data_subset$Model == "FMSY-EM")), ]
  if (nrow(ensemble_data) != 0) {
    ensemble_projection <- aggregate(value ~ Year + variable, data = ensemble_data, mean)
    ensemble_projection$Model <- "Ensemble model"
    ensemble_projection$Scenario <- scenario
    ensemble_projection$Data_type <- "ensemble mean"
    ensemble_projection$Year_type <- "Projection"
    ensemble_projection <- ensemble_projection[which(!(ensemble_projection$variable %in% c("F_average", "F_apical"))), ]
  } else {
    ensemble_projection <- c()
  }

  data_subset <- rbind(data_subset, ensemble_projection)

  percentage_change <- data_subset[which(data_subset$Year_type == "Projection"), ]
  percentage_change <- percentage_change %>%
    group_by(Year, variable) %>%
    mutate(percentage_change = (value - value[Model == "OM"]) / value[Model == "OM"] * 100)
  # percentage_change <- percentage_change %>%
  #   group_by(Year, variable) %>%
  #   mutate(percentage_change = (value-value[Model == "FMSY-EM"]) / value[Model == "FMSY-EM"]*100)
  merged_percentage_change <- merge(data_subset, percentage_change,
    by = c("Year", "Model", "Scenario", "Data_type", "variable", "Year_type")
  )
  colnames(merged_percentage_change) <- c("Year", "Model", "Scenario", "Data_type", "variable", "Year_type", "value", "value.y", "percentage_change")

  if (em_name == "Data-poor EM") {
    if (scale_projection == TRUE) {
      projection_figure <- ggplot() +
        geom_point(
          data_subset[which(data_subset$Model == "OM" & !(data_subset$Year %in% projection_year)), ],
          mapping = aes(x = Year, y = value), color = "black"
        ) +
        geom_line(
          data_subset[which(data_subset$Model == em_name & data_subset$Data_type == "mean"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          linetype = 2,
          data_subset[which(data_subset$Data_type == "ci_lower"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          linetype = 2,
          data_subset[which(data_subset$Data_type == "ci_upper"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        #############################################################
      geom_line(
        data_subset[which(data_subset$Year_type == "Projection" & data_subset$variable == "F_apical" &
                            !(data_subset$Model %in% c("Data-poor EM", "Ensemble model")) &
                            !(data_subset$Data_type %in% c("min", "max"))), ],
        mapping = aes(
          x = Year, y = value,
          color = Model
        ),
        linewidth = 0.7
      ) +
        geom_line(
          data_subset[which(data_subset$Data_type == "min"), ],
          mapping = aes(
            x = Year, y = value,
            color = Model
          ),
          linetype = 2
        ) +
        geom_line(
          data_subset[which(data_subset$Data_type == "max"), ],
          mapping = aes(
            x = Year, y = value,
            color = Model
          ),
          linetype = 2
        ) +
        geom_point(
          data_subset[which(data_subset$Year_type == "Projection" & data_subset$variable == "F_apical" &
                              !(data_subset$Model %in% c("Data-poor EM", "Ensemble model"))), ],
          mapping = aes(
            x = Year, y = value,
            color = Model, shape = Model
          )
        ) +

        geom_line(
          merged_percentage_change[which(#merged_percentage_change$Data_type == "median" &
                                           # !(merged_percentage_change$Model == "FMSY-EM") &
                                           !(merged_percentage_change$Model == "Data-poor EM") &
                                           !(merged_percentage_change$Data_type == "ensemble mean") &
                                           !(merged_percentage_change$variable == "F_apical")), ],
          mapping = aes(
            x = Year, y = percentage_change,
            color = Model
          ),
          linewidth = 0.7
        ) +
        geom_point(
          merged_percentage_change[which(#merged_percentage_change$Data_type == "median" &
                                           # !(merged_percentage_change$Model == "FMSY-EM") &
                                           !(merged_percentage_change$Model == "Data-poor EM") &
                                           !(merged_percentage_change$Data_type == "ensemble mean") &
                                           !(merged_percentage_change$variable == "F_apical")), ],
          mapping = aes(
            x = Year, y = percentage_change,
            color = Model, shape = Model
          )
        ) +

        geom_line(
          linetype = "twodash",
          merged_percentage_change[which(merged_percentage_change$Data_type == "ensemble mean" &
                                           !(merged_percentage_change$variable == "F_apical")), ],
          mapping = aes(x = Year, y = percentage_change), color = "gray50"
        ) +
        facet_wrap(
          Scenario ~ variable + Year_type,
          scales = "free", ncol = 4, labeller = labeller(.multi_line = F)
        ) +
        scale_colour_manual("Augmented F", values = indicator_color[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        scale_shape_manual("Augmented F", values = indicator_shape[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        labs(
          color = "Augmented F",
          shape = "Augmented F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 15),
          axis.text = element_text(size = 12),
          axis.title = element_text(size = 15, face = "bold"),
          legend.text = element_text(size = 15),
          legend.title = element_text(size = 15, face = "bold")
        )

      projection_withoutci_figure <- ggplot() +
        geom_point(
          data_subset[which(data_subset$Model == "OM" & !(data_subset$Year %in% projection_year)), ],
          mapping = aes(x = Year, y = value), color = "black"
        ) +
        geom_point(
          merged_percentage_change[which(merged_percentage_change$Model == "FMSY-EM" &
            !(merged_percentage_change$variable == "F_average")), ],
          mapping = aes(x = Year, y = percentage_change), color = "gray50"
        ) +
        geom_line(
          data_subset[which(data_subset$Model == em_name & data_subset$Data_type == "mean"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          merged_percentage_change[which(merged_percentage_change$Data_type == "median" & !(merged_percentage_change$Model == "FMSY-EM") & !(merged_percentage_change$Model == "Data-poor EM")), ],
          mapping = aes(x = Year, y = percentage_change, colour = Model), linewidth = 0.7
        ) +
        geom_line(linetype = 2, merged_percentage_change[which(merged_percentage_change$Data_type == "ensemble mean"), ], mapping = aes(x = Year, y = percentage_change), color = "gray50") +
        facet_wrap(
          Scenario ~ variable + Year_type,
          scales = "free", ncol = 4, labeller = labeller(.multi_line = F)
        ) +
        labs(
          color = "Augmented F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 15),
          axis.text = element_text(size = 12),
          axis.title = element_text(size = 15, face = "bold"),
          legend.text = element_text(size = 15),
          legend.title = element_text(size = 15, face = "bold")
        )
    } else {
      projection_figure <- ggplot() +
        geom_point(
          data_subset[which(data_subset$Model == "OM" & !(data_subset$Year %in% projection_year)), ],
          mapping = aes(x = Year, y = value), color = "black"
        ) +
        geom_point(
          data_subset[which(data_subset$Model == "FMSY-EM"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          data_subset[which(data_subset$Model == em_name & data_subset$Data_type == "mean"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          linetype = 2,
          data_subset[which(data_subset$Data_type == "ci_lower"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          linetype = 2,
          data_subset[which(data_subset$Data_type == "ci_upper"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          data_subset[which(data_subset$Data_type == "median" & !(data_subset$Model == "FMSY-EM") & !(data_subset$Model == "Data-poor EM")), ],
          mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7
        ) +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ensemble mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        facet_wrap(
          Scenario ~ variable + Year_type,
          scales = "free", ncol = 4, labeller = labeller(.multi_line = F)
        ) +
        labs(
          color = "Augmented F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 15),
          axis.text = element_text(size = 12),
          axis.title = element_text(size = 15, face = "bold"),
          legend.text = element_text(size = 15),
          legend.title = element_text(size = 15, face = "bold")
        )

      projection_withoutci_figure <- ggplot() +
        geom_point(
          data_subset[which(data_subset$Model == "OM" & !(data_subset$Year %in% projection_year)), ],
          mapping = aes(x = Year, y = value), color = "black"
        ) +
        geom_point(
          data_subset[which(data_subset$Model == "FMSY-EM"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          data_subset[which(data_subset$Model == em_name & data_subset$Data_type == "mean"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          data_subset[which(data_subset$Data_type == "median" & !(data_subset$Model == "FMSY-EM") & !(data_subset$Model == "Data-poor EM")), ],
          mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7
        ) +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ensemble mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        facet_wrap(
          Scenario ~ variable + Year_type,
          scales = "free", ncol = 4, labeller = labeller(.multi_line = F)
        ) +
        labs(
          color = "Augmented F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 15),
          axis.text = element_text(size = 12),
          axis.title = element_text(size = 15, face = "bold"),
          legend.text = element_text(size = 15),
          legend.title = element_text(size = 15, face = "bold")
        )
    }
  }

  if (em_name == "Data-moderate EM") {
    if (scale_projection == TRUE) {
      data_subset$variable <- factor(data_subset$variable,
                                     levels = c("Recruitment", "Biomass", "SB",
                                                "Landings", "F_average", "F_apical"))
      projection_figure <- ggplot() +
        geom_point(data_subset[which(data_subset$Model == "OM" &
                                       !(data_subset$Year %in% projection_year) &
                                       !(data_subset$variable == "F_apical")), ],
                   mapping = aes(x = Year, y = value), size = 0.8, color = "black"
        ) +
        # geom_point(merged_percentage_change[which(merged_percentage_change$Model == "FMSY-EM" &
        #                                             !(merged_percentage_change$variable %in% c("F_average", "F_apical"))), ],
        #            mapping = aes(x = Year, y = percentage_change), color = "gray50"
        # ) +
        geom_line(data_subset[which(data_subset$Model == em_name & data_subset$Data_type == "mean"), ],
                  mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          linetype = 2, data_subset[which(data_subset$Data_type == "ci_lower"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(
          linetype = 2, data_subset[which(data_subset$Data_type == "ci_upper"), ],
          mapping = aes(x = Year, y = value), color = "gray50"
        ) +
        geom_line(data_subset[which(data_subset$Year_type == "Projection" &
                                      data_subset$variable == "F_apical" &
                                      !(data_subset$Model == "Data-moderate EM") &
                                      !(data_subset$Data_type %in% c("min", "max"))), ],
                  mapping = aes(
                    x = Year, y = value,
                    color = Model
                  ), size = 0.7
        ) +
        geom_line(
          data_subset[which(data_subset$Data_type == "min"), ],
          mapping = aes(
            x = Year, y = value,
            color = Model
          ),
          linetype = 2
        ) +
        geom_line(
          data_subset[which(data_subset$Data_type == "max"), ],
          mapping = aes(
            x = Year, y = value,
            color = Model
          ),
          linetype = 2
        ) +
        geom_point(
          data_subset[which(data_subset$Year_type == "Projection" &
                              data_subset$variable == "F_apical" &
                              !(data_subset$Model == "Data-moderate EM")), ],
          mapping = aes(
            x = Year, y = value,
            color = Model, shape = Model
          )
        ) +
        geom_line(
          merged_percentage_change[which(#merged_percentage_change$Data_type == "median" &
                                           # !(merged_percentage_change$Model == "FMSY-EM") &
                                           !(merged_percentage_change$Model == "Data-moderate EM") &
                                           !(merged_percentage_change$Data_type == "ensemble mean") &
                                           !(merged_percentage_change$variable %in% c("F_average", "F_apical"))), ],
          mapping = aes(
            x = Year, y = percentage_change,
            color = Model
          ),
          linewidth = 0.7
        ) +
        geom_point(
          merged_percentage_change[which(#merged_percentage_change$Data_type == "median" &
                                           # !(merged_percentage_change$Model == "FMSY-EM") &
                                           !(merged_percentage_change$Model == "Data-moderate EM") &
                                           !(merged_percentage_change$Data_type == "ensemble mean") &
                                           !(merged_percentage_change$variable %in% c("F_average", "F_apical"))), ],
          mapping = aes(
            x = Year, y = percentage_change,
            color = Model, shape = Model
          )
        ) +
        geom_line(
          linetype = "twodash",
          merged_percentage_change[which(merged_percentage_change$Data_type == "ensemble mean"&
                                           !(merged_percentage_change$variable %in% c("F_average", "F_apical"))), ],
          mapping = aes(x = Year, y = percentage_change), color = "gray50"
        ) +
        facet_wrap(Scenario ~ variable + Year_type, scales = "free", ncol = 4, labeller = labeller(.multi_line = F)) +
        scale_colour_manual("Augmented F", values = indicator_color[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        scale_shape_manual("Augmented F", values = indicator_shape[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        labs(
          color = "Augmented F",
          shape = "Augmented F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 15),
          axis.text = element_text(size = 12),
          axis.title = element_text(size = 15, face = "bold"),
          legend.text = element_text(size = 15),
          legend.title = element_text(size = 15, face = "bold")
        )
    } else {
      projection_figure <- ggplot() +
        geom_point(data_subset[which(data_subset$Model == "OM" & !(data_subset$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), size = 0.8, color = "black") +
        geom_point(data_subset[which(data_subset$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(data_subset[which(data_subset$Model == em_name & data_subset$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ci_lower"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ci_upper"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(data_subset[which(data_subset$Data_type == "median" & !(data_subset$Model == "FMSY-EM")), ], mapping = aes(x = Year, y = value, colour = Model), size = 0.7) +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ensemble mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        facet_wrap(Scenario ~ variable + Year_type, scales = "free", ncol = 4, labeller = labeller(.multi_line = F)) +
        labs(
          color = "Augmented F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 15),
          axis.text = element_text(size = 12),
          axis.title = element_text(size = 15, face = "bold"),
          legend.text = element_text(size = 15),
          legend.title = element_text(size = 15, face = "bold")
        )
    }
  }

  if (em_name == "Data-rich EM") {
    if (scale_projection == TRUE) {
      projection_figure <- ggplot() +
        geom_point(data_subset[which(data_subset$Model == "OM" & !(data_subset$Year %in% projection_year)), ],
                   mapping = aes(x = Year, y = value), size = 0.8, color = "black") +

        # geom_point(merged_percentage_change[which(merged_percentage_change$Model == "FMSY-EM"&
        #                                             !(merged_percentage_change$variable == "F_apical")), ],
        #            mapping = aes(x = Year, y = percentage_change), color = "gray50") +

        geom_line(data_subset[which(data_subset$Model == em_name & data_subset$Data_type == "mean"), ],
                  mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ci_lower"), ],
                  mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ci_upper"), ],
                  mapping = aes(x = Year, y = value), color = "gray50") +

        geom_line(
          data_subset[which(data_subset$Year_type == "Projection" & data_subset$variable == "F_apical" &
                              !(data_subset$Model %in% c("Data-rich EM", "Ensemble model")) &
                              !(data_subset$Data_type %in% c("min", "max"))), ],
          mapping = aes(
            x = Year, y = value,
            color = Model
          ),
          linewidth = 0.7
        ) +
        geom_line(
          data_subset[which(data_subset$Data_type == "min"), ],
          mapping = aes(
            x = Year, y = value,
            color = Model
          ),
          linetype = 2
        ) +
        geom_line(
          data_subset[which(data_subset$Data_type == "max"), ],
          mapping = aes(
            x = Year, y = value,
            color = Model
          ),
          linetype = 2
        ) +
        geom_point(
          data_subset[which(data_subset$Year_type == "Projection" & data_subset$variable == "F_apical" &
                              !(data_subset$Model %in% c("Data-rich EM", "Ensemble model"))), ],
          mapping = aes(
            x = Year, y = value,
            color = Model, shape = Model
          )
        ) +
        geom_line(
          merged_percentage_change[which(#merged_percentage_change$Data_type == "median" &
                                           # !(merged_percentage_change$Model == "FMSY-EM") &
                                           !(merged_percentage_change$Model == "Data-rich EM") &
                                           !(merged_percentage_change$Data_type == "ensemble mean") &
                                           !(merged_percentage_change$variable == "F_apical")), ],
          mapping = aes(
            x = Year, y = percentage_change,
            color = Model
          ),
          linewidth = 0.7
        ) +
        geom_point(
          merged_percentage_change[which(#merged_percentage_change$Data_type == "median" &
                                           # !(merged_percentage_change$Model == "FMSY-EM") &
                                           !(merged_percentage_change$Model == "Data-rich EM") &
                                           !(merged_percentage_change$Data_type == "ensemble mean") &
                                           !(merged_percentage_change$variable == "F_apical")), ],
          mapping = aes(
            x = Year, y = percentage_change,
            color = Model, shape = Model
          )
        ) +
        geom_line(linetype = "twodash",
                  merged_percentage_change[which(merged_percentage_change$Data_type == "ensemble mean"&
                                                   !(merged_percentage_change$variable == "F_apical")), ],
                  mapping = aes(x = Year, y = percentage_change), color = "gray50") +
        facet_wrap(Scenario ~ variable + Year_type, scales = "free", ncol = 4, labeller = labeller(.multi_line = F)) +
        scale_colour_manual("Augmented F", values = indicator_color[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        scale_shape_manual("Augmented F", values = indicator_shape[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        labs(
          color = "Augmented F",
          shape = "Augmented F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 15),
          axis.text = element_text(size = 12),
          axis.title = element_text(size = 15, face = "bold"),
          legend.text = element_text(size = 15),
          legend.title = element_text(size = 15, face = "bold")
        )
    } else {
      projection_figure <- ggplot() +
        geom_point(data_subset[which(data_subset$Model == "OM" & !(data_subset$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), size = 0.8, color = "black") +
        geom_point(data_subset[which(data_subset$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(data_subset[which(data_subset$Model == em_name & data_subset$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ci_lower"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ci_upper"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        geom_line(data_subset[which(data_subset$Data_type == "median" & !(data_subset$Model == "FMSY-EM")), ], mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7) +
        geom_line(linetype = 2, data_subset[which(data_subset$Data_type == "ensemble mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
        facet_wrap(Scenario ~ variable + Year_type, scales = "free", ncol = 4, labeller = labeller(.multi_line = F)) +
        labs(
          color = "Augmented F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 15),
          axis.text = element_text(size = 12),
          axis.title = element_text(size = 15, face = "bold"),
          legend.text = element_text(size = 15),
          legend.title = element_text(size = 15, face = "bold")
        )
    }
  }




  # Combine figures
  # With lm_figure
  if (length(indicator_id) == 0) {

  }
  ggpubr::ggarrange(
    ggpubr::ggarrange(
      lm_figure,
      soi_figure,
      ncol = 2,
      labels = c("A)", "B)")
    ),
    ggpubr::ggarrange(
      bratio_figure,
      projection_figure,
      ncol = 2,
      widths = c(0.5, 1.5),
      labels = c("C)", "D)")
    ),
    nrow = 2,
    heights = c(0.5, 0.5)
  )
  ggsave(paste0(figure_path, "_with_lm.jpeg"))

  # Without lm_figure
  ggpubr::ggarrange(
    ggpubr::ggarrange(
      soi_figure,
      bratio_figure,
      ncol = 2,
      widths = c(1.5, 0.5),
      labels = c("A", "B")
    ),
    projection_figure,
    heights = c(0.5, 0.5),
    labels = c("", "C"),
    nrow = 2
  )
  ggsave(paste0(figure_path, "_without_lm.jpeg"))


  if (em_name == "Data-poor EM") {
    # With lm_figure
    ggpubr::ggarrange(
      ggpubr::ggarrange(
        lm_figure,
        soi_figure,
        ncol = 2,
        labels = c("A)", "B)")
      ),
      ggpubr::ggarrange(
        bratio_figure,
        projection_withoutci_figure,
        ncol = 2,
        widths = c(0.5, 1.5),
        labels = c("C)", "D)")
      ),
      nrow = 2,
      heights = c(0.5, 0.5)
    )
    ggsave(paste0(figure_path, "_with_lm_without_ci.jpeg"))

    # Without lm_figure
    ggpubr::ggarrange(
      ggpubr::ggarrange(
        soi_figure,
        bratio_figure,
        ncol = 2,
        widths = c(1.5, 0.5),
        labels = c("A", "B")
      ),
      projection_withoutci_figure,
      heights = c(0.5, 0.5),
      labels = c("", "C"),
      nrow = 2
    )
    ggsave(paste0(figure_path, "_without_lm_without_ci.jpeg"))
  }
}

figure_path <- here::here("figure", "manuscript_figures")
if (!dir.exists(figure_path)) dir.create(figure_path)
# Data-poor figures -------------------------------------------------------

# S1
combine_figures(
  lm_data = lm_data,
  soi_data = soi_data,
  bratio_data = bratio_data,
  projection_data = data_poor_data,
  em_name = "Data-poor EM",
  scenario = "S1",
  indicator_id = c("I5"),
  projection_indicator_name = c(
    "OM", "Data-poor EM", "FMSY-EM", "Fadj-I5"
  ),
  model_year = model_year,
  projection_year = projection_year,
  figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_poor_S1_combined")),
  scale_projection = TRUE
)

# S2
combine_figures(
  lm_data = lm_data,
  soi_data = soi_data,
  bratio_data = bratio_data,
  projection_data = data_poor_data,
  em_name = "Data-poor EM",
  scenario = "S2",
  indicator_id = c("I7"),
  projection_indicator_name = c(
    "OM", "Data-poor EM", "FMSY-EM", "Fadj-I7"
  ),
  model_year = model_year,
  projection_year = projection_year,
  figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_poor_S2_combined")),
  scale_projection = TRUE
)

# S3
combine_figures(
  lm_data = lm_data,
  soi_data = soi_data,
  bratio_data = bratio_data,
  projection_data = data_poor_data,
  em_name = "Data-poor EM",
  scenario = "S3",
  indicator_id = c(),
  projection_indicator_name = c(
    "OM", "Data-poor EM", "FMSY-EM"),
  model_year = model_year,
  projection_year = projection_year,
  figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_poor_S3_combined")),
  scale_projection = TRUE
)


# Data-moderate figures ---------------------------------------------------
# S1
combine_figures(
  lm_data = lm_data,
  soi_data = soi_data,
  bratio_data = bratio_data,
  projection_data = data_moderate_data,
  em_name = "Data-moderate EM",
  scenario = "S1",
  indicator_id = c("I9"),
  projection_indicator_name = c(
    "OM", "Data-moderate EM", "FMSY-EM"),
  model_year = model_year,
  projection_year = projection_year,
  figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_moderate_S1_combined")),
  scale_projection = TRUE
)

# S2
combine_figures(
  lm_data = lm_data,
  soi_data = soi_data,
  bratio_data = bratio_data,
  projection_data = data_moderate_data,
  em_name = "Data-moderate EM",
  scenario = "S2",
  indicator_id = c("I1", "I9"),
  projection_indicator_name = c(
    "OM", "Data-moderate EM", "FMSY-EM", "Fadj-I1", "Fadj-I9"
  ),
  model_year = model_year,
  projection_year = projection_year,
  figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_moderate_S2_combined")),
  scale_projection = TRUE
)

# S3
combine_figures(
  lm_data = lm_data,
  soi_data = soi_data,
  bratio_data = bratio_data,
  projection_data = data_moderate_data,
  em_name = "Data-moderate EM",
  scenario = "S3",
  indicator_id = c(),
  projection_indicator_name = c(
    "OM", "Data-moderate EM", "FMSY-EM"),
  model_year = model_year,
  projection_year = projection_year,
  figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_moderate_S3_combined")),
  scale_projection = TRUE
)

# S2 for WFC
# lm_data_wfc <- lm_data[which(lm_data$scenario == "S2" & lm_data$Variable %in% paste0("I", c(1, 3))), ]
# soi_data_wfc <- soi_data[which(soi_data$scenario == "S2" & soi_data$variable %in% paste0("I", c(1, 3))), ]
#
# combine_figures(
#   lm_data = lm_data_wfc,
#   soi_data = soi_data_wfc,
#   bratio_data = bratio_data,
#   projection_data = data_moderate_data,
#   em_name = "Data-moderate EM",
#   scenario = "S2",
#   indicator_id = paste0("I", c(1, 3, 8)),
#   projection_indicator_name = c(
#     "OM", "Data-moderate EM", "FMSY-EM", "Fadj-AMO", "Fadj-Predator biomass"
#   ),
#   model_year = model_year,
#   projection_year = projection_year,
#   figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_moderate_S2_combined_wfc")),
#   scale_projection = TRUE
# )


# Data-rich figures -------------------------------------------------------
# S1
combine_figures(
  lm_data = lm_data,
  soi_data = soi_data,
  bratio_data = bratio_data,
  projection_data = data_rich_data,
  em_name = "Data-rich EM",
  scenario = "S1",
  indicator_id = paste0("I", c(4, 9)),
  projection_indicator_name = c(
    "OM", "Data-rich EM", "FMSY-EM", "Fadj-I4", "Fadj-I9"
  ),
  model_year = model_year,
  projection_year = projection_year,
  figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_rich_S1_combined")),
  scale_projection = TRUE
)

# S2
combine_figures(
  lm_data = lm_data,
  soi_data = soi_data,
  bratio_data = bratio_data,
  projection_data = data_rich_data,
  em_name = "Data-rich EM",
  scenario = "S2",
  indicator_id = paste0("I", c(1, 4, 9)),
  projection_indicator_name = c(
    "OM", "Data-rich EM", "FMSY-EM", "Fadj-I1", "Fadj-I4", "Fadj-I8",
    "Fadj-I9"
  ),
  model_year = model_year,
  projection_year = projection_year,
  figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_rich_S2_combined.jpeg")),
  scale_projection = TRUE
)

# S3
combine_figures(
  lm_data = lm_data,
  soi_data = soi_data,
  bratio_data = bratio_data,
  projection_data = data_rich_data,
  em_name = "Data-rich EM",
  scenario = "S3",
  indicator_id = paste0("I", c(9)),
  projection_indicator_name = c("OM", "Data-rich EM", "FMSY-EM", "Fadj-I9"),
  model_year = model_year,
  projection_year = projection_year,
  figure_path = file.path(figure_path, paste0(terminal_year, scenario_filename, "_data_rich_S3_combined")),
  scale_projection = TRUE
)
