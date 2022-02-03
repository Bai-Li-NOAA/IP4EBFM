devtools::load_all()
# Load output data from BAM and EwE ---------------------------------------
project_path <- here::here()
ewe1age_path <- file.path(project_path, "data", "ewe", "1age")
ewe7ages_path <- file.path(project_path, "data", "ewe", "7ages")
sa_path <- file.path(project_path, "data", "AtlanticMenhadenSA")

file_names <- c(
  "biomass_annual.csv",
  "catch_annual.csv",
  "consumption-biomass_annual.csv",
  "feedingtime_annual.csv",
  "mortality_annual.csv",
  "tl_annual.csv",
  "weight_annual.csv"
)

name_vec <- c("biomass", "catch", "consumptionBiomass", "feedingTime", "mortality", "tl", "weight")
ewe1age <- IFA4EBFM::read_ewe_output(
  file_path = file.path(ewe1age_path, "ecosim_output"),
  file_names = file_names,
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = c(
    "StripedBass0",
    "StripedBass2_5",
    "StripedBass6+",
    "0",
    "total_adult",
    "SpinyDogfish",
    "BluefishJuvenile",
    "BluefishAdult",
    "WeakfishJuvenile",
    "WeakfishAdult",
    "AtlanticHerring0_1",
    "AtlanticHerring2+",
    "Anchovies",
    "Benthos",
    "Zooplankton",
    "Phytoplankton",
    "Detritus"
  ),
  figure_colors = NULL
)
names(ewe1age) <- name_vec
ewe1ageAM <- c("X0", "total_adult")

ewe7agesAM <- c("X0",
                "X1",
                "X2",
                "X3",
                "X4",
                "X5",
                "X6")
ewe7ages_staticV <- IFA4EBFM::read_ewe_output(
  file_path = file.path(ewe7ages_path, "ecosim_output", "staticVunerability"),
  file_names = file_names,
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = c(
    "StripedBass0",
    "StripedBass2_5",
    "StripedBass6+",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "SpinyDogfish",
    "BluefishJuvenile",
    "BluefishAdult",
    "WeakfishJuvenile",
    "WeakfishAdult",
    "AtlanticHerring0_1",
    "AtlanticHerring2+",
    "Anchovies",
    "Benthos",
    "Zooplankton",
    "Phytoplankton",
    "Detritus"
  ),
  figure_colors = NULL
)
names(ewe7ages_staticV) <- name_vec

ewe7ages_ageVaryingV <- IFA4EBFM::read_ewe_output(
  file_path = file.path(ewe7ages_path, "ecosim_output", "ageVaryingVunerability"),
  file_names = file_names,
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = c(
    "StripedBass0",
    "StripedBass2_5",
    "StripedBass6+",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "SpinyDogfish",
    "BluefishJuvenile",
    "BluefishAdult",
    "WeakfishJuvenile",
    "WeakfishAdult",
    "AtlanticHerring0_1",
    "AtlanticHerring2+",
    "Anchovies",
    "Benthos",
    "Zooplankton",
    "Phytoplankton",
    "Detritus"
  ),
  figure_colors = NULL
)
names(ewe7ages_ageVaryingV) <- name_vec

sa_data <- dget(file.path(sa_path, "am019.rdat"))

# Create a list of data
data_name <- c("SA", "EwE AM 1 age", "EwE AM 7 ages_staticVulnerability", "EwE AM 7_ageVaryingVulnerability")
data <- vector(mode="list", length=length(data_name))
names(data) <- data_name

sim_years <- 1985:2017
full_ages <- 0:6
adult_ages <- 1:6

sa_name_vec <- paste0("X", full_ages)

data$SA$baa <- as.data.frame(sa_data$B.mdyr.age[as.character(sim_years), as.character(full_ages)] / 1000)
names(data$SA$baa) <- sa_name_vec
data$SA$baa$total_adult <- apply(data$SA$baa[, sa_name_vec], 1, sum)

data$SA$zaa <- as.data.frame((sa_data$Z.age[as.character(sim_years), as.character(full_ages)]))
names(data$SA$zaa) <- sa_name_vec
data$SA$zaa$total_adult <- apply(data$SA$zaa[, sa_name_vec], 1, max) # max Z

data$SA$caa <- as.data.frame(sa_data$L.age.pred.mt[as.character(sim_years), as.character(full_ages)] / 1000)
names(data$SA$caa) <- sa_name_vec
data$SA$caa$total_adult <- apply(data$SA$caa[, sa_name_vec], 1, sum)

data$`EwE AM 1 age`$baa <- ewe1age$biomass[, ewe1ageAM]
data$`EwE AM 1 age`$zaa <- ewe1age$mortality[, ewe1ageAM]
data$`EwE AM 1 age`$caa <- ewe1age$catch[, ewe1ageAM]

data$`EwE AM 7 ages_staticVulnerability`$baa <- ewe7ages_staticV$biomass[, ewe7agesAM]
data$`EwE AM 7 ages_staticVulnerability`$baa$total_adult <- apply(data$`EwE AM 7 ages_staticVulnerability`$baa[, ewe7agesAM], 1, sum)

data$`EwE AM 7 ages_staticVulnerability`$zaa <- ewe7ages_staticV$mortality[, ewe7agesAM]
data$`EwE AM 7 ages_staticVulnerability`$zaa$total_adult <- apply(data$`EwE AM 7 ages_staticVulnerability`$zaa[, ewe7agesAM], 1, max)

data$`EwE AM 7 ages_staticVulnerability`$caa <- ewe7ages_staticV$catch[, ewe7agesAM]
data$`EwE AM 7 ages_staticVulnerability`$caa$total_adult <- apply(data$`EwE AM 7 ages_staticVulnerability`$caa[, ewe7agesAM], 1, sum)

data$`EwE AM 7_ageVaryingVulnerability`$baa <- ewe7ages_ageVaryingV$biomass[, ewe7agesAM]
data$`EwE AM 7_ageVaryingVulnerability`$baa$total_adult <- apply(data$`EwE AM 7_ageVaryingVulnerability`$baa[, ewe7agesAM], 1, sum)

data$`EwE AM 7_ageVaryingVulnerability`$zaa <- ewe7ages_ageVaryingV$mortality[, ewe7agesAM]
data$`EwE AM 7_ageVaryingVulnerability`$zaa$total_adult <- apply(data$`EwE AM 7_ageVaryingVulnerability`$zaa[, ewe7agesAM], 1, max)

data$`EwE AM 7_ageVaryingVulnerability`$caa <- ewe7ages_ageVaryingV$catch[, ewe7agesAM]
data$`EwE AM 7_ageVaryingVulnerability`$caa$total_adult <- apply(data$`EwE AM 7_ageVaryingVulnerability`$caa[, ewe7agesAM], 1, sum)


# Make comparison figures -------------------------------------------------

par(mfrow=c(2,4))
age_labels <- paste("Age", c("0", "1", "2", "3", "4", "5", "6+", "1-6+"))
col_names <- c(sa_name_vec, "total_adult")
# Biomass
for (i in 1:length(age_labels)){
  plot(data$SA$baa[, i], xlab="Year", ylab=paste("Biomass", age_labels[i]), ylim=c(0, max(data$SA$baa[, i])))
  if (i %in% c(1, length(age_labels))) lines(data$`EwE AM 1 age`$baa[, col_names[i]], pch=2, col=2, type="o")
  lines(data$`EwE AM 7 ages_staticVulnerability`$baa[, col_names[i]], pch=3, col=3, type="o")
  lines(data$`EwE AM 7_ageVaryingVulnerability`$baa[, col_names[i]], pch=4, col=4, type="o")
}
legend("bottomright",
       data_name,
       col=1:4,
       pch=1:4,
       bty="n"
)

# Mortality
for (i in 1:length(age_labels)){
  plot(data$SA$zaa[, i], xlab="Year", ylab=paste("Mortality", age_labels[i]), ylim=c(0, 2))
  if (i %in% c(1, length(age_labels))) lines(data$`EwE AM 1 age`$zaa[, col_names[i]], pch=2, col=2, type="o")
  lines(data$`EwE AM 7 ages_staticVulnerability`$zaa[, col_names[i]], pch=3, col=3, type="o")
  lines(data$`EwE AM 7_ageVaryingVulnerability`$zaa[, col_names[i]], pch=4, col=4, type="o")
}
legend("bottomright",
       data_name,
       col=1:4,
       pch=1:4,
       bty="n"
)

# Catch
for (i in 1:length(age_labels)){
  plot(data$SA$caa[, i], xlab="Year", ylab=paste("Catch", age_labels[i]), ylim=c(0, max(data$SA$caa[, i])))
  if (i %in% c(1, length(age_labels))) lines(data$`EwE AM 1 age`$caa[, col_names[i]], pch=2, col=2, type="o")
  lines(data$`EwE AM 7 ages_staticVulnerability`$caa[, col_names[i]], pch=3, col=3, type="o")
  lines(data$`EwE AM 7_ageVaryingVulnerability`$caa[, col_names[i]], pch=4, col=4, type="o")
}
legend("bottomright",
       data_name,
       col=1:4,
       pch=1:4,
       bty="n"
)

