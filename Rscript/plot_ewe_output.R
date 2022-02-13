# Plot EwE outputs using read_ewe_output function
# 1 age class run
group_name_1age <- c(
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


group_name <- c(
  "StripedBass0",
  "StripedBass2_5",
  "StripedBass6+",
  "AtlanticMenhaden0",
  "AtlanticMenhaden1",
  "AtlanticMenhaden2",
  "AtlanticMenhaden3",
  "AtlanticMenhaden4",
  "AtlanticMenhaden5",
  "AtlanticMenhaden6+",
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

for (i in 1:length(scenarios)){
  ewe_output <- read_ewe_output(
    file_path = here::here("data", "7ages", "ecosim_output", scenarios[i]),
    file_names = file_names,
    skip_nrows = 8,
    plot = TRUE,
    figure_titles = c(
      "Biomass", "Catch", "Consumption_Biomass",
      "Feeding_Time", "Mortality", "Trophic_Level", "Average_Weight"
    ),
    functional_groups =  c(
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
    figure_colors = rainbow(length(functional_groups$group_name))
  )
}


# Plot EwE outputs using read_ewe_output function

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
  "consumptionbiomass_annual.csv",
  "feedingtime_annual.csv",
  "mortality_annual.csv",
  "tl_annual.csv",
  "weight_annual.csv"
)

ewe_output_1age <- read_ewe_output(
  file_path = here::here("data", "ewe_output", "1age"),
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

par(mfrow=c(2,4))
figure_titles = c(
  "Biomass", "Catch", "Consumption_Biomass",
  "Feeding_Time", "Mortality", "Trophic_Level", "Average_Weight"
)
for (i in 1:length(ewe_output)) {
  yrange <- range(ewe_output_1age[[i]]$AtlanticMenhadenJuvenile, ewe_output[[i]]$AtlanticMenhaden0)
  plot(ewe_output_1age[[i]]$AtlanticMenhadenJuvenile,
       ylim=yrange,
       xlab="Year", ylab="Age 0")
  lines(ewe_output[[i]]$AtlanticMenhaden0)
  legend("topright",
         figure_titles[i],
         bty="n")
}

