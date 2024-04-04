library(ggplot2)
library(ggthemes)
library(here)
library(reshape2)
library(RColorBrewer)
library(dplyr)

data_dir <- here::here("data", "ewe", "7ages_newsim_om3", "7ages_newsim_om3")

# Ex-vessel price ---------------------------------------------------------

species_names <- c(
  "bass",
  "menhaden",
  "dogfish",
  "bluefish",
  "weakfish",
  "herring"
)

price_elasticitity_files <- paste0(species_names, "_ex_vessel_price.csv")

price_elasticity_data <- vector(
  mode = "list",
  length = length(price_elasticitity_files)
)

for (i in seq_along(price_elasticity_data)){
  price_elasticity_data[[i]] <- read.csv(
    here::here(
      "data",
      "ewe",
      "7ages_newsim_om3",
      price_elasticitity_files[i]
    )
  )
}

average_price_elasticity <- sapply(
  price_elasticity_data,
  function(data) mean(data$price)
)
names(average_price_elasticity) <- species_names


# Price elasticity --------------------------------------------------------
data <- dplyr::bind_rows(price_elasticity_data, .id="data_frame")
data$Pounds <- as.numeric(gsub(",", "", data$Pounds))
data$NMFS.Name <- as.factor(data$NMFS.Name)
levels(data$NMFS.Name) <- c(
  "Bass",
  "Bluefish",
  "Herring",
  "Menhaden",
  "Dogfish",
  "Weakfish"
)
p <- ggplot(data, aes(Pounds, price)) +
  facet_wrap(~NMFS.Name,
             scales = "free") +
  geom_point() +
  labs(
    x = "Landings (pounds)",
    y = "Ex-vessel price"
  ) +
  theme(axis.text.x = element_text(angle=30))
p
# Biomass -----------------------------------------------------------------


scenarios_num <- c(
  "base",
  "price_elasticity_menhaden",
  "price_elasticity_menhaden_herring",
  "price_elasticity_menhaden_bass",
  "price_elasticity_all",
  "lowcost_no_price_elasticity",
  "lowcost_price_elasticity_menhaden",
  "lowcost_price_elasticity_menhaden_herring",
  "lowcost_price_elasticity_menhaden_bass",
  "lowcost_price_elasticity_all",
  "lowcost2_no_price_elasticity",
  "lowcost2_price_elasticity_menhaden",
  "lowcost2_price_elasticity_menhaden_herring",
  "lowcost2_price_elasticity_menhaden_bass",
  "lowcost2_price_elasticity_all"
)
scenarios <- paste0("ecosim_fleet_dynamics_", scenarios_num)


# Biomass -----------------------------------------------------------------
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

biomass_list <- vector(mode = "list", length = length(scenarios))
names(biomass_list) <- scenarios_num
for (i in seq_along(scenarios)){

  data <- read_ewe_output(
    file_path = file.path(data_dir, scenarios[i]),
    file_names = "biomass_monthly.csv",
    skip_nrows = 8,
    plot = FALSE,
    figure_titles = NULL,
    functional_groups = functional_groups,
    figure_colors = NULL
  )

  time_id <- seq(1, nrow(data[[1]]), by = 12)
  biomass_list[[i]] <- apply(data[[1]][, age_name], 1, sum)[time_id] * 1000000

}

biomass_matrix <- do.call(cbind, biomass_list)
biomass_melt <- reshape2::melt(biomass_matrix)
names(biomass_melt) <- c("Year", "Scenario", "Value")
biomass_melt$Year <- biomass_melt$Year + 1984
level_name <- scenarios_num
levels(biomass_melt$Scenario) <- level_name

biomass_melt$Group <- biomass_melt$Scenario
levels(biomass_melt$Group)[grep("^base",levels(biomass_melt$Group))] <- "Cost = 80%"
levels(biomass_melt$Group)[grep("^price_elasticity_",levels(biomass_melt$Group))] <- "Cost = 80%"
levels(biomass_melt$Group)[grep("^lowcost_",levels(biomass_melt$Group))] <- "Cost = 20%"
levels(biomass_melt$Group)[grep("^lowcost2_",levels(biomass_melt$Group))] <- "Cost = 2%"

levels(biomass_melt$Scenario)[grep("base",levels(biomass_melt$Scenario))] <- "No price elasticity"
levels(biomass_melt$Scenario)[grep("no_price_elasticity",levels(biomass_melt$Scenario))] <- "No price elasticity"
levels(biomass_melt$Scenario)[grep("menhaden$",levels(biomass_melt$Scenario))] <- "Price elasticity scenario A"
levels(biomass_melt$Scenario)[grep("herring$",levels(biomass_melt$Scenario))] <- "Price elasticity scenario B"
levels(biomass_melt$Scenario)[grep("bass$",levels(biomass_melt$Scenario))] <- "Price elasticity scenario C"
levels(biomass_melt$Scenario)[grep("all$",levels(biomass_melt$Scenario))] <- "Price elasticity scenario D"

ggplot(biomass_melt, aes(x = Year, y = Value, color = Scenario)) +
  geom_line(aes(linetype=Scenario)) +
  facet_wrap(~Group) +
  labs(
    x = "Year",
    y = "Biomass (mt) of menhaden-like species"
  ) +
  scale_colour_colorblind() +
  theme_bw()
ggsave(here::here("figure", "ewe_biomass.png"))

# Catch -------------------------------------------------------------------

catch_list <- vector(mode = "list", length = length(scenarios))
names(catch_list) <- scenarios_num
for (i in seq_along(scenarios)){

  data <- read_ewe_output(
    file_path = file.path(data_dir, scenarios[i]),
    file_names = "catch_monthly.csv",
    skip_nrows = 8,
    plot = FALSE,
    figure_titles = NULL,
    functional_groups = functional_groups,
    figure_colors = NULL
  )

  time_id <- seq(1, nrow(data[[1]]), by = 12)
  catch_list[[i]] <- apply(data[[1]][, age_name], 1, sum)[time_id] * 1000000

}

catch_matrix <- do.call(cbind, catch_list)
catch_melt <- reshape2::melt(catch_matrix)
names(catch_melt) <- c("Year", "Scenario", "Value")
catch_melt$Year <- catch_melt$Year + 1984
levels(catch_melt$Scenario) <- level_name

catch_melt$Group <- catch_melt$Scenario
levels(catch_melt$Group)[grep("^base",levels(catch_melt$Group))] <- "Cost = 80%"
levels(catch_melt$Group)[grep("^price_elasticity_",levels(catch_melt$Group))] <- "Cost = 80%"
levels(catch_melt$Group)[grep("^lowcost_",levels(catch_melt$Group))] <- "Cost = 20%"
levels(catch_melt$Group)[grep("^lowcost2_",levels(catch_melt$Group))] <- "Cost = 2%"

levels(catch_melt$Scenario)[grep("base",levels(catch_melt$Scenario))] <- "No price elasticity"
levels(catch_melt$Scenario)[grep("no_price_elasticity",levels(catch_melt$Scenario))] <- "No price elasticity"
levels(catch_melt$Scenario)[grep("menhaden$",levels(catch_melt$Scenario))] <- "Price elasticity scenario A"
levels(catch_melt$Scenario)[grep("herring$",levels(catch_melt$Scenario))] <- "Price elasticity scenario B"
levels(catch_melt$Scenario)[grep("bass$",levels(catch_melt$Scenario))] <- "Price elasticity scenario C"
levels(catch_melt$Scenario)[grep("all$",levels(catch_melt$Scenario))] <- "Price elasticity scenario D"

ggplot(catch_melt, aes(x = Year, y = Value, color = Scenario)) +
  geom_line(aes(linetype=Scenario)) +
  facet_wrap(~Group) +
  labs(
    x = "Year",
    y = "Catch (mt) of menhaden-like species"
  ) +
  scale_colour_colorblind() +
  theme_bw()
ggsave(here::here("figure", "ewe_catch.png"))

# Effort ------------------------------------------------------------------

effort_list <- vector(mode = "list", length = length(scenarios))
names(effort_list) <- scenarios_num
for (i in seq_along(scenarios)){

  data <- read_ewe_effort(
    file_path = file.path(data_dir, scenarios[i]),
    file_names = "NWACS AM 7ages-Fishing effort functions grid.csv",
    skip_nrows = 3,
    colname_1 = "month",
    fleets = c(
      "F.striped bass",
      "F.menhaden",
      "F.spiny dogfish",
      "F.bluefish",
      "F.weakfish",
      "F.herring"
    ),
    years = 1985:2017)

  # data[[1]]$timestep <- 1:nrow(data[[1]])

  time_id <- seq(1, nrow(data[[1]]), by = 12)
  effort_list[[i]] <- data[[1]][time_id, "F.menhaden"]

}

effort_matrix <- do.call(cbind, effort_list)
effort_melt <- reshape2::melt(effort_matrix)
names(effort_melt) <- c("Year", "Scenario", "Value")
effort_melt$Year <- effort_melt$Year + 1984
levels(effort_melt$Scenario) <- level_name

effort_melt$Group <- effort_melt$Scenario
levels(effort_melt$Group)[grep("^base",levels(effort_melt$Group))] <- "Cost = 80%"
levels(effort_melt$Group)[grep("^price_elasticity_",levels(effort_melt$Group))] <- "Cost = 80%"
levels(effort_melt$Group)[grep("^lowcost_",levels(effort_melt$Group))] <- "Cost = 20%"
levels(effort_melt$Group)[grep("^lowcost2_",levels(effort_melt$Group))] <- "Cost = 2%"

levels(effort_melt$Scenario)[grep("base",levels(effort_melt$Scenario))] <- "No price elasticity"
levels(effort_melt$Scenario)[grep("no_price_elasticity",levels(effort_melt$Scenario))] <- "No price elasticity"
levels(effort_melt$Scenario)[grep("menhaden$",levels(effort_melt$Scenario))] <- "Price elasticity scenario A"
levels(effort_melt$Scenario)[grep("herring$",levels(effort_melt$Scenario))] <- "Price elasticity scenario B"
levels(effort_melt$Scenario)[grep("bass$",levels(effort_melt$Scenario))] <- "Price elasticity scenario C"
levels(effort_melt$Scenario)[grep("all$",levels(effort_melt$Scenario))] <- "Price elasticity scenario D"

ggplot(effort_melt, aes(x = Year, y = Value, color = Scenario)) +
  geom_line(aes(linetype=Scenario)) +
  facet_wrap(~Group) +
  labs(
    x = "Year",
    y = "Effort of menhaden-like species"
  ) +
  scale_colour_colorblind() +
  theme_bw()
ggsave(here::here("figure", "ewe_effort.png"))

# Fishing mortality -------------------------------------------------------

f_list <- vector(mode = "list", length = length(scenarios))
names(f_list) <- scenarios_num
for (i in seq_along(scenarios)){

  data <- read_ewe_effort(
    file_path = file.path(data_dir, scenarios[i]),
    file_names = "NWACS AM 7ages-Fishing mortality functions grid.csv",
    skip_nrows = 3,
    colname_1 = "month",
    fleets =  functional_groups,
    years = 1985:2017)

  time_id <- seq(1, nrow(data[[1]]), by = 12)
  f_list[[i]] <- apply(data[[1]][time_id, age_name], 1, max)

}

f_matrix <- do.call(cbind, f_list)
f_melt <- reshape2::melt(f_matrix)
names(f_melt) <- c("Year", "Scenario", "Value")
f_melt$Year <- rep(1985:2017, times = length(levels(f_melt$Scenario)))

level_name <- scenarios_num
levels(f_melt$Scenario) <- level_name

f_melt$Group <- f_melt$Scenario
levels(f_melt$Group)[grep("^base",levels(f_melt$Group))] <- "Cost = 80%"
levels(f_melt$Group)[grep("^price_elasticity_",levels(f_melt$Group))] <- "Cost = 80%"
levels(f_melt$Group)[grep("^lowcost_",levels(f_melt$Group))] <- "Cost = 20%"
levels(f_melt$Group)[grep("^lowcost2_",levels(f_melt$Group))] <- "Cost = 2%"

levels(f_melt$Scenario)[grep("base",levels(f_melt$Scenario))] <- "No price elasticity"
levels(f_melt$Scenario)[grep("no_price_elasticity",levels(f_melt$Scenario))] <- "No price elasticity"
levels(f_melt$Scenario)[grep("menhaden$",levels(f_melt$Scenario))] <- "Price elasticity scenario A"
levels(f_melt$Scenario)[grep("herring$",levels(f_melt$Scenario))] <- "Price elasticity scenario B"
levels(f_melt$Scenario)[grep("bass$",levels(f_melt$Scenario))] <- "Price elasticity scenario C"
levels(f_melt$Scenario)[grep("all$",levels(f_melt$Scenario))] <- "Price elasticity scenario D"

ggplot(f_melt, aes(x = Year, y = Value, color = Scenario)) +
  geom_line(aes(linetype=Scenario)) +
  geom_hline(aes(yintercept = 2.939998)) +
  facet_wrap(~Group) +
  labs(
    x = "Year",
    y = "Apical F of menhaden-like species"
  ) +
  scale_colour_colorblind() +
  theme_bw()
ggsave(here::here("figure", "ewe_apical_f.png"))

# Effort ------------------------------------------------------------------

effort_data <-read_ewe_effort(
  file_path = file.path(data_dir, cases[1]),
  file_names = "NWACS AM 7ages-Fishing effort functions grid.csv",
  skip_nrows = 3,
  colname_1 = "month",
  fleets = c(
    "F.striped bass",
    "F.menhaden",
    "F.spiny dogfish",
    "F.bluefish",
    "F.weakfish",
    "F.herring"
    ),
  years = 1985:2017)

effort_data[[1]]$timestep <- 1:nrow(effort_data[[1]])
effort_melt <- reshape2::melt(effort_data[[1]], id = c("year", "month", "timestep"))

ggplot(effort_melt, aes(x = timestep, y = value, color = variable)) +
  geom_line() +
  # facet_wrap(~variable, scales = "free_y") +
  labs(
    x = "Timestep",
    y = "Effort"
  ) +
  theme_bw()

cormat <- round(cor(effort_data[[1]][2:7]), 2)
cormelt <- reshape2::melt(cormat)

ggplot(data = cormelt, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                       midpoint = 0, limit = c(-1,1), space = "Lab",
                       name="Pearson\nCorrelation") +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45, vjust = 1,
                                   size = 12, hjust = 1))+
  labs(
    x = "Fleets",
    y = "Fleets"
  ) +
  coord_fixed()


# Landings ----------------------------------------------------------------
file_path = file.path(data_dir, cases[1])
file_names = "catch-fleet-group_annual.csv"
skip_nrows = 8

data <- vector(mode = "list", length = length(file_names))

for (file_id in 1:length(file_names)) {
  temp <- scan(file.path(file_path, file_names[file_id]), what = "", sep = "\n")
  data[[file_id]] <- temp[-c(1:skip_nrows)]

  data[[file_id]] <- read.table(
    text = as.character(data[[file_id]]),
    sep = ",",
    col.names = c("year", "fleet", "group", "value")
  )
}

data[[1]]$year <- data[[1]]$year + 1985
data[[1]]$value <- data[[1]]$value * 1000000
data[[1]]$fleet[data[[1]]$fleet == 1] <- "F.striped bass"
data[[1]]$fleet[data[[1]]$fleet == 2] <- "F.menhaden"
data[[1]]$fleet[data[[1]]$fleet == 3] <- "F.spiny dogfish"
data[[1]]$fleet[data[[1]]$fleet == 4] <- "F.bluefish"
data[[1]]$fleet[data[[1]]$fleet == 5] <- "F.weakfish"
data[[1]]$fleet[data[[1]]$fleet == 6] <- "F.herring"
summary(data[[1]])
landing_per_fleet <- aggregate(value ~ year + fleet, data = data[[1]], sum)

ggplot(landing_per_fleet, aes(x = year, y = value)) +
  geom_line() +
  facet_wrap(~fleet, scales = "free_y") +
  labs(
    x = "Year",
    y = "Landings (mt)"
  ) +
  theme_bw()

cor_data <- reshape2::dcast(landing_per_fleet, year ~ fleet)
cormat <- round(cor(cor_data[, 2:7]), 2)
cormelt <- reshape2::melt(cormat)

ggplot(data = cormelt, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                       midpoint = 0, limit = c(-1,1), space = "Lab",
                       name="Pearson\nCorrelation") +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45, vjust = 1,
                                   size = 12, hjust = 1))+
  labs(
    x = "Fleets",
    y = "Fleets"
  ) +
  coord_fixed()

