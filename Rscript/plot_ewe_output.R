# Plot EwE outputs using read_ewe_output function
# 7 ages
group_name <- c(
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
)

functional_groups <- data.frame(
  group_name = group_name,
  ewe_code = paste0("X", 1:length(group_name)),
  ewe_name = c(
    "striped bass 0",
    "striped bass 2-5",
    "striped bass 6+",
    "menhaden 0",
    "menhaden 1",
    "menhaden 2",
    "menhaden 3",
    "menhaden 4",
    "menhaden 5",
    "menhaden 6+",
    "spiny dogfish",
    "bluefish juv",
    "bluefish adult",
    "weakfish juv",
    "weakfish adult",
    "Atlantic herring 0-1",
    "Atlantic herring 2+",
    "anchovies",
    "benthos",
    "zooplankton",
    "phytoplankton",
    "Detritus"
  )
)

file_names <- c(
  "biomass_annual.csv",
  "catch_annual.csv",
  "consumption-biomass_annual.csv",
  "feedingtime_annual.csv",
  "mortality_annual.csv",
  "tl_annual.csv",
  "weight_annual.csv"
)


scenarios <- c("BA0", "pp11", "pp33", "Chagarisrecdev", "BAMrecdev")
ewe_output <- list()
for (i in 1:length(scenarios)) {
  ewe_output[[i]] <- read_ewe_output(
    file_path = here::here("data", "ewe", "7ages", "ecosim_output", scenarios[i]),
    file_names = file_names,
    skip_nrows = 8,
    plot = TRUE,
    figure_titles = c(
      "Biomass", "Catch", "Consumption_Biomass",
      "Feeding_Time", "Mortality", "Trophic_Level", "Average_Weight"
    ),
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
    figure_colors = rainbow(length(functional_groups$group_name))
  )
}


# Plot EwE outputs using read_ewe_output function: 2 ages model

group_name <- c(
  "StripedBass0",
  "StripedBass2_5",
  "StripedBass6+",
  "AtlanticMenhadenJuvenile",
  "AtlanticMenhadenAdult",
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
)

functional_groups <- data.frame(
  group_name = group_name,
  ewe_code = paste0("X", 1:length(group_name)),
  ewe_name = c(
    "striped bass 0",
    "striped bass 2-5",
    "striped bass 6+",
    "menhaden juv",
    "menhaden adult",
    "spiny dogfish",
    "bluefish juv",
    "bluefish adult",
    "weakfish juv",
    "weakfish adult",
    "Atlantic herring 0-1",
    "Atlantic herring 2+",
    "anchovies",
    "benthos",
    "zooplankton",
    "phytoplankton",
    "Detritus"
  )
)

file_names <- c(
  "biomass_annual.csv",
  "catch_annual.csv",
  "consumption-biomass_annual.csv",
  "feedingtime_annual.csv",
  "mortality_annual.csv",
  "tl_annual.csv",
  "weight_annual.csv"
)

ewe_output_2age <- read_ewe_output(
  file_path = here::here("data", "ewe", "2ages", "ecosim_output"),
  file_names = file_names,
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = c(
    "Biomass", "Catch", "Consumption_Biomass",
    "Feeding_Time", "Mortality", "Trophic_Level", "Average_Weight"
  ),
  functional_groups = functional_groups$group_name,
  figure_colors = rainbow(length(functional_groups$group_name))
)

par(mfrow = c(2, 4))
figure_titles <- c(
  "Biomass", "Catch", "Consumption_Biomass",
  "Feeding_Time", "Mortality", "Trophic_Level", "Average_Weight"
)
for (i in 1:length(ewe_output)) {
  yrange <- range(ewe_output_2age[[j]]$AtlanticMenhadenJuvenile, ewe_output[[i]][[j]]$X0)
  plot(ewe_output_2age[[j]]$AtlanticMenhadenJuvenile,
    ylim = yrange,
    xlab = "Year", ylab = "Age 0"
  )
  for (j in 1:length(ewe_output_2age)) {
    lines(ewe_output[[i]][[j]]$X0, lty = j)
  }
  legend("bottomright",
    figure_titles[i],
    bty = "n"
  )
}

for (i in 1:length(ewe_output_2age)) {
  yrange <- range(ewe_output_2age[[i]]$AtlanticMenhadenJuvenile) * c(0.8, 1.2)
  plot(ewe_output_2age[[i]]$AtlanticMenhadenJuvenile,
    ylim = yrange,
    xlab = "Year", ylab = "Age 0"
  )
  for (j in 1:length(ewe_output)) {
    lines(ewe_output[[j]][[i]]$X0, lty = j, col = j)
  }
  legend("bottomright",
    figure_titles[i],
    bty = "n"
  )
}
plot.new()
legend(
  "topleft",
  scenarios,
  pch = c(1, rep(NA, length(ewe_output))),
  lty = c(NA, 1:length(ewe_output)),
  col = c(1, 1:length(ewe_output)),
  bty = "n"
)
