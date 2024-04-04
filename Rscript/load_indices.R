
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
  bass_bio = apply(ewe_output[[1]][grep("StripedBass",names(ewe_output[[1]]))], 1, sum)*1000000
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

catch_fleet_name <- c("StripedBass",
                      "AtlanticMenhaden",
                      "SpinyDogfish",
                      "Bluefish",
                      "Weakfish",
                      "AtlanticHerring")

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

if (add_fleet_dynamics == TRUE){

  catch_all <- cpue_all <- effort_all

  for (i in seq_along(effort_fleet_name)){
    catch_all[, effort_fleet_name[i]] <- apply(as.data.frame(catch[[1]][, grep(catch_fleet_name[i], names(catch[[1]]))]), 1, sum)
    cpue_all[, effort_fleet_name[i]] <- catch_all[, effort_fleet_name[i]]/effort_all[, effort_fleet_name[i]]
  }

}

if (add_fleet_dynamics == FALSE){
  fatage_all <- read.csv(
    here::here("data", "ewe", "7ages_ecosim_om", paste0(ewe_scenario_name, "_fatage_all.csv"))
  )

  cpue_all <- effort_all

  for (i in seq_along(effort_fleet_name)){
    apical_f_all <- apply(as.data.frame(fatage_all[, grep(catch_fleet_name[i], names(fatage_all))]), 1, max)
    # cpue = C/E = C/(F/q) where q is fixed value
    cpue_all[, effort_fleet_name[i]] <- apply(as.data.frame(catch[[1]][, grep(catch_fleet_name[i], names(catch[[1]]))]), 1, sum)/
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

for (i in seq_along(effort_fleet_name)){
  catch_all[, effort_fleet_name[i]] <- apply(as.data.frame(catch[[1]][, grep(catch_fleet_name[i], names(catch[[1]]))]), 1, sum)
  # convert catch_all to mt: *1000000; convert price/lb to price/mt: /0.000453592
  value_all[, effort_fleet_name[i]] <- catch_all[, effort_fleet_name[i]] *1000000 * as.numeric(off_vessel_price[effort_fleet_name[i]])/0.000453592
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
menhadenCatchability <- read.csv(file.path(ewe_output_path,
                                       "NWACS AM 7ages-Ecosim_catchbility_F.menhaden.csv"))
menhadenCatchability <- subset(menhadenCatchability, select=-c(X))
menhadenCatchability <- menhadenCatchability[, grep("menhaden", colnames(menhadenCatchability))]


bassCatchability <- read.csv(file.path(ewe_output_path,
                                       "NWACS AM 7ages-Ecosim_catchbility_F.striped bass.csv"))
bassCatchability <- subset(bassCatchability, select=-c(X))
bassCatchability <- bassCatchability[, grep("striped.bass", colnames(bassCatchability))]

herringCatchability <- read.csv(file.path(ewe_output_path,
                                         "NWACS AM 7ages-Ecosim_catchbility_F.herring.csv"))
herringCatchability <- subset(herringCatchability, select=-c(X))
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
lag = 1
biomass_lag_id <- (1+lag):length(index_year)
index_lag_id <- 1:(length(index_year)-lag)

shapiro.test(biomass_ewe[time_id][biomass_lag_id]) # < 0.05, data is not normally distributed
shapiro.test(log(biomass_ewe[time_id][biomass_lag_id])) # > 0.05, data is normally distributed
log_biomass_ewe <- log(biomass_ewe[time_id][biomass_lag_id])

amo <- amo_unsmooth_lag1[year_id, ]
shapiro.test(amo$scaled_value[index_lag_id]) # > 0.05, data is normally distributed
# amo_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ amo$scaled_value[index_lag_id])
amo_lm <- lm(log_biomass_ewe ~ amo$scaled_value[index_lag_id])
amo_fit <- fitted(amo_lm)
lm_slope$amo <- paste0(
  round(summary(amo_lm)$coefficients[2, 1], digits = 2),
  if (summary(amo_lm)$coefficients[2, 4] <= 0.05) {
    "*"
  }
)

pdsi <- palmer_drought_severity_index[year_id, ]
shapiro.test(pdsi$scaled_value[index_lag_id]) # > 0.05, data is normally distributed
# pdsi_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ pdsi$scaled_value[index_lag_id])
pdsi_lm <- lm(log_biomass_ewe ~ pdsi$scaled_value[index_lag_id])
pdsi_fit <- fitted(pdsi_lm)
lm_slope$pdsi <- paste0(
  round(summary(pdsi_lm)$coefficients[2, 1], digits = 2),
  if(summary(pdsi_lm)$coefficients[2, 4] <= 0.05) {"*"})

# if (add_fleet_dynamics == TRUE){
#   bassB <- log(bass_bio[bass_bio$Year %in% year_id, ])
# } else {
  bassB <- bass_bio[bass_bio$Year %in% year_id, ]
# }
# bassB_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ bassB$bass_bio[index_lag_id])
shapiro.test(bassB$bass_bio[index_lag_id]) # > 0.05, data is normally distributed

# OM3 with fleet dynamics: log(bassB$bass_bio[index_lag_id]) does not reduce residual standard error from linear regression analysis
shapiro.test(log(bassB$bass_bio[index_lag_id])) # > 0.05, data is normally distributed

bassB_lm <- lm(log_biomass_ewe ~ bassB$bass_bio[index_lag_id])
bassB_fit <- fitted(bassB_lm)
lm_slope$bassB <- paste0(
  round(summary(bassB_lm)$coefficients[2, 1], digits = 2),
  if(summary(bassB_lm)$coefficients[2, 4] <= 0.05) {"*"})

# sub_menhadenP <- menhaden_price$Inflation.Adjust.Price.Per.MT[menhaden_price$Year %in% index_year]
# price_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ sub_menhadenP[index_lag_id])
# price_fit <- fitted(price_lm)
# lm_slope$price <- paste0(
#   round(summary(price_lm)$coefficients[2, 1], digits = 2),
#   if(summary(price_lm)$coefficients[2, 4] <= 0.05) {"*"})

menhadenCatch <- apply(as.data.frame(catch[[1]][, grep("AtlanticMenhaden", names(catch[[1]]))]), 1, sum) *1000000
shapiro.test(menhadenCatch) # < 0.05, data is not normally distributed
shapiro.test(log(menhadenCatch)) # < 0.05, data is not normally distributed
# if (add_fleet_dynamics == TRUE){
#   menhadenC <- log(menhadenCatch[year_id])
# } else {
  menhadenC <- menhadenCatch[year_id]
# }
menhadenC_lm <- lm(log_biomass_ewe ~ log(menhadenC[index_lag_id]))
# menhadenC_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ menhadenC[index_lag_id])
menhadenC_fit <- fitted(menhadenC_lm)
lm_slope$menhadenC <- paste0(
  round(summary(menhadenC_lm)$coefficients[2, 1], digits = 2),
  if(summary(menhadenC_lm)$coefficients[2, 4] <= 0.05) {"*"})

if (add_fleet_dynamics == TRUE){
  menhadenEffort <- effort_all[, "F.menhaden"]
  menhadenE <- menhadenEffort[year_id]
} else {
  menhadenE <- apply(fatage_all[year_id, grep("AtlanticMenhaden", colnames(fatage_all))] / menhadenCatchability[year_id, grep("menhaden", colnames(menhadenCatchability))], 1, sum)
}
shapiro.test(menhadenE) # < 0.05, data is not normally distributed
shapiro.test(log(menhadenE)) # < 0.05, data is not normally distributed
# menhadenE_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ menhadenE[index_lag_id])
menhadenE_lm <- lm(log_biomass_ewe ~ log(menhadenE[index_lag_id]))
menhadenE_fit <- fitted(menhadenE_lm)
lm_slope$menhadenE <- paste0(
  round(summary(menhadenE_lm)$coefficients[2, 1], digits = 2),
  if(summary(menhadenE_lm)$coefficients[2, 4] <= 0.05) {"*"})

if (add_fleet_dynamics == TRUE){
  menhadenCPUE <- menhadenC/menhadenEffort[year_id]
} else {
  menhadenCPUE <- menhadenC/menhadenE
}
shapiro.test(menhadenCPUE) # < 0.05, data is not normally distributed
shapiro.test(log(menhadenCPUE)) # = 0.05
# menhadenCPUE_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ menhadenCPUE[index_lag_id])
menhadenCPUE_lm <- lm(log_biomass_ewe ~ log(menhadenCPUE[index_lag_id]))
menhadenCPUE_fit <- fitted(menhadenCPUE_lm)
lm_slope$menhadenCPUE <- paste0(
  round(summary(menhadenCPUE_lm)$coefficients[2, 1], digits = 2),
  if(summary(menhadenCPUE_lm)$coefficients[2, 4] <= 0.05) {"*"})

bassCatch <- apply(as.data.frame(catch[[1]][, grep("StripedBass", names(catch[[1]]))]), 1, sum) *1000000
bassC <- bassCatch[year_id]
if (add_fleet_dynamics == TRUE){
  bassEffort <- effort_all[, "F.striped.bass"]
  bassE <- bassEffort[year_id]
}
if (add_fleet_dynamics == FALSE){
  bassE <- apply(fatage_all[year_id, grep("StripedBass", colnames(fatage_all))] / bassCatchability[year_id, grep("striped.bass", colnames(bassCatchability))], 1, sum)
}

bassCPUE <- bassC/bassE
shapiro.test(bassCPUE) # > 0.05, data is normally distributed
# bassCPUE_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ bassCPUE[index_lag_id])
bassCPUE_lm <- lm(log_biomass_ewe ~ bassCPUE[index_lag_id])
bassCPUE_fit <- fitted(bassCPUE_lm)
lm_slope$bassCPUE <- paste0(
  round(summary(bassCPUE_lm)$coefficients[2, 1], digits = 2),
  if(summary(bassCPUE_lm)$coefficients[2, 4] <= 0.05) {"*"})

herringCatch <- apply(as.data.frame(catch[[1]][, grep("AtlanticHerring", names(catch[[1]]))]), 1, sum) *1000000
herringC <- herringCatch[year_id]
if (add_fleet_dynamics == TRUE){
  herringEffort <- effort_all[, "F.herring"]
  herringE <- herringEffort[year_id]
}
if (add_fleet_dynamics == FALSE){
  herringE <- apply(fatage_all[year_id, grep("AtlanticHerring", colnames(fatage_all))] / herringCatchability[year_id, grep("Atlantic.herring", colnames(herringCatchability))], 1, sum)
}

herringCPUE <- herringC/herringE
shapiro.test(herringCPUE) # > 0.05, data is normally distributed
# herringCPUE_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ herringCPUE[index_lag_id])
herringCPUE_lm <- lm(log_biomass_ewe ~ herringCPUE[index_lag_id])
herringCPUE_fit <- fitted(herringCPUE_lm)
lm_slope$herringCPUE <- paste0(
  round(summary(herringCPUE_lm)$coefficients[2, 1], digits = 2),
  if(summary(herringCPUE_lm)$coefficients[2, 4] <= 0.05) {"*"})

menhadenValue = value_all[, "F.menhaden"]
# if (add_fleet_dynamics == TRUE){
#   menhadenV <- log(menhadenValue[year_id])
# } else {
  menhadenV <- menhadenValue[year_id]
# }
shapiro.test(menhadenV) # < 0.05, data is not normally distributed
shapiro.test(log(menhadenV)) # < 0.05, data is not normally distributed
# menhadenV_lm <- lm(biomass_ewe[time_id][biomass_lag_id] ~ menhadenV[index_lag_id])
menhadenV_lm <- lm(log_biomass_ewe~ log(menhadenV[index_lag_id]))
menhadenV_fit <- fitted(menhadenV_lm)
lm_slope$menhadenV <- paste0(
  round(summary(menhadenV_lm)$coefficients[2, 1], digits = 2),
  if(summary(menhadenV_lm)$coefficients[2, 4] <= 0.05) {"*"})

write.csv(lm_slope, here::here("data", paste0(ewe_scenario_name, "_om_lm_slope_", terminal_year, scenario_filename, ".csv")))
# linear regression analysis summary table
lm_data_om <- rbind(
  data.frame(
    Menhaden_Biomass = log_biomass_ewe,
    Variable = "AMO",
    Index_Value = amo$scaled_value[index_lag_id]
  ),
  data.frame(
    Menhaden_Biomass = log_biomass_ewe,
    Variable = "PDSI",
    Index_Value = pdsi$scaled_value[index_lag_id]
  ),
  data.frame(
    Menhaden_Biomass = log_biomass_ewe,
    Variable = "Biomass of Striped bass",
    Index_Value = bassB$bass_bio[index_lag_id]
  ),
  data.frame(
    Menhaden_Biomass = log_biomass_ewe,
    Variable = "Menhaden Catch",
    Index_Value = log(menhadenC[index_lag_id])
  ),
  data.frame(
    Menhaden_Biomass = log_biomass_ewe,
    Variable = "Menhaden fishing effort",
    Index_Value = log(menhadenE[index_lag_id])
  ),
  data.frame(
    Menhaden_Biomass = log_biomass_ewe,
    Variable = "Menhaden CPUE",
    Index_Value = log(menhadenCPUE[index_lag_id])
  ),
  data.frame(
    Menhaden_Biomass = log_biomass_ewe,
    Variable = "Bass CPUE",
    Index_Value = bassCPUE[index_lag_id]
  ),
  data.frame(
    Menhaden_Biomass = log_biomass_ewe,
    Variable = "Herring CPUE",
    Index_Value = herringCPUE[index_lag_id]
  ),
  data.frame(
    Menhaden_Biomass = log_biomass_ewe,
    Variable = "Menhaden Ex-vessel Value",
    Index_Value = log(menhadenV[index_lag_id])
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
  round(summary(menhaden_herring_lm)$coefficients[2, 1], digits = 2),
  if(summary(menhaden_herring_lm)$coefficients[2, 4] <= 0.05) {"*"})

menhaden_bass_lm <- lm(log(menhadenCPUE[biomass_lag_id]) ~ log(bassCPUE[index_lag_id]))
menhaden_bass_fit <- fitted(menhaden_bass_lm)

cpue_lm_slope$menhaden_bass <- paste0(
  round(summary(menhaden_bass_lm)$coefficients[2, 1], digits = 2),
  if(summary(menhaden_bass_lm)$coefficients[2, 4] <= 0.05) {"*"})

write.csv(cpue_lm_slope, here::here("data", paste0(ewe_scenario_name, "_cpue_lm_slope_", terminal_year, scenario_filename, ".csv")))
