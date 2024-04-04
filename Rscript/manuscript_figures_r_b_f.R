devtools::load_all()

# Load scenario information
scenario_filename <- "_lowCV"
terminal_year <- 2012
fishery_CV_input <- 0.05
survey_CV_input <- 0.1
add_environmental_effects <- TRUE
add_fleet_dynamics <- TRUE

# Load simulated input data
source(here::here("Rscript", "simulationOM3.R")) # OM reference points

ci_maxtrix_calculation <- function(distribution, data_matrix, year, data_type) {
  value <- apply(data_matrix, 2, mean)
  std <- apply(data_matrix, 2, sd)
  if (distribution == "lognormal") {
    std_log <- sqrt(log(1 + (std / value)^2))

    ci_lower <- qlnorm(
      p = 0.025,
      meanlog = log(value),
      sdlog = std_log
    )

    ci_upper <- qlnorm(
      p = 0.975,
      meanlog = log(value),
      sdlog = std_log
    )
  }

  if (distribution == "normal") {
    ci_upper <- value + 1.96 * std
    ci_lower <- pmax(value - 1.96 * std, 0)
  }

  return(data.frame(
    value = value,
    std = std,
    ci_upper = ci_upper,
    ci_lower = ci_lower,
    year = year,
    data_type = data_type
  ))
}

projection_year <- 2013:2017
projection_nyear <- length(projection_year)
model_year <- 1985:2012

add_environmental_effects_vec <- c(FALSE, TRUE, TRUE)
add_fleet_dynamics_vec <- c(FALSE, FALSE, TRUE)

functional_groups <- c(
  "StripedBass0",
  "StripedBass2_5",
  "StripedBass6",
  "AtlanticMenhaden0",
  "AtlanticMenhaden1",
  "AtlanticMenhaden2",
  "AtlanticMenhaden3",
  "AtlanticMenhaden4",
  "AtlanticMenhaden5",
  "AtlanticMenhaden6",
  "SpinyDogfish",
  "BluefishJuvenile",
  "BluefishAdult",
  "WeakfishJuvenile",
  "WeakfishAdult",
  "AtlanticHerring0_1",
  "AtlanticHerring2",
  "Anchovies",
  "Benthos",
  "Zooplankton",
  "Phytoplankton",
  "Detritus"
)
ages <- 0:6
age_name <- paste0("AtlanticMenhaden", ages)

for (scenario_id in seq_along(add_environmental_effects_vec)){
  add_environmental_effects <- add_environmental_effects_vec[scenario_id]
  add_fleet_dynamics <- add_fleet_dynamics_vec[scenario_id]

  project_path <- here::here()
  if (add_environmental_effects == FALSE){
    ewe_scenario_name <- "ecosim_base_run"
  }

  if (
    add_environmental_effects == TRUE &
    add_fleet_dynamics == FALSE
  ) {
    ewe_scenario_name <- "ecosim_forcing_pdsi_egg_amo1"
  }

  if (add_fleet_dynamics == TRUE) {
    ewe_scenario_name <- "ecosim_fleet_dynamics"
  }

  ewe_output_path <- file.path(project_path, "data", "ewe", "7ages_ecosim_om",
                               ewe_scenario_name)

  # data-poor, data-moderate, and data-rich OM share the same population dynamics
  if (ewe_scenario_name == "ecosim_fleet_dynamics") {
    file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections_fleet_dynamics",
                            paste0(ewe_scenario_name, "_annualF_data_rich_", terminal_year, scenario_filename, "_om"))
  } else {
    file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections",
                            paste0(ewe_scenario_name, "_data_rich_", terminal_year, scenario_filename, "_om"))
  }


  figure_path <- here::here("figure", "manuscript_figures")
  if (!dir.exists(figure_path)) dir.create(figure_path)

  # Load OM data
  biomass <- IFA4EBFM::read_ewe_output(
    file_path = file_path,
    file_names = "biomass_monthly.csv",
    skip_nrows = 8,
    plot = FALSE,
    figure_titles = NULL,
    functional_groups = functional_groups,
    figure_colors = NULL
  )

  waa <- IFA4EBFM::read_ewe_output(
    file_path = file_path,
    file_names = "weight_monthly.csv",
    skip_nrows = 8,
    plot = FALSE,
    figure_titles = NULL,
    functional_groups = functional_groups,
    figure_colors = NULL
  )

  catch <- IFA4EBFM::read_ewe_output(
    file_path = file_path,
    file_names = "catch_monthly.csv",
    skip_nrows = 8,
    plot = FALSE,
    figure_titles = NULL,
    functional_groups = functional_groups,
    figure_colors = NULL
  )

  mortality <- read.csv(file = here::here("data", "ewe", "7ages_ecosim_om", paste0(ewe_scenario_name, "_fatage.csv")))
  mortality_projection <- read.csv(file = here::here("data", "data_rich", ewe_scenario_name, paste0("fmsy_median_data_", terminal_year, scenario_filename, ".csv")))
  mortality_projection <- as.numeric(as.character(mortality_projection[which(mortality_projection$variable == "om"), paste0("fmsy_", ages)][1,]))
  F_apical_projection <- rep(max(mortality_projection), projection_nyear)
  F_average_projection <- rep(mean(mortality_projection), projection_nyear)

  if (add_fleet_dynamics == TRUE){
    mortality_ewe_apical <- apply(mortality[, age_name], 1, max)
    mortality_ewe_average <- apply(mortality[, age_name], 1, mean)
  }

  if (add_fleet_dynamics == FALSE){
    mortality_ewe_apical <- apply(mortality[, paste0("menhaden", ages)], 1, max)
    mortality_ewe_average <- apply(mortality[, paste0("menhaden", ages)], 1, mean)
  }

  mortality_apical <- mortality_ewe_apical
  mortality_apical[(length(model_year)+1):length(mortality_apical)] <- F_apical_projection
  mortality_average <- mortality_ewe_average
  mortality_average[(length(model_year)+1):length(mortality_average)] <- F_average_projection

  time_id <- seq(1, nrow(biomass[[1]]), by = 12)

  om_temp <- data.frame(
    Recruitment = (biomass[[1]][, "AtlanticMenhaden0"] *1000000 / waa[[1]][, "AtlanticMenhaden0"])[time_id] / 1000,
    Biomass = apply(biomass[[1]][, age_name], 1, sum)[time_id] * 1000000,
    SB = apply(biomass[[1]][, age_name] * sa_data$biodata$maturity_matrix, 1, sum)[time_id]*1000000,
    Landings = apply(catch[[1]][, age_name], 1, sum)[time_id] * 1000000,
    F_apical = mortality_apical[1:length(time_id)],
    F_average = mortality_average[1:length(time_id)],
    Year = c(model_year, projection_year),
    Model = "OM",
    Scenario = paste0("S", scenario_id),
    Data_type = "mean"
  )
  om_temp_reshape <- reshape2::melt(om_temp, id=c("Year", "Model", "Scenario", "Data_type"))

  if (scenario_id == 1){
    summary_data <- om_temp_reshape
  } else {
    summary_data <- rbind(summary_data, om_temp_reshape)
  }


  # Load data-poor RData
  # Non projection years
  load(here::here("data", "data_poor", ewe_scenario_name, paste0("dbsra_projection_output3_", terminal_year, scenario_filename, ".RData"))) # projection_output3

  em_id <- (length(projection_output3[[1]]$C_hist)-length(model_year)+1):length(projection_output3[[1]]$C_hist)
  # Biomass
  biomass_data <- ci_maxtrix_calculation(
    distribution = "normal",
    data_matrix = projection_output3[[1]]$Btrend[, em_id],
    year = model_year,
    data_type = "Biomass"
  )
  # biomass_data$median <- apply(projection_output3[[1]]$Btrend[, em_id], 2, median)
  biomass_data$value <- apply(projection_output3[[1]]$Btrend[, em_id], 2, median)

  biomass_data_reshape <- reshape2::melt(biomass_data, id = c("year", "data_type"))
  colnames(biomass_data_reshape) <- c("Year", "variable", "Data_type", "value")
  levels(biomass_data_reshape$Data_type)[1] <- "mean"
  biomass_data_reshape$Model <- "Data-poor EM"
  biomass_data_reshape$Scenario <- paste0("S", scenario_id)

  # Landings
  landings_data <- data.frame(
    Year = model_year,
    variable = "Landings",
    Data_type = "mean",
    value = projection_output3[[1]]$C_hist[(length(projection_output3[[1]]$C_hist)-length(model_year)+1):length(projection_output3[[1]]$C_hist)],
    Model = "Data-poor EM",
    Scenario = paste0("S", scenario_id)
  )

  # F
  mortality_projection <- read.csv(file = here::here("data", "data_poor", ewe_scenario_name, paste0("fmsy_median_data3_", terminal_year, scenario_filename, ".csv")))
  mortality_projection <- mortality_projection[which(mortality_projection$variable %in% "DBSRA"), paste0("fmsy_", ages)]
  F_apical_projection <- apply(mortality_projection, 1, max)
  F_average_projection <- apply(mortality_projection, 1, mean)

  f_data <- data.frame(
    median = F_average_projection,
    Year = projection_year,
    Data_type = "F_average"
  )
  f_data_reshape <- reshape2::melt(f_data, id = c("Year", "Data_type"))
  colnames(f_data_reshape) <- c("Year", "variable", "Data_type", "value")
  f_data_reshape$Model <- "Data-poor EM"
  f_data_reshape$Scenario <- paste0("S", scenario_id)

  summary_data <- rbind(summary_data, biomass_data_reshape, landings_data, f_data_reshape)

  # Projection years
  indicators <- c("dbsra",
                  "amo", "pdsi",
                  "bassb",
                  "menhadenc",
                  "basscpue", "herringcpue",
                  "menhadenv")
  indicators_fmsy <- c("DBSRA",
                       "amo", "pdsi",
                       "bassB",
                       "menhadenC",
                       "bassCPUE", "herringCPUE",
                       "menhadenV")

  for (indicators_id in seq_along(indicators)){
    if (ewe_scenario_name == "ecosim_fleet_dynamics") {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections_fleet_dynamics",
                              paste0(ewe_scenario_name, "_annualF_data_poor_", terminal_year, scenario_filename, "_", indicators[indicators_id]))
    } else {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections",
                              paste0(ewe_scenario_name, "_data_poor_", terminal_year, scenario_filename,"_", indicators[indicators_id]))
    }

    biomass <- IFA4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "biomass_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    waa <- IFA4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "weight_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    catch <- IFA4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "catch_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    mortality_projection <- read.csv(file = here::here("data", "data_poor", ewe_scenario_name, paste0("fmsy_median_data3_", terminal_year, scenario_filename, ".csv")))
    mortality_projection <- mortality_projection[which(mortality_projection$variable == indicators_fmsy[indicators_id]), paste0("fmsy_", ages)]
    F_apical_projection <- apply(mortality_projection, 1, max)
    F_average_projection <- apply(mortality_projection, 1, mean)
    projection_time_id <- tail(seq(1, nrow(biomass[[1]]), by = 12), n = projection_nyear)

    temp <- data.frame(
      Recruitment = (biomass[[1]][, "AtlanticMenhaden0"] *1000000 / waa[[1]][, "AtlanticMenhaden0"])[projection_time_id] / 1000,
      Biomass = apply(biomass[[1]][, age_name], 1, sum)[projection_time_id] * 1000000,
      SB = apply(biomass[[1]][, age_name] * sa_data$biodata$maturity_matrix, 1, sum)[projection_time_id]*1000000,
      Landings = apply(catch[[1]][, age_name], 1, sum)[projection_time_id] * 1000000,
      F_apical = F_apical_projection,
      F_average = F_average_projection,
      Year = projection_year,
      Model = paste0("Data-poor ", indicators[indicators_id]),
      Scenario = paste0("S", scenario_id),
      Data_type = "median"
    )
    temp_reshape <- reshape2::melt(temp, id=c("Year", "Model", "Scenario", "Data_type"))

    summary_data <- rbind(summary_data, temp_reshape)

  }

  # Load data-moderate RData
  # Non projection years
  load(here::here("data", "data_moderate", ewe_scenario_name, terminal_year, "case0_case0_jabba.rdata"))

  # Biomass
  biomass_data <- data.frame(
    mean = jabba$timeseries[, "mu", "B"],
    ci_upper = jabba$timeseries[,"lci","B"],
    ci_lower = jabba$timeseries[, "uci", "B"],
    Year = model_year,
    Data_type = "Biomass"
  )
  biomass_data_reshape <- reshape2::melt(biomass_data, id = c("Year", "Data_type"))
  colnames(biomass_data_reshape) <- c("Year", "variable", "Data_type", "value")
  biomass_data_reshape$Model <- "Data-moderate EM"
  biomass_data_reshape$Scenario <- paste0("S", scenario_id)

  # Landings
  landings_data <- data.frame(
    mean = jabba$est.catch$mu,
    ci_upper = jabba$est.catch$uci,
    ci_lower = jabba$est.catch$lci,
    Year = model_year,
    Data_type = "Landings"
  )
  landings_data_reshape <- reshape2::melt(landings_data, id = c("Year", "Data_type"))
  colnames(landings_data_reshape) <- c("Year", "variable", "Data_type", "value")
  landings_data_reshape$Model <- "Data-moderate EM"
  landings_data_reshape$Scenario <- paste0("S", scenario_id)

  # F
  f_data <- data.frame(
    mean = jabba$timeseries[, "mu", "F"],
    ci_upper = jabba$timeseries[,"lci","F"],
    ci_lower = jabba$timeseries[, "uci", "F"],
    Year = model_year,
    Data_type = "F_average"
  )
  f_data_reshape <- reshape2::melt(f_data, id = c("Year", "Data_type"))
  colnames(f_data_reshape) <- c("Year", "variable", "Data_type", "value")
  f_data_reshape$Model <- "Data-moderate EM"
  f_data_reshape$Scenario <- paste0("S", scenario_id)

  summary_data <- rbind(summary_data, biomass_data_reshape, landings_data_reshape, f_data_reshape)

  # Projection years
  indicators <- c("jabba",
                  "amo", "pdsi",
                  "bassb",
                  "menhadenc", "menhadene", "menhadencpue",
                  "basscpue", "herringcpue",
                  "menhadenv")
  indicators_fmsy <- c("JABBA",
                       "amo", "pdsi",
                       "bassB",
                       "menhadenC", "menhadenE", "menhadenCPUE",
                       "bassCPUE", "herringCPUE",
                       "menhadenV")

  for (indicators_id in seq_along(indicators)){
    if (ewe_scenario_name == "ecosim_fleet_dynamics") {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections_fleet_dynamics",
                              paste0(ewe_scenario_name, "_annualF_data_moderate_", terminal_year, scenario_filename, "_", indicators[indicators_id]))
    } else {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections",
                              paste0(ewe_scenario_name, "_data_moderate_", terminal_year, scenario_filename,"_", indicators[indicators_id]))
    }

    biomass <- IFA4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "biomass_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    waa <- IFA4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "weight_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    catch <- IFA4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "catch_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    mortality_projection <- read.csv(file = here::here("data", "data_moderate", ewe_scenario_name, paste0("fmsy_median_data_", terminal_year, scenario_filename, ".csv")))
    mortality_projection <- as.numeric(as.character(mortality_projection[which(mortality_projection$variable == indicators_fmsy[indicators_id]), paste0("fmsy_", ages)][1,]))
    F_apical_projection <- rep(max(mortality_projection), projection_nyear)
    F_average_projection <- rep(mean(mortality_projection), projection_nyear)

    projection_time_id <- tail(seq(1, nrow(biomass[[1]]), by = 12), n = projection_nyear)

    temp <- data.frame(
      Recruitment = (biomass[[1]][, "AtlanticMenhaden0"] *1000000 / waa[[1]][, "AtlanticMenhaden0"])[projection_time_id] / 1000,
      Biomass = apply(biomass[[1]][, age_name], 1, sum)[projection_time_id] * 1000000,
      SB = apply(biomass[[1]][, age_name] * sa_data$biodata$maturity_matrix, 1, sum)[projection_time_id]*1000000,
      Landings = apply(catch[[1]][, age_name], 1, sum)[projection_time_id] * 1000000,
      F_apical = F_apical_projection,
      F_average = F_average_projection,
      Year = projection_year,
      Model = paste0("Data-moderate ", indicators[indicators_id]),
      Scenario = paste0("S", scenario_id),
      Data_type = "median"
    )
    temp_reshape <- reshape2::melt(temp, id=c("Year", "Model", "Scenario", "Data_type"))

    summary_data <- rbind(summary_data, temp_reshape)

  }

  # Load data-rich RData
  # Non projection years
  load(here::here("data", "data_rich", ewe_scenario_name, paste0("ss3_model_fit_", terminal_year, scenario_filename, ".RData"))) # time_series_data_reshape
  colnames(time_series_data_reshape) <- c("Year", "variable", "Data_type", "value")
  time_series_data_reshape <- time_series_data_reshape[-which(time_series_data_reshape$variable == "Biomass"),]
  time_series_data_reshape$variable[time_series_data_reshape$variable == "SB (mt)"] <- "SB"
  time_series_data_reshape$variable[time_series_data_reshape$variable == "R (x1000 fish)"] <- "Recruitment"
  time_series_data_reshape$variable[time_series_data_reshape$variable == "F"] <- "F_apical"
  levels(time_series_data_reshape$Data_type)[1] <- "mean"
  time_series_data_reshape$Model <- "Data-rich EM"
  time_series_data_reshape$Scenario <- paste0("S", scenario_id)

  summary_data <- rbind(summary_data, time_series_data_reshape[-which(time_series_data_reshape$Data_type == "ewe_data"), ])

  # Projection years
  indicators <- c("ss3",
                           "amo", "pdsi",
                           "bassb", "meanage",
                           "menhadenc", "menhadene", "menhadencpue",
                           "basscpue", "herringcpue",
                           "menhadenv")
  indicators_fmsy <- c("SS3",
                  "amo", "pdsi",
                  "bassB", "meanage",
                  "menhadenC", "menhadenE", "menhadenCPUE",
                  "bassCPUE", "herringCPUE",
                  "menhadenV")

  for (indicators_id in seq_along(indicators)){
    if (ewe_scenario_name == "ecosim_fleet_dynamics") {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections_fleet_dynamics",
                              paste0(ewe_scenario_name, "_annualF_data_rich_", terminal_year, scenario_filename, "_", indicators[indicators_id]))
    } else {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections",
                              paste0(ewe_scenario_name, "_data_rich_", terminal_year, scenario_filename,"_", indicators[indicators_id]))
    }

    biomass <- IFA4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "biomass_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    waa <- IFA4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "weight_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    catch <- IFA4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "catch_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    mortality_projection <- read.csv(file = here::here("data", "data_rich", ewe_scenario_name, paste0("fmsy_median_data_", terminal_year, scenario_filename, ".csv")))
    mortality_projection <- as.numeric(as.character(mortality_projection[which(mortality_projection$variable == indicators_fmsy[indicators_id]), paste0("fmsy_", ages)][1,]))
    F_apical_projection <- rep(max(mortality_projection), projection_nyear)
    F_average_projection <- rep(mean(mortality_projection), projection_nyear)

    projection_time_id <- tail(seq(1, nrow(biomass[[1]]), by = 12), n = projection_nyear)

    temp <- data.frame(
      Recruitment = (biomass[[1]][, "AtlanticMenhaden0"] *1000000 / waa[[1]][, "AtlanticMenhaden0"])[projection_time_id] / 1000,
      Biomass = apply(biomass[[1]][, age_name], 1, sum)[projection_time_id] * 1000000,
      SB = apply(biomass[[1]][, age_name] * sa_data$biodata$maturity_matrix, 1, sum)[projection_time_id]*1000000,
      Landings = apply(catch[[1]][, age_name], 1, sum)[projection_time_id] * 1000000,
      F_apical = F_apical_projection,
      F_average = F_average_projection,
      Year = projection_year,
      Model = paste0("Data-rich ", indicators[indicators_id]),
      Scenario = paste0("S", scenario_id),
      Data_type = "median"
    )
    temp_reshape <- reshape2::melt(temp, id=c("Year", "Model", "Scenario", "Data_type"))

    summary_data <- rbind(summary_data, temp_reshape)

  }

}

# Data-poor figures -------------------------------------------------------

data_poor_variable <- intersect(unique(summary_data$variable[which(summary_data$Model == "OM")]),
                                unique(summary_data$variable[which(summary_data$Model == "Data-poor EM")]))
indicators <- c("dbsra",
                "amo", "pdsi",
                "bassb",
                "menhadenc",
                "basscpue", "herringcpue",
                "menhadenv")

data_poor_data <- summary_data[which((summary_data$variable %in% data_poor_variable) & summary_data$Model %in% c("OM", "Data-poor EM", paste0("Data-poor ", indicators))),]

data_poor_data$Model <- factor(data_poor_data$Model, levels = c("OM", "Data-poor EM", "Data-poor dbsra", "Data-poor amo", "Data-poor pdsi", "Data-poor bassb",
                                                                "Data-poor basscpue", "Data-poor herringcpue", "Data-poor menhadenc", "Data-poor menhadenv"))
levels(data_poor_data$Model) <- c("OM", "Data-poor EM", "FMSY-EM", "Fadj-AMO", "Fadj-PDSI", "Fadj-Predator biomass",
                                  "Fadj-Predator CPUE", "Fadj-Prey 2 CPUE", "Fadj-Prey 1 Catch",
                                  "Fadj-Prey 1 Ex-vessel Value")

data_poor_data$Year_type[data_poor_data$Year %in% model_year] <- "Fit"
data_poor_data$Year_type[data_poor_data$Year %in% projection_year] <- "Projection"

ggplot() +
  geom_point(data_poor_data[which(data_poor_data$Model == "OM" & !(data_poor_data$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), color = "black") +
  geom_point(data_poor_data[which(data_poor_data$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_poor_data[which(data_poor_data$Model == "Data-poor EM" & data_poor_data$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_poor_data[which(data_poor_data$Data_type == "ci_lower"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_poor_data[which(data_poor_data$Data_type == "ci_upper"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_poor_data[which(data_poor_data$Data_type == "median" & !(data_poor_data$Model == "FMSY-EM")),], mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7) +
  facet_wrap(Scenario~variable, scales = "free_y", ncol = 2) +
  labs(
    x = "Year",
    y = "Value"
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
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_data_poor_r_sb_l_f_with_ci.jpeg")))

ggplot() +
  geom_point(data_poor_data[which(data_poor_data$Model == "OM" & !(data_poor_data$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), color = "black") +
  geom_point(data_poor_data[which(data_poor_data$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_poor_data[which(data_poor_data$Model == "Data-poor EM" & data_poor_data$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_poor_data[which(data_poor_data$Data_type == "ci_lower"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_poor_data[which(data_poor_data$Data_type == "ci_upper"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_poor_data[which(data_poor_data$Data_type == "median" & !(data_poor_data$Model == "FMSY-EM")),], mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7) +
  facet_wrap(Scenario~variable+Year_type, scales = "free", ncol = 4, labeller = labeller(.multi_line = F)) +
  labs(
    x = "Year",
    y = "Value"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_data_poor_r_sb_l_f_with_ci_zoomin.jpeg")))

ggplot() +
  geom_point(data_poor_data[which(data_poor_data$Model == "OM" & !(data_poor_data$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), color = "black") +
  geom_point(data_poor_data[which(data_poor_data$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_poor_data[which(data_poor_data$Model == "Data-poor EM" & data_poor_data$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_poor_data[which(data_poor_data$Data_type == "median" & !(data_poor_data$Model == "FMSY-EM")),], mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7) +
  facet_wrap(Scenario~variable, scales = "free_y", ncol = 2) +
  labs(
    x = "Year",
    y = "Value"
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
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_data_poor_r_sb_l_f_without_ci.jpeg")))

ggplot() +
  geom_point(data_poor_data[which(data_poor_data$Model == "OM" & !(data_poor_data$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), color = "black") +
  geom_point(data_poor_data[which(data_poor_data$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_poor_data[which(data_poor_data$Model == "Data-poor EM" & data_poor_data$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_poor_data[which(data_poor_data$Data_type == "median" & !(data_poor_data$Model == "FMSY-EM")),], mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7) +
  facet_wrap(Scenario~variable+Year_type, scales = "free", ncol = 4, labeller = labeller(.multi_line = F)) +
  labs(
    x = "Year",
    y = "Value"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=15),
    axis.text=element_text(size=12),
    axis.title=element_text(size=15,face="bold"),
    legend.text=element_text(size=15),
    legend.title=element_text(size=15,face="bold")
  )
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_data_poor_r_sb_l_f_without_ci_zoomin.jpeg")))


# Data-moderate figures ---------------------------------------------------

data_moderate_variable <- intersect(unique(summary_data$variable[which(summary_data$Model == "OM")]),
                                unique(summary_data$variable[which(summary_data$Model == "Data-moderate EM")]))

indicators <- c("jabba",
                "amo", "pdsi",
                "bassb",
                "menhadenc", "menhadene", "menhadencpue",
                "basscpue", "herringcpue",
                "menhadenv")

data_moderate_data <- summary_data[which((summary_data$variable %in% data_moderate_variable) & summary_data$Model %in% c("OM", "Data-moderate EM", paste0("Data-moderate ", indicators))),]

data_moderate_data$Model <- factor(data_moderate_data$Model, levels = c("OM", "Data-moderate EM", "Data-moderate jabba", "Data-moderate amo", "Data-moderate pdsi", "Data-moderate bassb",
                                                                "Data-moderate basscpue", "Data-moderate herringcpue", "Data-moderate menhadenc", "Data-moderate menhadenv", "Data-moderate menhadene", "Data-moderate menhadencpue"))
levels(data_moderate_data$Model) <- c("OM", "Data-moderate EM", "FMSY-EM", "Fadj-AMO", "Fadj-PDSI", "Fadj-Predator biomass",
                                  "Fadj-Predator CPUE", "Fadj-Prey 2 CPUE", "Fadj-Prey 1 Catch",
                                  "Fadj-Prey 1 Ex-vessel Value", "Fadj-Prey 1 Fishing Effort",
                                  "Fadj-Prey 1 CPUE")

data_moderate_data$Year_type[data_moderate_data$Year %in% model_year] <- "Fit"
data_moderate_data$Year_type[data_moderate_data$Year %in% projection_year] <- "Projection"

ggplot() +
  geom_point(data_moderate_data[which(data_moderate_data$Model == "OM" & !(data_moderate_data$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), size = 0.8, color = "black") +
  geom_point(data_moderate_data[which(data_moderate_data$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_moderate_data[which(data_moderate_data$Model == "Data-moderate EM" & data_moderate_data$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_moderate_data[which(data_moderate_data$Data_type == "ci_lower"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_moderate_data[which(data_moderate_data$Data_type == "ci_upper"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_moderate_data[which(data_moderate_data$Data_type == "median" & !(data_moderate_data$Model == "FMSY-EM")),], mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7) +
  facet_wrap(Scenario~variable, scales = "free_y") +
  labs(
    x = "Year",
    y = "Value"
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
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_data_moderate_r_sb_l_f.jpeg")))

ggplot() +
  geom_point(data_moderate_data[which(data_moderate_data$Model == "OM" & !(data_moderate_data$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), size = 0.8, color = "black") +
  geom_point(data_moderate_data[which(data_moderate_data$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_moderate_data[which(data_moderate_data$Model == "Data-moderate EM" & data_moderate_data$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_moderate_data[which(data_moderate_data$Data_type == "ci_lower"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_moderate_data[which(data_moderate_data$Data_type == "ci_upper"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_moderate_data[which(data_moderate_data$Data_type == "median" & !(data_moderate_data$Model == "FMSY-EM")),], mapping = aes(x = Year, y = value, colour = Model), size = 0.7) +
  facet_wrap(Scenario~variable+Year_type, scales = "free", ncol = 6, labeller = labeller(.multi_line = F)) +
  labs(
    x = "Year",
    y = "Value"
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
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_data_moderate_r_sb_l_f_zoomin.jpeg")))


# Data-rich figures -------------------------------------------------------

data_rich_variable <- intersect(unique(summary_data$variable[which(summary_data$Model == "OM")]),
                                unique(summary_data$variable[which(summary_data$Model == "Data-rich EM")]))

indicators <- c("ss3",
                "amo", "pdsi",
                "bassb", "meanage",
                "menhadenc", "menhadene", "menhadencpue",
                "basscpue", "herringcpue",
                "menhadenv")

data_rich_data <- summary_data[which((summary_data$variable %in% data_rich_variable) & summary_data$Model %in% c("OM", "Data-rich EM", paste0("Data-rich ", indicators))),]

data_rich_data$Model <- factor(data_rich_data$Model, levels = c("OM", "Data-rich EM", "Data-rich ss3", "Data-rich amo", "Data-rich pdsi", "Data-rich bassb", "Data-rich meanage",
                                                        "Data-rich basscpue", "Data-rich herringcpue", "Data-rich menhadenc", "Data-rich menhadenv", "Data-rich menhadene", "Data-rich menhadencpue"))
levels(data_rich_data$Model) <- c("OM", "Data-rich EM", "FMSY-EM", "Fadj-AMO", "Fadj-PDSI", "Fadj-Predator biomass", "Fadj-Prey 1 Mean Age",
                              "Fadj-Predator CPUE", "Fadj-Prey 2 CPUE", "Fadj-Prey 1 Catch",
                              "Fadj-Prey 1 Ex-vessel Value", "Fadj-Prey 1 Fishing Effort",
                              "Fadj-Prey 1 CPUE")

data_rich_data$Year_type[data_rich_data$Year %in% model_year] <- "Fit"
data_rich_data$Year_type[data_rich_data$Year %in% projection_year] <- "Projection"

ggplot() +
  geom_point(data_rich_data[which(data_rich_data$Model == "OM"& !(data_rich_data$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), size = 0.8, color = "black") +
  geom_point(data_rich_data[which(data_rich_data$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_rich_data[which(data_rich_data$Model == "Data-rich EM" & data_rich_data$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_rich_data[which(data_rich_data$Data_type == "ci_lower"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_rich_data[which(data_rich_data$Data_type == "ci_upper"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_rich_data[which(data_rich_data$Data_type == "median"  & !(data_rich_data$Model == "FMSY-EM")),], mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7) +
  facet_wrap(Scenario~variable, scales = "free_y") +
  labs(
    x = "Year",
    y = "Value"
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
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_data_rich_r_sb_l_f.jpeg")))

ggplot() +
  geom_point(data_rich_data[which(data_rich_data$Model == "OM"& !(data_rich_data$Year %in% projection_year)), ], mapping = aes(x = Year, y = value), size = 0.8, color = "black") +
  geom_point(data_rich_data[which(data_rich_data$Model == "FMSY-EM"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_rich_data[which(data_rich_data$Model == "Data-rich EM" & data_rich_data$Data_type == "mean"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_rich_data[which(data_rich_data$Data_type == "ci_lower"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(linetype =2, data_rich_data[which(data_rich_data$Data_type == "ci_upper"), ], mapping = aes(x = Year, y = value), color = "gray50") +
  geom_line(data_rich_data[which(data_rich_data$Data_type == "median"  & !(data_rich_data$Model == "FMSY-EM")),], mapping = aes(x = Year, y = value, colour = Model), linewidth = 0.7) +
  facet_wrap(Scenario~variable+Year_type, scales = "free", ncol = 6, labeller = labeller(.multi_line = F)) +
  labs(
    x = "Year",
    y = "Value"
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
ggsave(file.path(figure_path, paste0(ewe_scenario_name, "_", terminal_year, scenario_filename, "_data_rich_r_sb_l_f_zoomin.jpeg")))
