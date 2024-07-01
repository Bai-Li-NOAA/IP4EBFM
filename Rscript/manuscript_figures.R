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
  biomass <- IP4EBFM::read_ewe_output(
    file_path = file_path,
    file_names = "biomass_monthly.csv",
    skip_nrows = 8,
    plot = FALSE,
    figure_titles = NULL,
    functional_groups = functional_groups,
    figure_colors = NULL
  )

  waa <- IP4EBFM::read_ewe_output(
    file_path = file_path,
    file_names = "weight_monthly.csv",
    skip_nrows = 8,
    plot = FALSE,
    figure_titles = NULL,
    functional_groups = functional_groups,
    figure_colors = NULL
  )

  catch <- IP4EBFM::read_ewe_output(
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
    # median = F_average_projection,
    median = F_apical_projection,
    Year = projection_year,
    # Data_type = "F_average"
    Data_type = "F_apical"
  )
  f_data_reshape <- reshape2::melt(f_data, id = c("Year", "Data_type"))
  colnames(f_data_reshape) <- c("Year", "variable", "Data_type", "value")
  f_data_reshape$Model <- "Data-poor EM"
  f_data_reshape$Scenario <- paste0("S", scenario_id)

  # FMSY
  fmsy_data <- data.frame(
    min = unlist(lapply(projection_output3, function(x) min(x$FMSYstore))),
    max = unlist(lapply(projection_output3, function(x) max(x$FMSYstore))),
    Year = projection_year,
    Data_type = "FMSY"
  )
  fmsy_data_reshape <- reshape2::melt(fmsy_data, id = c("Year", "Data_type"))
  colnames(fmsy_data_reshape) <- c("Year", "variable", "Data_type", "value")
  fmsy_data_reshape$Model <- "Data-poor EM"
  fmsy_data_reshape$Scenario <- paste0("S", scenario_id)

  summary_data <- rbind(summary_data, biomass_data_reshape, landings_data, f_data_reshape, fmsy_data_reshape)

  # Projection years
  indicators <- c("dbsra",
                  "amo", "pdsi",
                  "bassb",
                  "menhadenc",
                  "basscpue", "herringcpue")
  indicators_fmsy <- c("DBSRA",
                       "amo", "pdsi",
                       "bassB",
                       "menhadenC",
                       "bassCPUE", "herringCPUE")

  for (indicators_id in seq_along(indicators)){
    if (ewe_scenario_name == "ecosim_fleet_dynamics") {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections_fleet_dynamics",
                              paste0(ewe_scenario_name, "_annualF_data_poor_", terminal_year, scenario_filename, "_", indicators[indicators_id]))
    } else {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections",
                              paste0(ewe_scenario_name, "_data_poor_", terminal_year, scenario_filename,"_", indicators[indicators_id]))
    }

    biomass <- IP4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "biomass_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    waa <- IP4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "weight_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    catch <- IP4EBFM::read_ewe_output(
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

  # FMSY
  fmsy_data <- data.frame(
    min = min(jabba$refpts_posterior$Fmsy),
    max = max(jabba$refpts_posterior$Fmsy),
    Year = projection_year,
    Data_type = "FMSY"
  )
  fmsy_data_reshape <- reshape2::melt(fmsy_data, id = c("Year", "Data_type"))
  colnames(fmsy_data_reshape) <- c("Year", "variable", "Data_type", "value")
  fmsy_data_reshape$Model <- "Data-moderate EM"
  fmsy_data_reshape$Scenario <- paste0("S", scenario_id)

  summary_data <- rbind(summary_data, biomass_data_reshape, landings_data_reshape,
                        f_data_reshape, fmsy_data_reshape)

  # Projection years
  indicators <- c("jabba",
                  "amo", "pdsi",
                  "bassb",
                  "menhadenc", "menhadene", "menhadencpue",
                  "basscpue", "herringcpue")
  indicators_fmsy <- c("JABBA",
                       "amo", "pdsi",
                       "bassB",
                       "menhadenC", "menhadenE", "menhadenCPUE",
                       "bassCPUE", "herringCPUE")

  for (indicators_id in seq_along(indicators)){
    if (ewe_scenario_name == "ecosim_fleet_dynamics") {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections_fleet_dynamics",
                              paste0(ewe_scenario_name, "_annualF_data_moderate_", terminal_year, scenario_filename, "_", indicators[indicators_id]))
    } else {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections",
                              paste0(ewe_scenario_name, "_data_moderate_", terminal_year, scenario_filename,"_", indicators[indicators_id]))
    }

    biomass <- IP4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "biomass_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    waa <- IP4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "weight_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    catch <- IP4EBFM::read_ewe_output(
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

  mcmc_dir <- here::here(dirname(here::here()), paste0(ewe_scenario_name, "_mcmc_", terminal_year, scenario_filename))
  mcmc_output <- r4ss::SSgetMCMC(mcmc_dir)

  # FMSY
  fmsy_data <- data.frame(
    min = min(mcmc_output$annF_MSY),
    max = max(mcmc_output$annF_MSY),
    Year = projection_year,
    Data_type = "FMSY"
  )
  fmsy_data_reshape <- reshape2::melt(fmsy_data, id = c("Year", "Data_type"))
  colnames(fmsy_data_reshape) <- c("Year", "variable", "Data_type", "value")
  fmsy_data_reshape$Model <- "Data-rich EM"
  fmsy_data_reshape$Scenario <- paste0("S", scenario_id)
  summary_data <- rbind(summary_data, fmsy_data_reshape)

  # Projection years
  indicators <- c("ss3",
                  "amo", "pdsi",
                  "bassb", "meanage",
                  "menhadenc", "menhadene", "menhadencpue",
                  "basscpue", "herringcpue")
  indicators_fmsy <- c("SS3",
                       "amo", "pdsi",
                       "bassB", "meanage",
                       "menhadenC", "menhadenE", "menhadenCPUE",
                       "bassCPUE", "herringCPUE")

  for (indicators_id in seq_along(indicators)){
    if (ewe_scenario_name == "ecosim_fleet_dynamics") {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections_fleet_dynamics",
                              paste0(ewe_scenario_name, "_annualF_data_rich_", terminal_year, scenario_filename, "_", indicators[indicators_id]))
    } else {
      file_path <- here::here("data", "ewe", "7ages_ecosim_om_projections",
                              paste0(ewe_scenario_name, "_data_rich_", terminal_year, scenario_filename,"_", indicators[indicators_id]))
    }

    biomass <- IP4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "biomass_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    waa <- IP4EBFM::read_ewe_output(
      file_path = file_path,
      file_names = "weight_monthly.csv",
      skip_nrows = 8,
      plot = FALSE,
      figure_titles = NULL,
      functional_groups = functional_groups,
      figure_colors = NULL
    )

    catch <- IP4EBFM::read_ewe_output(
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

# Data-poor data -------------------------------------------------------

data_poor_variable <- c(intersect(unique(summary_data$variable[which(summary_data$Model == "OM")]),
                                  unique(summary_data$variable[which(summary_data$Model == "Data-poor EM")])), "FMSY")
indicators <- c("dbsra",
                "amo", "pdsi",
                "bassb",
                "menhadenc",
                "basscpue", "herringcpue")

data_poor_data <- summary_data[which((summary_data$variable %in% data_poor_variable) & summary_data$Model %in% c("OM", "Data-poor EM", paste0("Data-poor ", indicators))),]
data_poor_data$Model[which(data_poor_data$variable == "FMSY")] <- "FMSY-EM"
data_poor_data$variable[which(data_poor_data$variable == "FMSY")] <- "F_apical"
data_poor_data$Model <- factor(data_poor_data$Model, levels = c("OM", "Data-poor EM", "Data-poor dbsra", "FMSY-EM", "Data-poor amo", "Data-poor pdsi", "Data-poor bassb",
                                                                "Data-poor basscpue", "Data-poor herringcpue", "Data-poor menhadenc", "Data-poor menhadenv"))
levels(data_poor_data$Model) <- c("OM", "Data-poor EM", "FMSY-EM", "FMSY-EM", "Fadj-I1", "Fadj-I2", "Fadj-I3",
                                  "Fadj-I5", "Fadj-I6", "Fadj-I7",
                                  "Fadj-IV")

data_poor_data$Year_type[data_poor_data$Year %in% model_year] <- "Fit"
data_poor_data$Year_type[data_poor_data$Year %in% projection_year] <- "Projection"

# Data-moderate data ---------------------------------------------------

data_moderate_variable <- intersect(unique(summary_data$variable[which(summary_data$Model == "OM")]),
                                    unique(summary_data$variable[which(summary_data$Model == "Data-moderate EM")]))
data_moderate_variable <- c(data_moderate_variable, "F_apical", "FMSY")

indicators <- c("jabba",
                "amo", "pdsi",
                "bassb",
                "menhadenc", "menhadene", "menhadencpue",
                "basscpue", "herringcpue")

data_moderate_data <- summary_data[which((summary_data$variable %in% data_moderate_variable) & summary_data$Model %in% c("OM", "Data-moderate EM", paste0("Data-moderate ", indicators))),]

data_moderate_data$Model[which(data_moderate_data$variable == "FMSY")] <- "FMSY-EM"
data_moderate_data$variable[which(data_moderate_data$variable == "FMSY")] <- "F_apical"

data_moderate_data$Model <- factor(data_moderate_data$Model, levels = c("OM", "Data-moderate EM", "Data-moderate jabba", "FMSY-EM", "Data-moderate amo", "Data-moderate pdsi", "Data-moderate bassb",
                                                                        "Data-moderate basscpue", "Data-moderate herringcpue", "Data-moderate menhadenc", "Data-moderate menhadenv", "Data-moderate menhadene", "Data-moderate menhadencpue"))
levels(data_moderate_data$Model) <- c("OM", "Data-moderate EM", "FMSY-EM", "FMSY-EM", "Fadj-I1", "Fadj-I2", "Fadj-I3",
                                      "Fadj-I5", "Fadj-I6", "Fadj-I7",
                                      "Fadj-IV", "Fadj-I8",
                                      "Fadj-I9")

data_moderate_data$Year_type[data_moderate_data$Year %in% model_year] <- "Fit"
data_moderate_data$Year_type[data_moderate_data$Year %in% projection_year] <- "Projection"

# Data-rich figures -------------------------------------------------------

data_rich_variable <- intersect(unique(summary_data$variable[which(summary_data$Model == "OM")]),
                                unique(summary_data$variable[which(summary_data$Model == "Data-rich EM")]))
data_rich_variable <- c(data_rich_variable, "F_apical", "FMSY")
indicators <- c("ss3",
                "amo", "pdsi",
                "bassb", "meanage",
                "menhadenc", "menhadene", "menhadencpue",
                "basscpue", "herringcpue")

data_rich_data <- summary_data[which((summary_data$variable %in% data_rich_variable) & summary_data$Model %in% c("OM", "Data-rich EM", paste0("Data-rich ", indicators))),]
data_rich_data$Model[which(data_rich_data$variable == "FMSY")] <- "FMSY-EM"
data_rich_data$variable[which(data_rich_data$variable == "FMSY")] <- "F_apical"

data_rich_data$Model <- factor(data_rich_data$Model, levels = c("OM", "Data-rich EM", "Data-rich ss3", "FMSY-EM", "Data-rich amo", "Data-rich pdsi", "Data-rich bassb", "Data-rich meanage",
                                                                "Data-rich basscpue", "Data-rich herringcpue", "Data-rich menhadenc", "Data-rich menhadenv", "Data-rich menhadene", "Data-rich menhadencpue"))
levels(data_rich_data$Model) <- c("OM", "Data-rich EM", "FMSY-EM", "FMSY-EM", "Fadj-I1", "Fadj-I2", "Fadj-I3", "Fadj-I4",
                                  "Fadj-I5", "Fadj-I6", "Fadj-I7",
                                  "Fadj-IV", "Fadj-I8",
                                  "Fadj-I9")

data_rich_data$Year_type[data_rich_data$Year %in% model_year] <- "Fit"
data_rich_data$Year_type[data_rich_data$Year %in% projection_year] <- "Projection"


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
  # temp$Menhaden_Biomass[which(temp$Menhaden_Biomass < 0)] <- log(1.0001)
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
  temp$Model <- "Data-poor EM"
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
  temp$Model <- "Data-moderate EM"
  temp$scenario <- paste0("S", scenario_id)
  temp  <-  temp[!((temp$variable %in% data_moderate_non_significant_indicator[[scenario_id]])), ]
  soi_data <- rbind(soi_data, temp)


  # Load data-rich RData
  data_rich_non_significant_indicator <- list(
    c("amo", "pdsi"),
    c(),
    c()
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
  soi_data_melt_om$Model <- "OM"
  soi_data_melt_om$scenario <- paste0("S", scenario_id)
  if (scenario_id == 1) soi_data_melt_om  <-  soi_data_melt_om[!((soi_data_melt_om$variable %in% c("amo", "pdsi"))), ]

  temp <- output$soi_data_melt
  temp$Model <- "Data-rich EM"
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

ggplot(lm_data[which(!lm_data$Variable == "IV"), ], aes(x = Index_Value, y = Menhaden_Biomass, color = model)) +
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

soi_data$Model <- factor(soi_data$Model, levels = c("OM",
                                                    "Data-poor EM",
                                                    "Data-moderate EM",
                                                    "Data-rich EM"))

ggplot(soi_data[soi_data$projection_year_id == 2013 & !(soi_data$variable %in% "IV"), ], aes(x = year, y = value, color = Model)) +
  geom_line(alpha = 0.8, size=0.8, aes(linetype = Model)) +
  # geom_line(size=1) +
  geom_point(aes(shape = Model)) +
  facet_grid(variable~scenario) +
  # scale_shape_manual(values = soi_data[soi_data$projection_year_id == 2013, "model"]) +
  # facet_grid(scenario~variable) +
  labs(
    x = "Year",
    y = "Status of Indicator"
  ) +
  theme_bw()+
  theme(
    axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
    legend.position = "bottom",
    strip.text = element_text(size=12),
    axis.text=element_text(size=8),
    axis.title=element_text(size=12,face="bold"),
    legend.text=element_text(size=12),
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
    y = bquote(B[2012]/B[MSY] ~ "or" ~ SB[2012]/SB[MSY])
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

# F for projections -------------------------------------------------------

fmsy_data$variable <- factor(fmsy_data$variable, levels = c("Default F", "amo", "pdsi", "bassB", "meanage",
                                                          "bassCPUE", "herringCPUE", "menhadenC",
                                                          "menhadenV",
                                                          "menhadenE", "menhadenCPUE"))

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


# Function to combine figures ---------------------------------------------

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
      axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
      strip.text = element_text(size = 10),
      axis.text = element_text(size = 8),
      axis.title = element_text(size = 10, face = "bold"),
      legend.text = element_text(size = 12),
      legend.title = element_text(size = 15, face = "bold")
    )

  # Status of indicators

  data_subset <- soi_data[which(soi_data$Model %in% c("OM", em_name) &
                                  soi_data$scenario == scenario &
                                  soi_data$projection_year_id == 2013 &
                                  soi_data$Model %in% include_model &
                                  soi_data$variable %in% indicator_id), ]

  s1_soi_data <- data_subset[which(data_subset$variable %in% paste0("I", c(1:3, 5, 6, 7))), ]

  soi_figure <- ggplot(
    data_subset,
    aes(x = year, y = value, color = Model)
  ) +
    geom_point(data_subset[which(data_subset$year == tail(model_year, n = 1)), ],
               mapping = aes(x = year, y = value, pch = Model), size = 2, alpha = 0.5
    ) +
    scale_colour_manual(values = model_color[c("OM", em_name)]) +
    geom_line(alpha = 0.5, linewidth = 1, aes(linetype = Model)) +
    geom_hline(yintercept = 0.5, lty = 2) +
    facet_wrap(~ scenario + variable, labeller = labeller(.multi_line = F)) +
    labs(
      label = "",
      x = "Year",
      y = "Status of Indicator"
    ) +
    theme_bw() +
    theme(
      axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
      legend.position = "bottom",
      strip.text = element_text(size = 10),
      axis.text = element_text(size = 8),
      axis.title = element_text(size = 10, face = "bold"),
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
        axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
        strip.text = element_text(size = 10),
        axis.text = element_text(size = 8),
        axis.title = element_text(size = 10, face = "bold"),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 15, face = "bold")
      )

    soi_figure <- ggplot(
      s1_soi_data,
      aes(x = year, y = value, color = Model)
    ) +
      geom_point(data_subset[which(data_subset$year == tail(model_year, n = 1)), ],
                 mapping = aes(x = year, y = value, pch = Model), size = 2, alpha = 0.5
      ) +
      scale_colour_manual(values = model_color[c("OM", em_name)]) +
      geom_line(alpha = 0.5, linewidth = 1, aes(linetype = Model)) +
      geom_hline(yintercept = 0.5, lty = 2) +
      facet_wrap(~ scenario + variable, labeller = labeller(.multi_line = F)) +
      labs(
        label = "",
        x = "Year",
        y = "Status of Indicator"
      ) +
      theme_bw() +
      theme(
        axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
        legend.position = "bottom",
        strip.text = element_text(size = 10),
        axis.text = element_text(size = 8),
        axis.title = element_text(size = 10, face = "bold"),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 15, face = "bold")
      )
  }


  # Bratio
  if (em_name == "Data-rich EM"){
    bratio_ylabel <- bquote(B[2012]/B[MSY] ~ "or" ~ SB[2012]/SB[MSY])
  } else {
    bratio_ylabel <- bquote(B[2012] / B[MSY])
  }
  data_subset <- bratio_data[which(bratio_data$model %in% c("OM", em_name) &
                                     bratio_data$scenario == scenario), ]

  bratio_figure <- ggplot(
    data_subset[!(data_subset$model == "OM"), ],
    aes(x = scenario, y = bratio)
  ) +
    geom_boxplot(outlier.size = 0.5, color = model_color[em_name]) +
    labs(
      x = "Scenario",
      y = bratio_ylabel
    ) +
    geom_point(data_subset[data_subset$model == "OM", ],
               mapping = aes(x = scenario, y = bratio), pch = 8,
               color = model_color["OM"], size = 5
    ) +
    theme_bw() +
    theme(
      axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
      legend.position = "bottom",
      strip.text = element_text(size = 10),
      axis.text = element_text(size = 8),
      axis.title = element_text(size = 10, face = "bold"),
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
          data_subset[which(data_subset$Model == "OM" &
                              !(data_subset$Year %in% projection_year)), ],
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
          linetype = "longdash"
        ) +
        geom_line(
          data_subset[which(data_subset$Data_type == "max"), ],
          mapping = aes(
            x = Year, y = value,
            color = Model
          ),
          linetype = "longdash"
        ) +
        geom_point(
          data_subset[which(data_subset$Year_type == "Projection" & data_subset$variable == "F_apical" &
                              !(data_subset$Model %in% c("Data-poor EM", "Ensemble model")) &
                              !(data_subset$Data_type %in% c("min", "max"))), ],
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
        scale_colour_manual("Adjusted F", values = indicator_color[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        scale_shape_manual("Adjusted F", values = indicator_shape[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        labs(
          color = "Adjusted F",
          shape = "Adjusted F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 10),
          axis.text = element_text(size = 8),
          axis.title = element_text(size = 10, face = "bold"),
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
          color = "Adjusted F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 10),
          axis.text = element_text(size = 8),
          axis.title = element_text(size = 10, face = "bold"),
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
          color = "Adjusted F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 10),
          axis.text = element_text(size = 8),
          axis.title = element_text(size = 10, face = "bold"),
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
          color = "Adjusted F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 10),
          axis.text = element_text(size = 8),
          axis.title = element_text(size = 10, face = "bold"),
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
      # data_subset[which(data_subset$variable == "F_average" &
      #                     data_subset$Model == "Data-moderate EM"), "variable"] <- "F_apical"
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
                              !(data_subset$Model %in% c("Data-rich EM", "Ensemble model")) &
                              !(data_subset$Data_type %in% c("min", "max"))), ],
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
        scale_colour_manual("Adjusted F", values = indicator_color[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        scale_shape_manual("Adjusted F", values = indicator_shape[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        labs(
          color = "Adjusted F",
          shape = "Adjusted F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 10),
          axis.text = element_text(size = 8),
          axis.title = element_text(size = 10, face = "bold"),
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
          color = "Adjusted F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 10),
          axis.text = element_text(size = 8),
          axis.title = element_text(size = 10, face = "bold"),
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
                              !(data_subset$Model %in% c("Data-rich EM", "Ensemble model")) &
                              !(data_subset$Data_type %in% c("min", "max"))), ],
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
        scale_colour_manual("Adjusted F", values = indicator_color[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        scale_shape_manual("Adjusted F", values = indicator_shape[c("OM", "FMSY-EM", paste0("Fadj-", indicator_id))]) +
        labs(
          color = "Adjusted F",
          shape = "Adjusted F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 10),
          axis.text = element_text(size = 8),
          axis.title = element_text(size = 10, face = "bold"),
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
          color = "Adjusted F",
          x = "Year",
          y = "Value"
        ) +
        theme_bw() +
        theme(
          axis.text.x = element_text(angle = 20, vjust = 1, hjust = 1),
          legend.position = "bottom",
          strip.text = element_text(size = 10),
          axis.text = element_text(size = 8),
          axis.title = element_text(size = 10, face = "bold"),
          legend.text = element_text(size = 15),
          legend.title = element_text(size = 15, face = "bold")
        )
    }
  }




  # Combine figures
  # With lm_figure
  if (original_indicator_id == 0){
    ggpubr::ggarrange(
      bratio_figure,
      projection_figure,
      ncol = 2,
      widths = c(0.5, 1.5),
      labels = c("A)", "B)")
    )
  } else {
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
  }
  ggsave(paste0(figure_path, "_with_lm.jpeg"))

  if (em_name == "Data-poor EM") {

    if (original_indicator_id == 0){
      ggpubr::ggarrange(
        bratio_figure,
        projection_withoutci_figure,
        ncol = 2,
        widths = c(0.5, 1.5),
        labels = c("A)", "B)")
      )
    } else {
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

    }
    ggsave(paste0(figure_path, "_with_lm_without_ci.jpeg"))
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
    "OM", "Data-moderate EM", "FMSY-EM", "Fadj-I9"),
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
    "OM", "Data-rich EM", "FMSY-EM", "Fadj-I1", "Fadj-I4",
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
