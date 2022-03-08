devtools::load_all()
project_path <- here::here()
working_dir <- file.path(project_path, "data", "ewe")

sim_years <- 1985:2017

#### Atlantic Multidecadal Oscillation (AMO) Index: https://psl.noaa.gov/data/timeseries/AMO/

# unsmoothed data with no lag
data <- IFA4EBFM::download_amo(
    url = "https://psl.noaa.gov/data/correlation/amon.us.long.data",
    years = sim_years,
    output_dir = file.path(working_dir, "amo_unsmooth_lag0.csv"),
    scale_range = c(0, 2)
)
windows()
plot(data$scaled_value, xlab = "Time", ylab = "Atlantic Multidecadal Oscillation Index")

# unsmoothed data with lag 1
data <- IFA4EBFM::download_amo(
    url = "https://psl.noaa.gov/data/correlation/amon.us.long.data",
    years = sim_years - 1,
    output_dir = file.path(working_dir, "amo_unsmooth_lag1.csv"),
    scale_range = c(0, 2)
)
plot(data$scaled_value, xlab = "Time", ylab = "Atlantic Multidecadal Oscillation Index")

# There are missing data in smoothed data; smoothed data with no lag
data <- IFA4EBFM::download_amo(
    url = "https://psl.noaa.gov/data/correlation/amon.sm.long.data",
    years = sim_years,
    output_dir = file.path(working_dir, "amo_smooth_lag0.csv"),
    scale_range = c(0, 2)
)
plot(data$scaled_value, xlab = "Time", ylab = "Atlantic Multidecadal Oscillation Index")

# smoothed data with lag 1
data <- data <- IFA4EBFM::download_amo(
    url = "https://psl.noaa.gov/data/correlation/amon.sm.long.data",
    years = sim_years - 1,
    output_dir = file.path(working_dir, "amo_smooth_lag1.csv"),
    scale_range = c(0, 2)
)
plot(data$scaled_value, xlab = "Time", ylab = "Atlantic Multidecadal Oscillation Index")

#### Kaplan SST average: https://psl.noaa.gov/data/timeseries/AMO/
# Kaplan SST average has the same data format compared to AMO data, we can continue using download_amo_data function.
data <- IFA4EBFM::download_amo(
    url = "https://psl.noaa.gov/data/correlation/amon.us.long.mean.data",
    years = sim_years,
    output_dir = file.path(working_dir, "kaplan_sst.csv"),
    scale_range = c(0, 5)
)
plot(data$scaled_value, xlab = "Time", ylab = "Kaplan SST average")

#### Precipitation data by states from NCDC (https://www.ncdc.noaa.gov/cag/statewide/time-series/44/pcp/all/1/1985-2018)
# States: Viginia, Maryland, Connecticut, Rhode Island, and Massachusetts
states <- c("VA", "MD", "CT", "RI", "MA")
states_id <- c(44, 18, 6, 37, 19)

# Precipitation
data <- IFA4EBFM::download_ncei(
    years = sim_years,
    states = states,
    states_id = states_id,
    parameter = "pcp",
    output_dir = file.path(working_dir, "precipitation.csv"),
    scale_range = c(0, 5)
)
plot(data$raw_value, xlab = "Time", ylab = "Precipitation")
lines(data$scaled_value)

# Palmer drought severity index
data <- IFA4EBFM::download_ncei(
    years = sim_years,
    states = states,
    states_id = states_id,
    parameter = "pdsi",
    output_dir = file.path(working_dir, "palmer_drought_severity_index.csv"),
    scale_range = c(0, 2)
)
plot(data$raw_value, xlab = "Time", ylab = "Palmer drought severity index")
lines(data$scaled_value)

#### Chlorophyll a data (have missing data)
# Website: https://coastwatch.pfeg.noaa.gov/erddap/griddap/pmlEsaCCI31OceanColorMonthly_Lon0360.html
# Start and stop points of latitude: 34 and 46
# Start and stop points of longitude: 280 and 295
# Full url: https://coastwatch.pfeg.noaa.gov/erddap/griddap/pmlEsaCCI31OceanColorMonthly_Lon0360.htmlTable?chlor_a%5B(1997-09-04T00:00:00Z):1:(2018-01-01T00:00:00Z)%5D%5B(34):1:(46)%5D%5B(280):1:(295)%5D

# data <- data.table::fread("https://coastwatch.pfeg.noaa.gov/erddap/griddap/pmlEsaCCI50OceanColorMonthly_Lon0360.htmlTable?chlor_a%5B(1997-09-04T00:00:00Z):1:(2018-01-01T00:00:00Z)%5D%5B(34):1:(46)%5D%5B(280):1:(295)%5D", fill=TRUE)

#### Beaufort Assessment Model recruitment deviations
menhaden <- dget(here::here("data", "AtlanticMenhadenSA", "am019.rdat"))
recdev <- cbind(
    rep(sim_years, each = 12),
    rep(1:12, times = length(sim_years)),
    rep(exp(menhaden$t.series$logR.dev[menhaden$t.series$year %in% sim_years]), each = 12)
)
write.csv(recdev, file.path("data", "ewe", "recruitment_deviations.csv"))


#### Ecosim phytoplankton and zooplankton outputs
ewe_output <- read_ewe_output(
    file_path = here::here("data", "ewe", "7ages", "ecosim_output", "BA0"),
    file_names = "biomass_monthly.csv",
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

# Phytoplankton
phytoplankton <- scales::rescale(ewe_output[[1]]$Phytoplankton, to = c(0,2))
write.csv(phytoplankton, file.path("data", "ewe", "phytoplankton.csv"))

# Zooplankton
zooplankton <- scales::rescale(ewe_output[[1]]$Zooplankton, to = c(0,2))
write.csv(phytoplankton, file.path("data", "ewe", "zooplankton.csv"))
