# Data-rich case --------------------------------------------------
## Using Stock Synthesis 3
## Website: https://github.com/nmfs-stock-synthesis/stock-synthesis

# Install required R packages -------------------------------------
required_pkg <- c(
  "devtools", "here"
)

pkg_to_install <- required_pkg[!(required_pkg %in%
  installed.packages()[, "Package"])]
if (length(pkg_to_install)) install.packages(pkg_to_install)

lapply(required_pkg, library, character.only = TRUE)

devtools::install_github("r4ss/r4ss",
  ref = "c53f82fcfb3f54296d79ba3a4163990150981285"
)
library(r4ss)


# library(tidyr)
# require(dplyr)
# library(ggplot2)
# library(data.table)
# library(here)
# library(ggforce)
# library(ggthemes)
# library(stringr)

# Case 0: default stock assessment run ----------------------------

# Load simulated input data
source(here::here("Rscript", "simulation.R"))
file_path <- here::here("data", "data_rich")

model_year <- 1985:2012
projection_year <- 2013:2017

# Write data.ss for Stock Synthesis ------------------------------------------

ss3_data <- r4ss::SS_readdat(
  verbose = FALSE,
  file = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "data", full.names = TRUE)
)

ss3_data$styr <- model_year[1]
ss3_data$endyr <- tail(model_year, n=1)
# What is the spawn month?
ss3_data$Nsexes <- ss3_data$Ngenders <- sa_data$biodata$nsex
ss3_data$Nages <- length(sa_data$biodata$ages)
ss3_data$N_areas <- sa_data$biodata$narea
ss3_data$Nsurveys <- length(sa_data$survey$obs_abundance_index)
ss3_data$Nfleet <- length(sa_data$fishery$obs_total_catch_biomass)
ss3_data$Nfleets <- length(sa_data$fishery$obs_total_catch_biomass) + length(sa_data$survey$obs_abundance_index)


fleet_name <- names(sa_data$fishery$obs_total_catch_biomass)
survey_name <- names(sa_data$survey$obs_abundance_index)
survey_time <- sapply(1:length(survey_name), function(x) unique(sa_data$survey$om_baa[[x]]$month))

ss3_data$fleetinfo <- data.frame(
  "type" = c(1, rep(3, ss3_data$Nfleets-1)),
  "surveytiming" = c(-1, survey_time),
  "area" = rep(1, ss3_data$Nfleets),
  "units" = c(1, rep(2, ss3_data$Nsurveys)),
  "need_catch_mult" = rep(0, ss3_data$Nfleets),
  "fleetname" = c(fleet_name, survey_name)
)

ss3_data$fleetnames <- c(fleet_name, survey_name)
ss3_data$surveytiming <- c(-1, survey_time)

ss3_data$units_of_catch <- ss3_data$fleetinfo$units

fleet_year_id <- names(sa_data$fishery$obs_total_catch_biomass$fleet1) %in% model_year
ss3_data$catch <- data.frame(
  year = model_year,
  seas = 1,
  fleet = 1,
  catch = sa_data$fishery$obs_total_catch_biomass$fleet1[fleet_year_id],
  catch_se = sa_data$fishery$om_cv[fleet_year_id]
)

ss3_data$CPUEinfo <- data.frame(
  Fleet = 1:ss3_data$Nfleets,
  Units = c(1, rep(0, ss3_data$Nsurveys)),
  Errtype = 0,
  SD_Report = 0
)
row.names(ss3_data$CPUEinfo) <- ss3_data$fleetnames

cpue_data <- list()
for (i in 1:length(sa_data$survey$obs_abundance_index)){
  survey_years <- model_year[model_year %in% names(sa_data$survey$obs_abundance_index[[i]])]
  cpue_data[[i]] <- data.frame(
    year = survey_years,
    seas = unique(sa_data$survey$om_baa[[i]]$month),
    index = i + 1,
    obs = sa_data$survey$obs_abundance_index[[i]][as.character(survey_years)],
    se_log = sa_data$survey$om_cv[[i]][as.character(survey_years)]
  )
}

ss3_data$CPUE <- do.call(rbind, cpue_data)

# set up population length bin structure
ss3_data$lbin_method <- 2
ss3_data$binwidth <- sa_data$biodata$bin_width
ss3_data$minimum_size <- sa_data$biodata$length_bin[1]
ss3_data$maximum_size <- tail(sa_data$biodata$length_bin, n=1)
ss3_data$use_lencomp <- 1
ss3_data$comp_tail_compression <- rep(-0.0001, times=ss3_data$Nfleets)
ss3_data$add_to_comp <- rep(1e-5, times=ss3_data$Nfleets)
ss3_data$len_info <- data.frame(
  mintailcomp = rep(0, times=ss3_data$Nfleets),
  addtocomp = 1e-5,
  combine_M_F = 0,
  CompressBins = 0,
  CompError = 0,
  ParmSelect = 0,
  minsamplesize = 0.001
)
row.names(ss3_data$len_info) <- ss3_data$fleetnames

lencomp <- list()
for (i in 1:4){

  year = as.numeric(row.names(na.omit(sa_data$survey$obs_lencomp_num_ss3[[i]])))
  year_id = year[year %in% model_year]
  if (length(year_id)==0) {
    lencomp[[i]] <- NA
  } else {
    lencomp[[i]] <- data.frame(
      Yr = year_id,
      Seas = unique(sa_data$survey$om_baa[[i]]$month),
      FltSvy = i+1,
      Gender = 0,
      Part = 0,
      Nsamp = sa_data$survey$om_sample_number[[i]][as.character(year_id)]
    )
    lencomp[[i]] <- cbind(lencomp[[i]], sa_data$survey$obs_lencomp_num_ss3[[i]][as.character(year_id), ])
  }

}
ss3_data$lencomp <- do.call(rbind, lencomp)
ss3_data$lencomp <- na.omit(ss3_data$lencomp)

# set up population age bin structure
ss3_data$N_agebins - length(sa_data$biodata$ages)
ss3_data$agebin_vector <- sa_data$biodata$ages
ss3_data$N_ageerror_definitions <- 1
ss3_data$ageerror <- matrix(c(rep(-1, ss3_data$Nages + 1), rep(0, ss3_data$Nages + 1)), nrow = 2, byrow = TRUE)
ss3_data$age_info <- data.frame(
  mintailcomp = rep(0, times=ss3_data$Nfleets),
  addtocomp = 1e-7,
  combine_M_F = 1,
  CompressBins = 0,
  CompError = 0,
  ParmSelect = 0,
  minsamplesize = 0.001
)
row.names(ss3_data$age_info) <- ss3_data$fleetnames

ss3_data$Lbin_method <- 1 # for age data

year = as.numeric(row.names(sa_data$fishery$obs_caa_prop$fleet1))
year_id <- year[year %in% model_year]
agecomp <- data.frame(
  Yr = year_id,
  Seas = 1,
  FltSvy = 1,
  Gender = 0,
  Part = 0,
  Ageerr = 0,
  Lbin_lo = 1,
  Lbin_hi = -1,
  Nsamp = sa_data$fishery$om_sample_number[as.character(year_id)]
)
agecomp <- cbind(agecomp, sa_data$fishery$obs_caa_prop$fleet1[as.character(year_id), ])
ss3_data$agecomp <- agecomp

ss3_data$use_MeanSize_at_Age_obs <-
  ss3_data$N_environ_variables <-
  ss3_data$N_sizefreq_methods <-
  ss3_data$do_tags <-
  ss3_data$morphcomp_data <-
  ss3_data$use_selectivity_priors <- 0

ss3_data$MeanSize_at_Age_obs <- NULL
r4ss::SS_writedat(
  datlist = ss3_data, verbose = FALSE, outfile = file.path(file_path, "data.ss"),
  overwrite = TRUE
)

