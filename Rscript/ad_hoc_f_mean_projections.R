devtools::load_all()

scenario_filename <- "_lowCV"
terminal_year <- 2012
fishery_CV_input <- 0.05
survey_CV_input <- 0.1
add_environmental_effects <- TRUE
add_fleet_dynamics <- FALSE

source(here::here("Rscript", "simulationOM3.R"))


# Ensemble F --------------------------------------------------------------

# Data-moderate S2 ensemble F
ewe_scenario_name <- "ecosim_forcing_pdsi_egg_amo1"
data_moderate_f_s2 <- read.csv(here::here(
  "data", "data_moderate", ewe_scenario_name,
  paste0("fmsy_data_", terminal_year, scenario_filename, ".csv")
))

indicator_name <- c("amo", "menhadenCPUE")

temp <- data_moderate_f_s2$value[data_moderate_f_s2$variable %in% indicator_name]
data_moderate_f_s2_mean <- mean(temp)
data_moderate_f_s2_ci <- t.test(temp, conf.level = 0.95)$conf.int

fishery_sel <- IP4EBFM::logistic(
  pattern = "double_logistic",
  x = sa_data$biodata$ages,
  slope_asc = 3.1,
  location_asc = 1.8,
  slope_desc = 0.88,
  location_desc = 0.01
)

data_moderate_f_s2_age <- data_moderate_f_s2_mean * fishery_sel

# Data-rich S2 ensemble F
ewe_scenario_name <- "ecosim_forcing_pdsi_egg_amo1"
data_rich_f_s2 <- read.csv(here::here(
  "data", "data_rich", ewe_scenario_name,
  paste0("fmsy_data_", terminal_year, scenario_filename, ".csv")
))

indicator_name <- c("amo", "meanage", "menhadenCPUE")
temp <- data_rich_f_s2$value[data_rich_f_s2$variable %in% indicator_name]
data_rich_f_s2_mean <- mean(temp)
data_rich_f_s2_ci <- t.test(temp, conf.level = 0.95)$conf.int

data_rich_f_s2_age <- data_rich_f_s2_mean * fishery_sel

# Data-rich S1 ensemble F
scenario_filename <- "_lowCV"
terminal_year <- 2012
fishery_CV_input <- 0.05
survey_CV_input <- 0.1
add_environmental_effects <- FALSE
add_fleet_dynamics <- FALSE

source(here::here("Rscript", "simulationOM3.R"))
ewe_scenario_name <- "ecosim_base_run"
data_rich_f_s1 <- read.csv(here::here(
  "data", "data_rich", ewe_scenario_name,
  paste0("fmsy_data_", terminal_year, scenario_filename, ".csv")
))

indicator_name <- c("meanage", "menhadenCPUE")
temp <- data_rich_f_s1$value[data_rich_f_s1$variable %in% indicator_name]
data_rich_f_s1_mean <- mean(temp)
data_rich_f_s1_ci <- t.test(temp, conf.level = 0.95)$conf.int

data_rich_f_s1_age <- data_rich_f_s1_mean * fishery_sel



# CIs ---------------------------------------------------------------------
scenario_filename <- "_lowCV"
terminal_year <- 2012
fishery_CV_input <- 0.05
survey_CV_input <- 0.1
add_environmental_effects_vec <- c(FALSE, TRUE, TRUE)
add_fleet_dynamics_vec <- c(FALSE, FALSE, TRUE)

# data-poor
data_poor_ci <- data_poor_median <- list()

for (i in 1:3){
  add_environmental_effects <- add_environmental_effects_vec[i]
  add_fleet_dynamics <- add_fleet_dynamics_vec[i]

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

  load(here::here("data", "data_poor", ewe_scenario_name, paste0("dbsra_soi_output3_", terminal_year, scenario_filename, ".RData")))

  fmsy <- soi_output3$fmsy_data_melt

  indicators <- unique(fmsy$variable)

  data_poor_median[[i]] <- data_poor_ci[[i]] <-list()

  for (variable in indicators) {

    # Subset the data for the current variable
    temp <- fmsy$value[fmsy$variable == variable]

    # Calculate the median
    data_poor_median[[i]][[variable]] <- median(temp)

    # Calculate the 95% confidence interval
    data_poor_ci[[i]][[variable]] <- t.test(temp, conf.level = 0.95)$conf.int

  }
}

# data-moderate
data_moderate_ci <- data_moderate_median <- list()

for (i in 1:3){
  add_environmental_effects <- add_environmental_effects_vec[i]
  add_fleet_dynamics <- add_fleet_dynamics_vec[i]

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

  fmsy <- read.csv(here::here(
    "data", "data_moderate", ewe_scenario_name,
    paste0("fmsy_data_", terminal_year, scenario_filename, ".csv")
  ))


  indicators <- unique(fmsy$variable)

  data_moderate_median[[i]] <- data_moderate_ci[[i]] <-list()

  for (variable in indicators) {

    # Subset the data for the current variable
    temp <- fmsy$value[fmsy$variable == variable]

    # Calculate the median
    data_moderate_median[[i]][[variable]] <- median(temp)

    # Calculate the 95% confidence interval
    data_moderate_ci[[i]][[variable]] <- t.test(temp, conf.level = 0.95)$conf.int

  }
}

# data_rich
data_rich_ci <- data_rich_median <- list()

for (i in 1:3){
  add_environmental_effects <- add_environmental_effects_vec[i]
  add_fleet_dynamics <- add_fleet_dynamics_vec[i]

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

  fmsy <- read.csv(here::here(
    "data", "data_rich", ewe_scenario_name,
    paste0("fmsy_data_", terminal_year, scenario_filename, ".csv")
  ))

  indicators <- unique(fmsy$variable)

  data_rich_median[[i]] <- data_rich_ci[[i]] <-list()

  for (variable in indicators) {

    # Subset the data for the current variable
    temp <- fmsy$value[fmsy$variable == variable]

    # Calculate the median
    data_rich_median[[i]][[variable]] <- median(temp)

    # Calculate the 95% confidence interval
    data_rich_ci[[i]][[variable]] <- t.test(temp, conf.level = 0.95)$conf.int

  }
}



