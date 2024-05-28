# Load AMO index --------------------------------------------------

amo_unsmooth_lag0 <- read.csv(
  here::here("data", "ewe", "amo_unsmooth_lag0.csv")
)

amo_unsmooth_lag1 <- read.csv(
  here::here("data", "ewe", "amo_unsmooth_lag1.csv")
)

# Load precipitation index ----------------------------------------

precipitation <- read.csv(
  here::here("data", "ewe", "precipitation.csv")
)

# Load PDSI index -------------------------------------------------
palmer_drought_severity_index <- read.csv(
  here::here("data", "ewe", "palmer_drought_severity_index.csv")
)

# Load SST data ---------------------------------------------------
kaplan_sst <- read.csv(
  here::here("data", "ewe", "kaplan_sst.csv")
)

# Load Striped bass biomass index ---------------------------------

ewe_output <- read_ewe_output(
  file_path = ewe_output_path,
  file_names = "biomass_monthly.csv",
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = functional_groups,
  figure_colors = NULL
)

bass_bio <- data.frame(
  Year = ewe_output[[1]]$Year,
  bass_bio = apply(ewe_output[[1]][grep("StripedBass", names(ewe_output[[1]]))], 1, sum) * 1000000
)


# Load effort and cpue indices ------------------------------------
catch <- read_ewe_output(
  file_path = ewe_output_path,
  file_names = "catch_monthly.csv",
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = functional_groups,
  figure_colors = NULL
)

catch_fleet_name <- c(
  "StripedBass",
  "AtlanticMenhaden",
  "SpinyDogfish",
  "Bluefish",
  "Weakfish",
  "AtlanticHerring"
)

effort_all <- read.csv(
  here::here("data", "ewe", "7ages_ecosim_om", paste0(ewe_scenario_name, "_effort_all.csv"))
)

effort_fleet_name <- c(
  "F.striped.bass",
  "F.menhaden",
  "F.spiny.dogfish",
  "F.bluefish",
  "F.weakfish",
  "F.herring"
)

if (add_fleet_dynamics == TRUE) {
  catch_all <- cpue_all <- effort_all

  for (i in seq_along(effort_fleet_name)) {
    catch_all[, effort_fleet_name[i]] <- apply(as.data.frame(catch[[1]][, grep(catch_fleet_name[i], names(catch[[1]]))]), 1, sum)
    cpue_all[, effort_fleet_name[i]] <- catch_all[, effort_fleet_name[i]] / effort_all[, effort_fleet_name[i]]
  }
}

if (add_fleet_dynamics == FALSE) {
  fatage_all <- read.csv(
    here::here("data", "ewe", "7ages_ecosim_om", paste0(ewe_scenario_name, "_fatage_all.csv"))
  )

  cpue_all <- effort_all

  for (i in seq_along(effort_fleet_name)) {
    apical_f_all <- apply(as.data.frame(fatage_all[, grep(catch_fleet_name[i], names(fatage_all))]), 1, max)
    # cpue = C/E = C/(F/q) where q is fixed value
    cpue_all[, effort_fleet_name[i]] <- apply(as.data.frame(catch[[1]][, grep(catch_fleet_name[i], names(catch[[1]]))]), 1, sum) /
      apical_f_all
  }
}

# menhaden_cpue <- cpue_all$F.menhaden

# Calculate menhaden-like CPUE --------------------------------------------

# catch <- read_ewe_output(
#   file_path = ewe_output_path,
#   file_names = "catch_monthly.csv",
#   skip_nrows = 8,
#   plot = FALSE,
#   figure_titles = NULL,
#   functional_groups = functional_groups,
#   figure_colors = NULL
# )
# menhaden_catch <- apply(catch[[1]][, age_name], 1, sum)
# menhaden_cpue <- menhaden_catch/effort$X

# Load menhaden price index ---------------------------------------------
# data were downloaded from https://www.fisheries.noaa.gov/foss/f?p=215:200:15209701672686::NO:RP::
# cannot use the data because we are simulating the fishery without fitting to real observations

menhaden_price <- read.csv(
  here::here("data", "ewe", "menhaden_price.csv")
)

atlantic_menhaden_price <- read.csv(
  here::here("data", "ewe", "atlantic_menhaden_price.csv")
)


# Calculate value index --------------------------------------------------------

catch_all <- value_all <- effort_all

off_vessel_price <- data.frame(
  "F.striped.bass" = 1.801,
  "F.menhaden" = 0.191,
  "F.spiny.dogfish" = 0.138,
  "F.bluefish" = 0.329,
  "F.weakfish" = 0.900,
  "F.herring" = 0.0972
)

for (i in seq_along(effort_fleet_name)) {
  catch_all[, effort_fleet_name[i]] <- apply(as.data.frame(catch[[1]][, grep(catch_fleet_name[i], names(catch[[1]]))]), 1, sum)
  # convert catch_all to mt: *1000000; convert price/lb to price/mt: /0.000453592
  value_all[, effort_fleet_name[i]] <- catch_all[, effort_fleet_name[i]] * 1000000 * as.numeric(off_vessel_price[effort_fleet_name[i]]) / 0.000453592
}


# Load indicators from EwE outputs
# ewe_ind_path <- here::here(
#   "data", "ewe", "ewe7ages_ecosim_scenarios",
#   "ecosim_amo_lag1_pcp", "biodiv_ind_Ecosim.csv"
# )
#
# ewe_ind <- scan(ewe_ind_path, what = "", sep = "\n")
# col_name <- read.table(
#   text = as.character(ewe_ind[7]),
#   sep = ","
# )
# ewe_ind <- read.table(
#   text = as.character(ewe_ind[-c(1:7)]),
#   sep = ",",
#   col.names = col_name
# )

# Load catchability data ------------------------------------------
menhadenCatchability <- read.csv(file.path(
  ewe_output_path,
  "NWACS AM 7ages-Ecosim_catchbility_F.menhaden.csv"
))
menhadenCatchability <- subset(menhadenCatchability, select = -c(X))
menhadenCatchability <- menhadenCatchability[, grep("menhaden", colnames(menhadenCatchability))]


bassCatchability <- read.csv(file.path(
  ewe_output_path,
  "NWACS AM 7ages-Ecosim_catchbility_F.striped bass.csv"
))
bassCatchability <- subset(bassCatchability, select = -c(X))
bassCatchability <- bassCatchability[, grep("striped.bass", colnames(bassCatchability))]

herringCatchability <- read.csv(file.path(
  ewe_output_path,
  "NWACS AM 7ages-Ecosim_catchbility_F.herring.csv"
))
herringCatchability <- subset(herringCatchability, select = -c(X))
herringCatchability <- herringCatchability[, grep("Atlantic.herring", colnames(herringCatchability))]
# Load fishing mortality at age data ------------------------------
# ewe_faa <- read.csv(here::here("data", "ewe", "7ages_newsim_final", "fatage.csv"))
# ewe_faa <- read.csv(file.path(dirname(dirname(file_path)), "fatage.csv"))

ewe_faa_all <- read.csv(file.path(dirname(ewe_output_path), paste0(ewe_scenario_name, "_fatage_all.csv")))

lm_slope <- data.frame(
  case = "True indices",
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

year_id <- seq(1, nrow(amo_unsmooth_lag1), by = 12)
index_year <- c(model_year)
lag <- 1
biomass_lag_id <- (1 + lag):length(index_year)
index_lag_id <- 1:(length(index_year) - lag)

data_transformation <- function(data){
  if (shapiro.test(data)$p.value > 0.05){
    output <- data
  } else if (shapiro.test(log(data))$p.value > 0.05){
    output <- log(data)
  } else {
    output <- data
  }
}

# y <- data_transformation(biomass_ewe[time_id][biomass_lag_id])
y <- log(biomass_ewe[time_id][biomass_lag_id])

regression_analysis <- function(x, y){
  # x_vec <- data_transformation(data=x)
  x_vec <- x
  m_lm <- lm(y~x_vec)
  m_glm <- glm(y~x_vec)
  # m_clm <- lm(y~x_vec+I(x_vec^2))
  m_clm <- lm(y~x_vec)

  anova_output <- anova(m_lm, m_clm)$`Pr(>F)`[2]
  aic_vec <- c(AIC(m_lm), AIC(m_glm), AIC(m_clm))
  names(aic_vec) <- c("lm", "glm", "clm")
  aic_min <- names(aic_vec)[which.min(aic_vec)]

  if (
    anova_output <= 0.05 &
    aic_min == "clm" &
    shapiro.test(summary(m_clm)$residuals)$p.value <= 0.5 &
    summary(m_clm)$adj.r.squared >= 0.6
  ){
    # Interpret quadratic model results
    # Adding quadratic terms allows for non-linearity (in a linear model).
    # Significance of quadratic terms could signal that the relation is non-linear.
    # A positive quadratic term could suggest that the relation is exponential.
    # A negative relation suggests that for low values of your feature,
    # the relation might be positive, but for high values the relation becomes negative.
    selected_model <- m_clm
    selected_model_name <- "clm"
  } else {
    selected_model <- m_lm
    selected_model_name <- "lm"
  }

  x_coefficient <- ifelse(
    round(summary(selected_model)$coefficients["x_vec", "Estimate"], digits = 2) == 0,
    summary(selected_model)$coefficients["x_vec", "Estimate"],
    round(summary(selected_model)$coefficients["x_vec", "Estimate"], digits = 2)
  )

  output <- list(
    paste0(
      x_coefficient,
      if (summary(selected_model)$coefficients["x_vec", "Pr(>|t|)"] <= 0.05){"*"},
      if(summary(selected_model)$adj.r.squared >= 0.6){"^"},
      if (shapiro.test(summary(selected_model)$residuals)$p.value > 0.05) {"~"},
      selected_model_name
    ),
    selected_model
  )
}

# amo
amo <- amo_unsmooth_lag1[year_id, ]
amo_x <- amo$scaled_value[index_lag_id]
lm_slope$amo <- regression_analysis(x = amo_x, y)[[1]]
amo_model <- regression_analysis(x = amo_x, y)[[2]]

# pdsi
pdsi <- palmer_drought_severity_index[year_id, ]
pdsi_x <- pdsi$scaled_value[index_lag_id]
lm_slope$pdsi <- regression_analysis(x = pdsi_x, y)[[1]]
pdsi_model <- regression_analysis(x = pdsi_x, y)[[2]]

# bassB
bassB <- bass_bio[bass_bio$Year %in% year_id, ]
bassB_x <- bassB$bass_bio[index_lag_id]
lm_slope$bassB <- regression_analysis(x = bassB_x, y)[[1]]
bassB_model <- regression_analysis(x = bassB_x, y)[[2]]

# menhadenC

# menhadenCatch <- apply(as.data.frame(catch[[1]][, grep("AtlanticMenhaden", names(catch[[1]]))]), 1, sum) * 1000000
# menhadenC <- menhadenCatch[year_id]
menhadenC <- sa_data$fishery$obs_total_catch_biomass$fleet1
menhadenC_x <- menhadenC[index_lag_id]
lm_slope$menhadenC <- regression_analysis(x = menhadenC_x, y)[[1]]
menhadenC_model <- regression_analysis(x = menhadenC_x, y)[[2]]

# menhadenE
if (add_fleet_dynamics == TRUE) {
  menhadenEffort <- effort_all[, "F.menhaden"]
  menhadenE <- menhadenEffort[year_id]
} else {
  menhadenE <- apply(fatage_all[year_id, grep("AtlanticMenhaden", colnames(fatage_all))] / menhadenCatchability[year_id, grep("menhaden", colnames(menhadenCatchability))], 1, sum)
}
menhadenE_x <- menhadenE[index_lag_id]
lm_slope$menhadenE <- regression_analysis(x = menhadenE_x, y)[[1]]
menhadenE_model <- regression_analysis(x = menhadenE_x, y)[[2]]

# menhadenCPUE
if (add_fleet_dynamics == TRUE) {
  menhadenCPUE <- menhadenC / menhadenEffort[year_id]
} else {
  menhadenCPUE <- menhadenC / menhadenE
}
menhadenCPUE_x <- menhadenCPUE[index_lag_id]
lm_slope$menhadenCPUE <- regression_analysis(x = menhadenCPUE_x, y)[[1]]
menhadenCPUE_model <- regression_analysis(x = menhadenCPUE_x, y)[[2]]

# bassCPUE
bassCatch <- apply(as.data.frame(catch[[1]][, grep("StripedBass", names(catch[[1]]))]), 1, sum) * 1000000
bassC <- bassCatch[year_id]
if (add_fleet_dynamics == TRUE) {
  bassEffort <- effort_all[, "F.striped.bass"]
  bassE <- bassEffort[year_id]
}
if (add_fleet_dynamics == FALSE) {
  bassE <- apply(fatage_all[year_id, grep("StripedBass", colnames(fatage_all))] / bassCatchability[year_id, grep("striped.bass", colnames(bassCatchability))], 1, sum)
}
bassCPUE <- bassC / bassE
bassCPUE_x <- bassCPUE[index_lag_id]
lm_slope$bassCPUE <- regression_analysis(x = bassCPUE_x, y)[[1]]
bassCPUE_model <- regression_analysis(x = bassCPUE_x, y)[[2]]

# herringCPUE
herringCatch <- apply(as.data.frame(catch[[1]][, grep("AtlanticHerring", names(catch[[1]]))]), 1, sum) * 1000000
herringC <- herringCatch[year_id]
if (add_fleet_dynamics == TRUE) {
  herringEffort <- effort_all[, "F.herring"]
  herringE <- herringEffort[year_id]
}
if (add_fleet_dynamics == FALSE) {
  herringE <- apply(fatage_all[year_id, grep("AtlanticHerring", colnames(fatage_all))] / herringCatchability[year_id, grep("Atlantic.herring", colnames(herringCatchability))], 1, sum)
}
herringCPUE <- herringC / herringE
herringCPUE_x <- herringCPUE[index_lag_id]
lm_slope$herringCPUE <- regression_analysis(x = herringCPUE_x, y)[[1]]
herringCPUE_model <- regression_analysis(x = herringCPUE_x, y)[[2]]

# menhadenV
menhadenValue <- value_all[, "F.menhaden"]
menhadenV <- menhadenValue[year_id]
menhadenV_x <- menhadenV[index_lag_id]
lm_slope$menhadenV <- regression_analysis(x = menhadenV_x, y)[[1]]
menhadenV_model <- regression_analysis(x = menhadenV_x, y)[[2]]

write.csv(lm_slope, here::here("data", paste0(ewe_scenario_name, "_om_lm_slope_", terminal_year, scenario_filename, ".csv")))
# linear regression analysis summary table
lm_data_om <- rbind(
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

lm_data_om$model <- "OM"

jpeg(filename = file.path(figure_path, paste0("lm_slope_om_", ewe_scenario_name, "_", terminal_year, scenario_filename, ".jpeg")), width = 200, height = 100, units = "mm", res = 1800)
p <- gridExtra::tableGrob(lm_slope)
gridExtra::grid.arrange(p)
dev.off()

# Linear regression for CPUEs ---------------------------------------------
cpue_lm_slope <- data.frame(
  case = "OM CPUEs",
  menhaden_herring = NA,
  menhaden_bass = NA
)

shapiro.test(menhadenCPUE[biomass_lag_id]) # < 0.05, data is not normally distributed

menhaden_herring_lm <- lm(log(menhadenCPUE[biomass_lag_id]) ~ log(herringCPUE[index_lag_id]))
menhaden_herring_fit <- fitted(menhaden_herring_lm)

cpue_lm_slope$menhaden_herring <- paste0(
  round(summary(menhaden_herring_lm)$coefficients[2, 1], digits = 4),
  if (summary(menhaden_herring_lm)$coefficients[2, 4] <= 0.05) {
    "*"
  }
)

menhaden_bass_lm <- lm(log(menhadenCPUE[biomass_lag_id]) ~ log(bassCPUE[index_lag_id]))
menhaden_bass_fit <- fitted(menhaden_bass_lm)

cpue_lm_slope$menhaden_bass <- paste0(
  round(summary(menhaden_bass_lm)$coefficients[2, 1], digits = 4),
  if (summary(menhaden_bass_lm)$coefficients[2, 4] <= 0.05) {
    "*"
  }
)

write.csv(cpue_lm_slope, here::here("data", paste0(ewe_scenario_name, "_cpue_lm_slope_", terminal_year, scenario_filename, ".csv")))
