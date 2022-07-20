
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

# Load Striped bass biomass index ---------------------------------

ewe_output <- read_ewe_output(
  file_path = file_path,
  file_names = "biomass_monthly.csv",
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = c(
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
  ),
  figure_colors = NULL
)

bass_bio <- data.frame(
  Year = ewe_output[[1]]$Year,
  bass_bio = apply(ewe_output[[1]][grep("StripedBass",names(ewe_output[[1]]))], 1, sum)*1000000
)

# Load economic index ---------------------------------------------
# data were downloaded from https://www.fisheries.noaa.gov/foss/f?p=215:200:15209701672686::NO:RP::

menhaden_price <- read.csv(
  here::here("data", "ewe", "menhaden_price.csv")
)

atlantic_menhaden_price <- read.csv(
  here::here("data", "ewe", "atlantic_menhaden_price.csv")
)

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



# Load psdi index -------------------------------------------------
palmer_drought_severity_index <- read.csv(
  here::here("data", "ewe", "palmer_drought_severity_index.csv")
)

# Load sst data ---------------------------------------------------
kaplan_sst <- read.csv(
  here::here("data", "ewe", "kaplan_sst.csv")
)

# Load catchability data ------------------------------------------
ewe_catchability <- read.csv(here::here("data", "ewe", "7ages_newsim_final", "qatage.csv"))


# Load fishing mortality at age data ------------------------------
ewe_faa <- read.csv(here::here("data", "ewe", "7ages_newsim_final", "fatage.csv"))


