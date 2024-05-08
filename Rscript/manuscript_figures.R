

# Load required packages --------------------------------------------------

library(ggplot2)
library(viridis) # scale_fill_viridis()

# Scenario information ----------------------------------------------------
projection_year <- 2013:2017
model_year <- 1985:2012

scenario_filename <- "_lowCV"
terminal_year <- 2012
fishery_CV_input <- 0.05
survey_CV_input <- 0.1

add_environmental_effects_vec <- c(FALSE, TRUE, TRUE)
add_fleet_dynamics_vec <- c(FALSE, FALSE, TRUE)

for (scenario_id in seq_along(add_environmental_effects_vec)){
  add_environmental_effects <- add_environmental_effects_vec[scenario_id]
  add_fleet_dynamics <- add_fleet_dynamics_vec[scenario_id]

  project_path <- here::here()
  if (add_environmental_effects == FALSE){
    ewe_scenario_name <- "ecosim_base_run"
    ewe_output_path <- file.path(project_path, "data", "ewe", "7ages_ecosim_om",
                                 ewe_scenario_name)
  }

  if (
    add_environmental_effects == TRUE &
    add_fleet_dynamics == FALSE
  ) {
    ewe_scenario_name <- "ecosim_forcing_pdsi_egg_amo1"
    ewe_output_path <- file.path(project_path, "data", "ewe", "7ages_ecosim_om",
                                 ewe_scenario_name)

  }

  if (add_fleet_dynamics == TRUE) {
    ewe_scenario_name <- "ecosim_fleet_dynamics"
    ewe_output_path <- file.path(project_path, "data", "ewe", "7ages_ecosim_om",
                                 ewe_scenario_name)

  }

  figure_path <- here::here("figure", "manuscript_figures")
  if (!dir.exists(figure_path)) dir.create(figure_path)

  # Linear regression analysis ----------------------------------------------

  # Load data-poor RData
  data_poor_non_significant_indicator <- list(
    c("AMO", "PDSI", "Menhaden Ex-vessel Value", "Menhaden fishing effort", "Menhaden CPUE"),
    c("Menhaden Ex-vessel Value", "Menhaden Menhaden fishing effort", "Menhaden CPUE"),
    c("Menhaden Ex-vessel Value", "Menhaden fishing effort", "Menhaden CPUE")
  )
  # data_poor_non_significant_indicator <- list(
  #   c("AMO", "PDSI", "Biomass of Striped bass", "Menhaden fishing effort", "Menhaden CPUE"),
  #   c("AMO", "PDSI", "Biomass of Striped bass", "Menhaden Catch",
  #     "Menhaden fishing effort", "Menhaden CPUE", "Bass CPUE",
  #     "Herring CPUE", "Menhaden Ex-vessel Value"),
  #   c("AMO", "PDSI", "Biomass of Striped bass", "Bass CPUE", "Herring CPUE", "Menhaden fishing effort", "Menhaden CPUE")
  # )

  load(here::here("data", "data_poor", ewe_scenario_name, paste0("dbsra_soi_output3_", terminal_year, scenario_filename, ".RData"))) # data name: soi_ouput3
  temp <- rbind(soi_output3$lm_data_om, soi_output3$lm_data_em)
  temp$Menhaden_Biomass[which(temp$Menhaden_Biomass < 0)] <- log(1.0001)
  if (scenario_id == 1) temp  <-  temp[!((temp$Variable %in% c("AMO", "PDSI"))), ]
  temp  <-  temp[!((temp$Variable %in% data_poor_non_significant_indicator[[scenario_id]]) & (temp$model %in% "EM")), ]
  temp$model[temp$model == "EM"] <- "Data-poor EM"
  temp$scenario <- paste0("S", scenario_id)
  if (scenario_id ==1) {
    lm_data <- temp
  } else {
    lm_data <- rbind(lm_data, temp)
  }

  # Load data-moderate RData
  data_moderate_non_significant_indicator <- list(
    c("AMO", "PDSI", "Menhaden Ex-vessel Value"),
    c("Menhaden Ex-vessel Value"),
    c("Menhaden Ex-vessel Value")
  )
  # data_moderate_non_significant_indicator <- list(
  #   c("AMO", "PDSI", "Biomass of Striped bass", "Menhaden Catch", "Bass CPUE",
  #     "Herring CPUE", "Menhaden Ex-vessel Value"),
  #   c("PDSI"),
  #   c("AMO", "PDSI", "Biomass of Striped bass", "Menhaden Catch",
  #     "Menhaden fishing effort", "Menhaden CPUE", "Bass CPUE",
  #     "Herring CPUE", "Menhaden Ex-vessel Value")
  # )

  load(here::here("data", "data_moderate", ewe_scenario_name, paste0("jabba_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  temp <- rbind(output$lm_data_om, output$lm_data_em)
  if (scenario_id == 1) temp  <-  temp[!((temp$Variable %in% c("AMO", "PDSI"))), ]
  temp  <-  temp[!((temp$Variable %in% data_moderate_non_significant_indicator[[scenario_id]]) & (temp$model %in% "EM")), ]
  temp$model[temp$model == "EM"] <- "Data-moderate EM"
  temp$scenario <- paste0("S", scenario_id)
  lm_data <- rbind(lm_data, temp)

  # Load data-rich RData
  data_rich_non_significant_indicator <- list(
    c("AMO", "PDSI", "Menhaden Ex-vessel Value"),
    c("Menhaden Ex-vessel Value"),
    c("Menhaden Ex-vessel Value")
  )
  # data_rich_non_significant_indicator <- list(
  #   c("AMO", "PDSI", "Biomass of Striped bass", "Menhaden Catch",
  #     "Bass CPUE", "Herring CPUE", "Menhaden Ex-vessel Value"),
  #   c("PDSI", "Menhaden Ex-vessel Value"),
  #   c("AMO", "PDSI", "Biomass of Striped bass", "Menhaden Catch",
  #     "Menhaden fishing effort", "Bass CPUE",
  #     "Herring CPUE", "Menhaden Ex-vessel Value", "Menhaden mean age")
  # )

  load(here::here("data", "data_rich", ewe_scenario_name, paste0("ss3_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  temp <- rbind(output$lm_data_om, output$lm_data_em)
  if (scenario_id == 1) temp  <-  temp[!((temp$Variable %in% c("AMO", "PDSI"))), ]
  temp  <-  temp[!((temp$Variable %in% data_rich_non_significant_indicator[[scenario_id]]) & (temp$model %in% "EM")), ]
  temp$model[temp$model == "EM"] <- "Data-rich EM"
  temp$scenario <- paste0("S", scenario_id)
  lm_data <- rbind(lm_data, temp)

  # Status of indicators ----------------------------------------------------

  # Load data-poor RData
  data_poor_non_significant_indicator <- list(
    c("amo", "pdsi", "menhadenV", "menhadenE", "menhadenCPUE"),
    c("menhadenV", "menhadenE", "menhadenCPUE"),
    c("menhadenV", "menhadenE", "menhadenCPUE")
  )

  # data_poor_non_significant_indicator <- list(
  #   c("amo", "pdsi", "bassB", "menhadenE", "menhadenCPUE"),
  #   c("amo", "pdsi", "bassB", "menhadenC",
  #     "menhadenE", "menhadenCPUE", "bassCPUE",
  #     "herringCPUE", "menhadenV"),
  #   c("amo", "pdsi", "bassB", "bassCPUE", "herringCPUE")
  # )

  load(here::here("data", "data_poor", ewe_scenario_name, paste0("dbsra_soi_output3_", terminal_year, scenario_filename, ".RData"))) # data name: soi_ouput3
  temp <- soi_output3$soi_data_melt
  temp$model <- "Data-poor EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_poor_non_significant_indicator[[scenario_id]])), ]
  if (scenario_id == 1){
    soi_data <- temp
  } else {
    soi_data <- rbind(soi_data, temp)
  }


  # Load data-moderate RData
  data_moderate_non_significant_indicator <- list(
    c("amo", "pdsi", "menhadenV"),
    c("menhadenV"),
    c("menhadenV")
  )


  # data_moderate_non_significant_indicator <- list(
  #   c("amo", "pdsi", "bassB", "menhadenC", "bassCPUE",
  #     "herringCPUE", "menhadenV"),
  #   c("pdsi"),
  #   c("amo", "pdsi", "bassB", "menhadenC",
  #     "menhadenE", "menhadenCPUE", "bassCPUE",
  #     "herringCPUE", "menhadenV")
  # )


  load(here::here("data", "data_moderate", ewe_scenario_name, paste0("jabba_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  temp <- output$soi_data_melt
  temp$model <- "Data-moderate EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_moderate_non_significant_indicator[[scenario_id]])), ]
  soi_data <- rbind(soi_data, temp)


  # Load data-rich RData
  data_rich_non_significant_indicator <- list(
    c("amo", "pdsi", "menhadenV"),
    c("menhadenV"),
    c("menhadenV")
  )
  # data_rich_non_significant_indicator <- list(
  #   c("amo", "pdsi", "bassB", "menhadenC",
  #     "bassCPUE", "herringCPUE", "menhadenV"),
  #   c("pdsi", "menhadenV"),
  #   c("amo", "pdsi", "bassB", "menhadenC",
  #     "menhadenE", "bassCPUE",
  #     "herringCPUE", "menhadenV", "meanage")
  # )

  load(here::here("data", "data_rich", ewe_scenario_name, paste0("ss3_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  soi_data_melt_om <- reshape2::melt(
    output$soi_data_om,
    id = c("year", "projection_year_id")
  )

  soi_data_melt_om$projection_year_id <- rep(rep(projection_year, each = length(model_year)), times = ncol(output$soi_data_om) - 2)
  soi_data_melt_om$model <- "OM"
  soi_data_melt_om$scenario <- paste0("S", scenario_id)
  if (scenario_id == 1) soi_data_melt_om  <-  soi_data_melt_om[!((soi_data_melt_om$variable %in% c("amo", "pdsi"))), ]

  temp <- output$soi_data_melt
  temp$model <- "Data-rich EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_rich_non_significant_indicator[[scenario_id]])), ]
  soi_data <- rbind(soi_data, temp, soi_data_melt_om)

  # Bratio ------------------------------------------------------------------

  # Load data-poor RData
  load(here::here("data", "data_poor", ewe_scenario_name, paste0("dbsra_soi_output3_", terminal_year, scenario_filename, ".RData"))) # data name: soi_ouput3
  temp <- data.frame(
    scenario = paste0("S", scenario_id),
    model = "Data-poor EM",
    bratio = soi_output3$Bt_BMSY_list[[1]]
  )

  if (scenario_id == 1){
    bratio_data <- temp
  } else {
    bratio_data <- rbind(bratio_data, temp)
  }

  # Load data-moderate RData
  load(here::here("data", "data_moderate", ewe_scenario_name, paste0("jabba_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  temp <- data.frame(
    scenario = paste0("S", scenario_id),
    model = "Data-moderate EM",
    bratio = output$Bt_BMSY[,1]
  )
  bratio_data <- rbind(bratio_data, temp)

  # Load data-rich RData
  load(here::here("data", "data_rich", ewe_scenario_name, paste0("ss3_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  temp <- data.frame(
    scenario = paste0("S", scenario_id),
    model = "Data-rich EM",
    bratio = output$Bt_BMSY
  )
  bratio_data <- rbind(bratio_data, temp)

  # F for projections ----------------------------------------------------

  # Load data-poor RData
  load(here::here("data", "data_poor", ewe_scenario_name, paste0("dbsra_soi_output3_", terminal_year, scenario_filename, ".RData"))) # data name: soi_ouput3
  temp <- soi_output3$fmsy_data_melt
  levels(temp$variable)[1] <- "Default F"
  temp$model <- "Data-poor EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_poor_non_significant_indicator[[scenario_id]])), ]
  if (scenario_id == 1){
    fmsy_data <- temp
  } else {
    fmsy_data <- rbind(fmsy_data, temp)
  }

  # Load data-moderate RData
  load(here::here("data", "data_moderate", ewe_scenario_name, paste0("jabba_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  temp <- output$fmsy_data_melt
  levels(temp$variable)[1] <- "Default F"
  temp$model <- "Data-moderate EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_moderate_non_significant_indicator[[scenario_id]])), ]
  fmsy_data <- rbind(fmsy_data, temp)

  # Load data-rich RData
  load(here::here("data", "data_rich", ewe_scenario_name, paste0("ss3_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  temp <- output$fmsy_data_melt
  levels(temp$variable)[1] <- "Default F"
  temp$model <- "Data-rich EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_rich_non_significant_indicator[[scenario_id]])), ]
  fmsy_data <- rbind(fmsy_data, temp)

  # Median F for projections ----------------------------------------------------

  # Load data-poor RData
  load(here::here("data", "data_poor", ewe_scenario_name, paste0("dbsra_soi_output3_", terminal_year, scenario_filename, ".RData"))) # data name: soi_ouput3
  temp <- soi_output3$fmsy_data_melt_median
  levels(temp$variable)[1] <- "Default F"
  temp$model <- "Data-poor EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_poor_non_significant_indicator[[scenario_id]])), ]
  if (scenario_id == 1){
    medianf_data <- temp
  } else {
    medianf_data <- rbind(medianf_data, temp)
  }

  # Load data-moderate RData
  load(here::here("data", "data_moderate", ewe_scenario_name, paste0("jabba_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  temp <- output$fmsy_data_melt_median
  levels(temp$variable)[1] <- "Default F"
  temp$model <- "Data-moderate EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_poor_non_significant_indicator[[scenario_id]])), ]
  medianf_data <- rbind(medianf_data, temp)

  # Load data-rich RData
  load(here::here("data", "data_rich", ewe_scenario_name, paste0("ss3_output_", terminal_year, scenario_filename, ".RData"))) # data name: output
  temp <- output$fmsy_data_melt_median
  levels(temp$variable)[1] <- "Default F"
  temp$model <- "Data-rich EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_poor_non_significant_indicator[[scenario_id]])), ]
  medianf_data <- rbind(medianf_data, temp)

}


# linear regression figures -----------------------------------------------

lm_data$Variable <- factor(lm_data$Variable, levels = c("AMO", "PDSI", "Biomass of Striped bass", "Menhaden mean age",
                                                        "Bass CPUE", "Herring CPUE", "Menhaden Catch",
                                                        "Menhaden Ex-vessel Value",
                                                        "Menhaden fishing effort", "Menhaden CPUE"))
# levels(lm_data$Variable) <- c("AMO", "PDSI", "Predator biomass", "Prey 1 Mean Age",
#                               "Predator CPUE", "Prey 2 CPUE", "Prey 1 Catch",
#                               "Prey 1 Ex-vessel Value", "Prey 1 Fishing Effort",
#                               "Prey 1 CPUE")
# levels(lm_data$Variable) <- paste0("I", seq_along(levels(lm_data$Variable)))
levels(lm_data$Variable) <- paste0("I", c(1:7, "V", 8:9))

lm_data$model <- factor(lm_data$model, levels = c("OM", "Data-poor EM",
                                                  "Data-moderate EM",
                                                  "Data-rich EM"))

ggplot(lm_data, aes(x = Index_Value, y = Menhaden_Biomass, color = model)) +
  geom_point() +
  geom_smooth(method = lm) +
  facet_wrap(~scenario+Variable, scales = "free", ncol = 5) +
  labs(
    x = "Indicator Value",
    y = "Log biomass (mt)"
  ) +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(terminal_year, scenario_filename, "_linear_regression_more_rows.jpeg")))

ggplot(lm_data, aes(x = Index_Value, y = Menhaden_Biomass, color = model)) +
  geom_point() +
  geom_smooth(method = lm) +
  facet_grid(scenario~Variable, scales = "free") +
  labs(
    x = "Indicator Value",
    y = "Log biomass (mt)"
  ) +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(terminal_year, scenario_filename, "_linear_regression_less_rows.jpeg")))


# Status of indicators figures --------------------------------------------

soi_data$variable <- factor(soi_data$variable, levels = c("amo", "pdsi", "bassB", "meanage",
                                                          "bassCPUE", "herringCPUE", "menhadenC",
                                                          "menhadenV",
                                                          "menhadenE", "menhadenCPUE"))
# levels(soi_data$variable) <- c("AMO", "PDSI", "Predator biomass", "Prey 1 Mean Age",
#                                "Predator CPUE", "Prey 2 CPUE", "Prey 1 Catch",
#                                "Prey 1 Ex-vessel Value", "Prey 1 Fishing Effort",
#                                "Prey 1 CPUE")
levels(soi_data$variable) <- paste0("I", c(1:7, "V", 8:9))

soi_data$model <- factor(soi_data$model, levels = c("OM",
                                                    "Data-poor EM",
                                                    "Data-moderate EM",
                                                    "Data-rich EM"))

ggplot(soi_data[soi_data$projection_year_id == 2013, ], aes(x = year, y = value, color = model)) +
  geom_line(alpha = 0.8, size=1) +
  # geom_line(size=1) +
  facet_wrap(~scenario+variable, ncol = 5) +
  labs(
    x = "Year",
    y = "Status of Indicator"
  ) +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(terminal_year, scenario_filename, "_soi_more_rows.jpeg")))

ggplot(soi_data[soi_data$projection_year_id == 2013, ], aes(x = year, y = value, color = model)) +
  geom_line(alpha = 0.8, size=1) +
  # geom_line(size=1) +
  facet_grid(variable~scenario) +
  # facet_grid(scenario~variable) +
  labs(
    x = "Year",
    y = "Status of Indicator"
  ) +
  theme_bw()+
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(terminal_year, scenario_filename, "_soi_less_rows.jpeg")))


# Bratio ------------------------------------------------------------------
load(here::here("data", "ewe", "ewe_reference_points.RData"))
bratio_data <- rbind(bratio_data,
                     c("S1", "OM", reference_points$bratio["compensation_bratio_s1"]),
                     c("S2", "OM", reference_points$bratio["compensation_bratio_s2"]),
                     c("S3", "OM", reference_points$bratio["compensation_bratio_s3"]))
bratio_data$model <- factor(bratio_data$model, levels = c(
  "OM",
  "Data-poor EM",
  "Data-moderate EM",
  "Data-rich EM"))
bratio_data$bratio <- as.numeric(bratio_data$bratio)

ggplot(bratio_data, aes(x = scenario, y = bratio, color = model)) +
  geom_boxplot(outlier.size = 0.2) +
  geom_hline(yintercept = 1, lty=2) +
  geom_hline(yintercept = 0.5, lty=2) +
  labs(
    x = "Scenario",
    y = bquote(B[2012]/B[MSY])
  ) +
  theme_bw()+
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(terminal_year, scenario_filename, "_bratio_line.jpeg")))

ggplot() +
  geom_point(bratio_data[bratio_data$model %in% "OM", ],
             mapping = aes(x = scenario, y = bratio, color = model),
             pch = 8, size = 5) +
  geom_boxplot(bratio_data[!(bratio_data$model %in% "OM"), ],
               mapping = aes(x = scenario, y = bratio, color = model),
               outlier.size = 0.2) +
  geom_hline(yintercept = 1, lty=2) +
  geom_hline(yintercept = 0.5, lty=2) +
  labs(
    x = "Scenario",
    y = bquote(B[2012]/B[MSY])
  ) +
  geom_point(bratio_data[bratio_data$model %in% "OM", ],
             mapping = aes(x = scenario, y = bratio, color = model),
             pch = 8, size = 5) +
  theme_bw()+
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(terminal_year, scenario_filename, "_bratio_point.jpeg")))

ggplot() +
  geom_hline(bratio_data[(bratio_data$model %in% "OM"), ],
             mapping = aes(yintercept = bratio_data[(bratio_data$model %in% "OM"), "bratio"]),
             color=hue_pal()(4)[1],
             linetype = "twodash",
             lty = 2)+
  facet_wrap(~ scenario) +
  geom_boxplot(bratio_data[!(bratio_data$model %in% "OM"), ],
               # mapping = aes(x = scenario, y = bratio, color = model),
               mapping = aes(y = bratio, fill=model),
               outlier.size = 0.2) +
  # facet_wrap(~ scenario) +
  scale_fill_manual(values=hue_pal()(4)[2:4]) +
  geom_hline(yintercept = 1, lty=2) +
  geom_hline(yintercept = 0.5, lty=2) +
  labs(
    x = "Model",
    y = bquote(B[2012]/B[MSY])
  ) +
  theme_bw()+
  theme(
    axis.text.x = element_blank(),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
# F for projections -------------------------------------------------------

fmsy_data$variable <- factor(fmsy_data$variable, levels = c("Default F", "amo", "pdsi", "bassB", "meanage",
                                                          "bassCPUE", "herringCPUE", "menhadenC",
                                                          "menhadenV",
                                                          "menhadenE", "menhadenCPUE"))
# levels(soi_data$variable) <- c("AMO", "PDSI", "Predator biomass", "Prey 1 Mean Age",
#                                "Predator CPUE", "Prey 2 CPUE", "Prey 1 Catch",
#                                "Prey 1 Ex-vessel Value", "Prey 1 Fishing Effort",
#                                "Prey 1 CPUE")
levels(fmsy_data$variable) <- c("Default F", paste0("I", c(1:7, "V", 8:9)), " Fadj")

fmsy_data$model <- factor(fmsy_data$model, levels = c(
                                                    "Data-poor EM",
                                                    "Data-moderate EM",
                                                    "Data-rich EM"))

# boxplot
ggplot(fmsy_data, aes(x = variable, y = value, color = projection_year_id)) +
  # geom_boxplot(outlier.shape = NA) +
  geom_boxplot(outlier.size = 0.2) +
  facet_grid(model~scenario, scales = "free") +
  labs(
    x = "",
    y = bquote(F[MSY])
  ) +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_f_boxplot.jpeg")))



# Median F for projections ------------------------------------------------
medianf_data$variable <- factor(medianf_data$variable, levels = c("Default F", "amo", "pdsi", "bassB", "meanage",
                                                            "bassCPUE", "herringCPUE", "menhadenC",
                                                            "menhadenV",
                                                            "menhadenE", "menhadenCPUE"))
levels(medianf_data$variable) <- c("Default F", paste0("I", seq_along(levels(fmsy_data$variable))-1), " Fadj")

medianf_data$model <- factor(medianf_data$model, levels = c(
  "Data-poor EM",
  "Data-moderate EM",
  "Data-rich EM"))

ggplot(medianf_data, aes(x = projection_year_id, y = value, color = variable)) +
  geom_line(size=1) +
  facet_grid(model~scenario, scales = "free") +
  labs(
    x = "",
    y = "FMSY"
  ) +
  theme_bw() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_medianf.jpeg")))


