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

ewe_output <- read_ewe_output(
  file_path = here::here("data", "ewe_output"),
  file_names = file_names,
  skip_nrows = 8,
  plot = TRUE,
  figure_titles = c(
    "Biomass", "Catch", "Consumption_Biomass",
    "Feeding_Time", "Mortality", "Trophic_Level", "Average_Weight"
  ),
  figure_legends = functional_groups$group_name,
  figure_colors = rainbow(length(functional_groups$group_name))
)
