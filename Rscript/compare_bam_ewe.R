devtools::load_all()
# Load output data from BAM and EwE ---------------------------------------
project_path <- here::here()
ewe2ages_path <- file.path(project_path, "data", "ewe", "2ages")
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
ewe2ages <- IP4EBFM::read_ewe_output(
  file_path = file.path(ewe2ages_path, "ecosim_output"),
  file_names = file_names,
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = c(
    "StripedBass0",
    "StripedBass2_5",
    "StripedBass6",
    "0",
    "total_adult",
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
  ),
  figure_colors = NULL
)
names(ewe2ages) <- name_vec
ewe2agesAM <- c("X0", "total_adult")

ewe7agesAM <- c("X0",
                "X1",
                "X2",
                "X3",
                "X4",
                "X5",
                "X6")
ewe7ages_BA0 <- IP4EBFM::read_ewe_output(
  file_path = file.path(ewe7ages_path, "ecosim_output", "BA0"),
  file_names = file_names,
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = c(
    "StripedBass0",
    "StripedBass2_5",
    "StripedBass6",
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
    "AtlanticHerring2",
    "Anchovies",
    "Benthos",
    "Zooplankton",
    "Phytoplankton",
    "Detritus"
  ),
  figure_colors = NULL
)
names(ewe7ages_BA0) <- name_vec

ewe7ages_BAneg <- IP4EBFM::read_ewe_output(
  file_path = file.path(ewe7ages_path, "ecosim_output", "BAneg"),
  file_names = file_names,
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = c(
    "StripedBass0",
    "StripedBass2_5",
    "StripedBass6",
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
    "AtlanticHerring2",
    "Anchovies",
    "Benthos",
    "Zooplankton",
    "Phytoplankton",
    "Detritus"
  ),
  figure_colors = NULL
)
names(ewe7ages_BAneg) <- name_vec

ewe7ages_BApos <- IP4EBFM::read_ewe_output(
  file_path = file.path(ewe7ages_path, "ecosim_output", "BApos"),
  file_names = file_names,
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = c(
    "StripedBass0",
    "StripedBass2_5",
    "StripedBass6",
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
    "AtlanticHerring2",
    "Anchovies",
    "Benthos",
    "Zooplankton",
    "Phytoplankton",
    "Detritus"
  ),
  figure_colors = NULL
)
names(ewe7ages_BApos) <- name_vec

sa_data <- dget(file.path(sa_path, "am019.rdat"))

# Create a list of data
data_name <- c("SA", "EwE AM 2 ages", "EwE AM 7 ages_BA0", "EwE AM 7 ages_BAneg")
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

data$`EwE AM 2 ages`$baa <- ewe2ages$biomass[, ewe2agesAM]
data$`EwE AM 2 ages`$zaa <- ewe2ages$mortality[, ewe2agesAM]
data$`EwE AM 2 ages`$caa <- ewe2ages$catch[, ewe2agesAM]

data$`EwE AM 7 ages_BA0`$baa <- ewe7ages_BA0$biomass[, ewe7agesAM]
data$`EwE AM 7 ages_BA0`$baa$total_adult <- apply(data$`EwE AM 7 ages_BA0`$baa[, ewe7agesAM], 1, sum)

data$`EwE AM 7 ages_BA0`$zaa <- ewe7ages_BA0$mortality[, ewe7agesAM]
data$`EwE AM 7 ages_BA0`$zaa$total_adult <- apply(data$`EwE AM 7 ages_BA0`$zaa[, ewe7agesAM], 1, max)

data$`EwE AM 7 ages_BA0`$caa <- ewe7ages_BA0$catch[, ewe7agesAM]
data$`EwE AM 7 ages_BA0`$caa$total_adult <- apply(data$`EwE AM 7 ages_BA0`$caa[, ewe7agesAM], 1, sum)

data$`EwE AM 7 ages_BAneg`$baa <- ewe7ages_BAneg$biomass[, ewe7agesAM]
data$`EwE AM 7 ages_BAneg`$baa$total_adult <- apply(data$`EwE AM 7 ages_BAneg`$baa[, ewe7agesAM], 1, sum)

data$`EwE AM 7 ages_BAneg`$zaa <- ewe7ages_BAneg$mortality[, ewe7agesAM]
data$`EwE AM 7 ages_BAneg`$zaa$total_adult <- apply(data$`EwE AM 7 ages_BAneg`$zaa[, ewe7agesAM], 1, max)

data$`EwE AM 7 ages_BAneg`$caa <- ewe7ages_BAneg$catch[, ewe7agesAM]
data$`EwE AM 7 ages_BAneg`$caa$total_adult <- apply(data$`EwE AM 7 ages_BAneg`$caa[, ewe7agesAM], 1, sum)


# Make comparison figures -------------------------------------------------
pdf(file=file.path(project_path, "data", "ewe", "bam_ewe_comparison.pdf"), onefile=T)

par(mfrow=c(3,3))
age_labels <- paste("Age", c("0", "1", "2", "3", "4", "5", "6+", "1-6+"))
col_names <- c(sa_name_vec, "total_adult")
# Biomass
for (i in 1:length(age_labels)){
  plot(sim_years, data$SA$baa[, i], xlab="Year", ylab=paste("Biomass", age_labels[i]), ylim=c(0, max(data$SA$baa[, i])))
  if (i %in% c(1, length(age_labels))) lines(sim_years, data$`EwE AM 2 ages`$baa[, col_names[i]], pch=2, col=2, type="o")
  lines(sim_years, data$`EwE AM 7 ages_BA0`$baa[, col_names[i]], pch=3, col=3, type="o")
  lines(sim_years, data$`EwE AM 7 ages_BAneg`$baa[, col_names[i]], pch=4, col=4, type="o")
}
plot.new()
legend("bottomright",
       data_name,
       col=1:4,
       pch=1:4,
       lty=c(NA, 1, 1, 1),
       bty="n"
)

# Mortality
for (i in 1:length(age_labels)){
  plot(sim_years, data$SA$zaa[, i], xlab="Year", ylab=paste("Mortality", age_labels[i]), ylim=c(0, 2))
  if (i %in% c(1, length(age_labels))) lines(sim_years, data$`EwE AM 2 ages`$zaa[, col_names[i]], pch=2, col=2, type="o")
  lines(sim_years, data$`EwE AM 7 ages_BA0`$zaa[, col_names[i]], pch=3, col=3, type="o")
  lines(sim_years, data$`EwE AM 7 ages_BAneg`$zaa[, col_names[i]], pch=4, col=4, type="o")
}
plot.new()
legend("bottomright",
       data_name,
       col=1:4,
       pch=1:4,
       lty=c(NA, 1, 1, 1),
       bty="n"
)

# Catch
for (i in 1:length(age_labels)){
  plot(sim_years, data$SA$caa[, i], xlab="Year", ylab=paste("Catch", age_labels[i]), ylim=c(0, max(data$SA$caa[, i])))
  if (i %in% c(1, length(age_labels))) lines(sim_years, data$`EwE AM 2 ages`$caa[, col_names[i]], pch=2, col=2, type="o")
  lines(sim_years, data$`EwE AM 7 ages_BA0`$caa[, col_names[i]], pch=3, col=3, type="o")
  lines(sim_years, data$`EwE AM 7 ages_BAneg`$caa[, col_names[i]], pch=4, col=4, type="o")
}
plot.new()
legend("bottomright",
       data_name,
       col=1:4,
       pch=1:4,
       lty=c(NA, 1, 1, 1),
       bty="n"
)

dev.off()

# Biomass and catch trends from EwE of other species
library(tidyverse)
library(reshape2)

labels_2ages <- c("Striped Bass 0", "Striped Bass 2-5", "Striped Bass 6+",
                  "Atlantic Menhaden 0", "Atlantic Menhaden 1-6+",
                  "Spiny Dogfish", "Bluefish juv", "Bluefish adult",
                  "Weakfish juv", "Weakfish adult",
                  "Atlantic Herring 0-1", "Atlantic Herring 2+",
                  "Anchovies", "Benthos", "Zooplkanton", "Phytoplankton", "Detritus")

labels_7ages <- c("Striped Bass 0", "Striped Bass 2-5", "Striped Bass 6+",
                  "Atlantic Menhaden 0", "Atlantic Menhaden 1",
                  "Atlantic Menhaden 2", "Atlatnic Menhaden 3",
                  "Atlantic Menhaden 4", "Atlantic Menahden 5",
                  "Atlantic Menhaden 6+",
                  "Spiny Dogfish", "Bluefish juv", "Bluefish adult",
                  "Weakfish juv", "Weakfish adult",
                  "Atlantic Herring 0-1", "Atlantic Herring 2+",
                  "Anchovies", "Benthos", "Zooplkanton", "Phytoplankton", "Detritus",
                  "Atlantic Menhaden 1-6+")

names(ewe2ages$biomass)[2:ncol(ewe2ages$biomass)] <- labels_2ages
ewe2ages_melt <- reshape2::melt(ewe2ages$biomass, id.vars = "Year")
ewe2ages_melt$Model <- "2 age classes"

ewe7ages <- ewe7ages_BA0
ewe7ages$biomass$total_adult <- apply(ewe7ages$biomass[, ewe7agesAM], 1, sum)

names(ewe7ages$biomass)[2:ncol(ewe7ages$biomass)] <- labels_7ages
ewe7ages_melt <- reshape2::melt(ewe7ages$biomass, id.vars = "Year")
ewe7ages_melt$Model <- "7 age classes"

ewe_data <- rbind(ewe2ages_melt, ewe7ages_melt)


ggplot(ewe_data, aes(x = Year, y = value, color = Model)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  labs(title = "Comparison between two-ages EwE model and seven-ages EwE model",
       x = "Year",
       y = "Biomass (million mt)") +
  theme_bw()

## Catch
names(ewe2ages$catch)[2:ncol(ewe2ages$catch)] <- labels_2ages
ewe2ages_melt <- reshape2::melt(ewe2ages$catch, id.vars = "Year")
ewe2ages_melt$Model <- "2 age classes"

ewe7ages <- ewe7ages_BA0
ewe7ages$catch$total_adult <- apply(ewe7ages$catch[, ewe7agesAM], 1, sum)

names(ewe7ages$catch)[2:ncol(ewe7ages$catch)] <- labels_7ages
ewe7ages_melt <- reshape2::melt(ewe7ages$catch, id.vars = "Year")
ewe7ages_melt$Model <- "7 age classes"

ewe_data <- rbind(ewe2ages_melt, ewe7ages_melt)


ggplot(ewe_data, aes(x = Year, y = value, color = Model)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  labs(title = "Comparison between two-ages EwE model and seven-ages EwE model",
       x = "Year",
       y = "Landings (million mt)") +
  theme_bw()

# Plot biomass-at-age over time from base run-------------------------------------------

plot_ewe_agecomp <- function(data, title, xlab, ylab) {
  data_melt <- reshape2::melt(data, id.vars = "Year")
  data_melt$variable <- as.factor(data_melt$variable)
  colnames(data_melt)[which(colnames(data_melt) == "variable")] <- "Age"


  ggplot(data_melt, aes(x=Age, fill=Age, y=value)) +
    geom_bar(position='dodge', stat='identity') +
    facet_wrap(~Year) +
    labs(title = title,
         x = xlab,
         y = ylab) +
    theme_bw()
}

data <- ewe7ages_BA0$biomass[, c("Year", paste0("X", 0:6))]
data[, paste0("X", 0:6)] <- data[, paste0("X", 0:6)]/rowSums(data[, paste0("X", 0:6)])
colnames(data) <- c("Year", paste(0:5), "6+")
plot_ewe_agecomp(data=data,
                 title="Biomass-at-age",
                 xlab="Age",
                 ylab = "Proportion")


