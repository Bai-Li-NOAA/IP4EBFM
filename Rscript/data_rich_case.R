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


r4ss::SS_writedat(
  datlist = ss3_data, verbose = FALSE, outfile = file.path(user.od, "data.ss"),
  overwrite = TRUE
)

# Write wtatage.ss for Stock Synthesis ------------------------------------

modify_matrices <- function(matr_to_turn, time_id) {
  matr_to_turn$kg <- matr_to_turn$atoutput / 1000
  matr_to_turn <- filter(matr_to_turn, time %in% time_id)
  return_mat <- dcast(
    data = matr_to_turn,
    formula = time ~ agecl,
    value.var = "kg",
    fun.aggregate = NULL
  )

  return(return_mat)
}

surv_wtage <- read_savedsurvs(d.name, "survAnnWtage") # survey weight at age class
surv_wtage_species <- vector(mode = "list", length = length(survnames))
surv_meanwt <- vector(mode = "list", length = length(survnames))
for (i in 1:length(survnames)) {
  surv_wtage_species[[i]] <- surv_wtage[[survnames[i]]][[1]][surv_wtage[[survnames[i]]][[1]]$species %in% species, ]
  names(surv_wtage_species)[i] <- survnames[i]
  surv_wtage_species[[survnames[i]]]$kg <- surv_wtage_species[[survnames[i]]]$atoutput / 1000

  surv_wtage_species[[survnames[i]]]$time <- (surv_wtage_species[[survnames[i]]]$time - survey_sample_time[survnames[i]]) / timestep + 1

  surv_meanwt[[i]] <- modify_matrices(as.data.table(surv_wtage_species[[survnames[i]]]), time_id = fit_years)
  surv_meanwt[[i]] <- as.data.frame(surv_meanwt[[i]])
}


fish_wtage <- read_savedfisheries(d.name, "catchAnnWtage") # fishery weight at age class
fish_wtage_species <- fish_wtage$census[[1]][fish_wtage$census[[1]]$species %in% species, ]
fish_wtage_species$kg <- fish_wtage_species$atoutput / 1000

catch_meanwt <- modify_matrices(as.data.table(fish_wtage_species), time_id = fit_timesteps)
catch_meanwt[, 2:6] <- surv_meanwt[[2]][, 2:6]
catch_meanwt <- as.data.frame(catch_meanwt)

waa.array <- array(0, dim = c((stocksynthesis.data$endyr - stocksynthesis.data$styr + 1), stocksynthesis.data$Nages, stocksynthesis.data$Nfleets))

fish_waa_id <- which(catch_meanwt$time %in% fish_timesteps)
waa.array[, as.numeric(names(catch_meanwt)[2:ncol(catch_meanwt)]), 1] <- as.matrix(catch_meanwt[fish_waa_id, names(catch_meanwt)[2:ncol(catch_meanwt)]])

waa.array[, , 2] <- as.matrix(surv_meanwt[[1]][, 2:ncol(surv_meanwt[[1]])])
waa.array[, , 3] <- as.matrix(surv_meanwt[[2]][, 2:ncol(surv_meanwt[[2]])])

waa.new <- do.call(
  "rbind",
  replicate((length(survnames) + 3), data.frame(
    "Yr" = data_years[[3]],
    # todo: check season of weight at age
    "Seas" = 1,
    "Sex" = 1,
    "Bio_Pattern" = 1,
    "BirthSeas" = 1,
    "Fleet" = 1,
    "0" = waa.array[, 1, 3],
    waa.array[, , 3]
  ), simplify = FALSE)
)

waa.new$Fleet <- rep(-1:(length(survnames) + 1),
  each = stocksynthesis.data$endyr - stocksynthesis.data$styr + 1
)

# Use waa.array[, , 1] for catch WT
waa.new[waa.new$Fleet == 1, ] <- do.call(
  "rbind",
  replicate(1, data.frame(
    "Yr" = data_years[[1]],
    # todo: check season of weight at age
    "Seas" = 1,
    "Sex" = 1,
    "Bio_Pattern" = 1,
    "BirthSeas" = 1,
    "Fleet" = 1,
    "0" = waa.array[, 1, 1],
    waa.array[, , 1]
  ), simplify = FALSE)
)


waa.new[waa.new$Fleet == 2, ] <- do.call(
  "rbind",
  replicate(1, data.frame(
    "Yr" = data_years[[2]],
    # todo: check season of weight at age
    "Seas" = 1,
    "Sex" = 1,
    "Bio_Pattern" = 1,
    "BirthSeas" = 1,
    "Fleet" = 2,
    "0" = waa.array[, 1, 2],
    waa.array[, , 2]
  ), simplify = FALSE)
)

# Load into function environment as objects
maturity_mean <- c(
  as.numeric(truth$biolprm$maturityogive[truth$biolprm$maturityogive$code == species_code, 3:ncol(truth$biolprm$maturityogive)]),
  rep(1, stocksynthesis.data$Nages - truth$biolprm$maturityogive$nagecl[truth$biolprm$maturityogive$code == species_code])
)

names(maturity_mean) <- stocksynthesis.data$agebin_vector
maturity_matrix <- matrix(rep(maturity_mean, each = length(data_years[[3]])), nrow = length(data_years[[3]]))

fecmat <- waa.array[, , 3] * maturity_matrix
colnames(fecmat) <- as.character(stocksynthesis.data$agebin_vector)
waa.fec <- data.frame(
  "Yr" = data_years[[3]],
  "Seas" = 1,
  "Sex" = 1,
  "Bio_Pattern" = 1,
  "BirthSeas" = 1,
  "Fleet" = -2,
  "0" = fecmat[, 1],
  fecmat
)

waa.new <- rbind(waa.new, waa.fec)

if (stocksynthesis.data$Nsexes == 2) {
  waa.mal <- waa.new
  waa.mal$Sex <- 2
  waa.new <- rbind(waa.new, waa.mal)
}

waa.forecast <- waa.new[waa.new$Yr == stocksynthesis.data$endyr, ]
waa.forecast$Yr <- 1 + waa.forecast$Yr
waa.new <- rbind(waa.new, waa.forecast)

waa.new$X0 <- 0
r4ss::SS_writewtatage(
  mylist = waa.new, dir = user.od,
  warn = FALSE, verbose = FALSE, overwrite = TRUE
)





# Write control.ss for Stock Synthesis ------------------------------------
simple_ctl <- r4ss::SS_readctl(
  verbose = FALSE,
  file = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "control", full.names = TRUE),
  use_datlist = TRUE,
  datlist = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "data", full.names = TRUE)
)

ctl <- simple_ctl

ctl$EmpiricalWAA <- 1

# ctl$recr_dist_pattern$age <- 1 # recruitment age


ctl$Growth_Age_for_L1 <- 1
ctl$Growth_Age_for_L2 <- utils::tail(stocksynthesis.data$agebin_vector, 1)

ctl$MG_parms$PHASE[ctl$MG_parms$PHASE > 0] <- ctl$MG_parms$PHASE[ctl$MG_parms$PHASE > 0] * (-1)


ctl$MG_parms[grep("Frac", rownames(ctl$MG_parms)), ] <- c(0.000001, 0.99, 0.5, 0.5, 0.5, 0, -1, 0, 0, 0, 0, 0, 0, 0, 14)
# ctl$MG_parms[grep("Frac", rownames(ctl$MG_parms)), ] <- c(0.000001, 0.99, 0.99, 0.99, 0.5, 0, -1, 0, 0, 0, 0, 0, 0, 0,14)

ctl$maturity_option <- 5 # disable maturity and use maturity in wtatage.ss?
ctl$First_Mature_Age <- as.numeric(which(maturity_mean > 0)[1])
ctl$MainRdevYrFirst <- fit_years[1]
ctl$MainRdevYrLast <- utils::tail(fit_years, 1)
ctl$recdev_phase <- 1
ctl$recr_dist_method <- 4

ctl$N_Block_Designs <- 0
ctl$blocks_per_pattern <- NULL
ctl$Block_Design <- NULL


ctl$MG_parms <- ctl$MG_parms[-grep("RecrDist", rownames(ctl$MG_parms)), ]
# todo: change early start year
ctl$recdev_early_start <- stocksynthesis.data$Nages * -1 # ctl$recdev_early_start <- catch.nages * -3
ctl$recdev_early_phase <- 3
ctl$Fcast_recr_phase <- 6

ctl$last_early_yr_nobias_adj <- fit_years[1] - 1
ctl$first_yr_fullbias_adj <- fit_years[1]
ctl$last_yr_fullbias_adj <- utils::tail(fit_years, 1)
ctl$first_recent_yr_nobias_adj <- utils::tail(fit_years, 1) + 1

# ctl$last_early_yr_nobias_adj <- -11
# ctl$first_yr_fullbias_adj <- 36.9
# ctl$last_yr_fullbias_adj <- 71.9
# ctl$first_recent_yr_nobias_adj <- 80
# ctl$max_bias_adj <- 0

ctl$F_ballpark_year <- fit_years[1]

# Selectivity
ctl$size_selex_types <- do.call("rbind", replicate(n = stocksynthesis.data$Nfleets, expr = c(0, 0, 0, 0), simplify = FALSE))
ctl$size_selex_types <- as.data.frame(ctl$size_selex_types) # Convert matrix to dataframe and deal with PType and printdf in SS_writectl_3.30
ctl$age_selex_types <- do.call("rbind", replicate(n = stocksynthesis.data$Nfleets, expr = c(17, 0, 0, stocksynthesis.data$Nages), simplify = FALSE))
ctl$age_selex_types <- as.data.frame(ctl$age_selex_types)

ctl$age_selex_parms <- data.frame(
  "LO" = c(-10002, -1, rep(-10, stocksynthesis.data$Nages - 1)),
  "HI" = c(1, rep(10, stocksynthesis.data$Nages)),
  "INIT" = c(-1000, 0, rep(0.01, stocksynthesis.data$Nages - 1)),
  "PRIOR" = 0, "SD" = 0, "PR_TYPE" = 0,
  "PHASE" = c(-4, -4, rep(4, stocksynthesis.data$Nages - 1)),
  matrix(0, ncol = 7, nrow = stocksynthesis.data$Nages + 1)
)
ctl$age_selex_parms <- do.call(
  "rbind",
  replicate(length(survnames) + 1,
    ctl$age_selex_parms,
    simplify = FALSE
  )
)

dmpars <- do.call("rbind", replicate(length(survnames) + 1,
  data.frame(
    "LO" = -7, "HI" = 7, "INIT" = 1,
    "PRIOR" = 0, "SD" = 0, "PR_TYPE" = 0, "PHASE" = 7,
    0, 0, 0, 0, 0, 0, 0
  ),
  simplify = FALSE
))
colnames(dmpars) <- colnames(simple_ctl$age_selex_parms)
colnames(ctl$age_selex_parms) <- colnames(simple_ctl$age_selex_parms)
ctl$age_selex_parms <- rbind(ctl$age_selex_parms, dmpars)

slx <- 12

if (slx == 26) { # Exponential logistic
  ctl$age_selex_types <- do.call("rbind", replicate(n = stocksynthesis.data$Nfleets, expr = c(26, 0, 0, 0), simplify = FALSE))
  ctl$age_selex_types <- as.data.frame(ctl$age_selex_types)

  ctl$age_selex_parms <- data.frame(
    "LO" = rep(c(0.02, 0.0001, 0.0001), stocksynthesis.data$Nfleets),
    "HI" = rep(c(max(stocksynthesis.data$agebin_vector), 1, 1), stocksynthesis.data$Nfleets),
    "INIT" = c(c(2, 0.9, 0.01), c(0.9, 0.001, 0.9), c(0.9, 0.001, 0.9)), # use -999 to decay young and old fish selectivity according to p3 and p4
    "PRIOR" = 0, "SD" = 1, "PR_TYPE" = 0,
    "PHASE" = rep(c(2, 2, 2), stocksynthesis.data$Nfleets), # Fix -999 options and parameters 2 and 4
    matrix(0, ncol = 7, nrow = stocksynthesis.data$Nfleets)
  )
  colnames(ctl$age_selex_parms) <- colnames(simple_ctl$age_selex_parms)
}

if (slx == 12) { # Simple logistic
  ctl$age_selex_types <- do.call("rbind", replicate(n = stocksynthesis.data$Nfleets, expr = c(12, 0, 0, 0), simplify = FALSE))
  ctl$age_selex_types <- as.data.frame(ctl$age_selex_types)

  ctl$age_selex_parms <- data.frame(
    "LO" = rep(c(1, 0.1), stocksynthesis.data$Nfleets),
    "HI" = rep(c(max(stocksynthesis.data$Nages), 5), stocksynthesis.data$Nfleets),
    "INIT" = c(10, 3, 5, 1, 5, 1),
    "PRIOR" = 0, "SD" = 0, "PR_TYPE" = 0,
    "PHASE" = rep(2, stocksynthesis.data$Nfleets * 2),
    matrix(0, ncol = 7, nrow = stocksynthesis.data$Nfleets * 2)
  )
  colnames(ctl$age_selex_parms) <- colnames(simple_ctl$age_selex_parms)
}

if (slx == 20) { # double normal
  ctl$age_selex_types <- do.call("rbind", replicate(n = stocksynthesis.data$Nfleets, expr = c(20, 0, 0, 0), simplify = FALSE))
  ctl$age_selex_types <- as.data.frame(ctl$age_selex_types)

  ctl$age_selex_parms <- data.frame(
    "LO" = rep(c(0, rep(-15, 5)), stocksynthesis.data$Nfleets),
    "HI" = rep(c(max(stocksynthesis.data$Nages), rep(15, 5)), stocksynthesis.data$Nfleets),
    "INIT" = rep(c(max(stocksynthesis.data$Nages) / 2, 3, 5, 5, rep(-999, 2)), stocksynthesis.data$Nfleets), # use -999 to decay young and old fish selectivity according to p3 and p4
    "PRIOR" = 0, "SD" = 0, "PR_TYPE" = 0,
    "PHASE" = rep(c(2, 1, 2, 1, rep(-1, 2)), stocksynthesis.data$Nfleets), # Fix -999 options and parameters 2 and 4
    matrix(0, ncol = 7, nrow = stocksynthesis.data$Nfleets)
  )
  colnames(ctl$age_selex_parms) <- colnames(simple_ctl$age_selex_parms)
}

fleet_slx17 <- data.frame(
  "LO" = c(-1002, rep(-5, stocksynthesis.data$Nages)),
  "HI" = c(3, rep(9, stocksynthesis.data$Nages)),
  "INIT" = c(-1000, rep(0.01, 16), rep(1, 4)),
  "PRIOR" = 0, "SD" = 0, "PR_TYPE" = 0,
  "PHASE" = c(-2, rep(2, stocksynthesis.data$Nages)),
  matrix(0, ncol = 7, nrow = stocksynthesis.data$Nfleets)
)
colnames(fleet_slx17) <- colnames(simple_ctl$age_selex_parms)
ctl$age_selex_parms <- rbind(
  fleet_slx17,
  ctl$age_selex_parms[3:nrow(ctl$age_selex_parms), ]
)

ctl$age_selex_types[1, ] <- c(17, 0, 0, 0)
ctl$age_selex_types

ctl$size_selex_parms <- NULL

# todo: implement added SD for all surveys
ctl$Q_options <- data.frame(
  "fleet" = 2:(length(survnames) + 1),
  "link" = 1, "link_info" = 0, "extra_se" = 0,
  "biasadj" = 0, "float" = 0
)

ctl$Q_parms <- rbind(data.frame(
  "LO" = rep(-10, length(survnames)),
  "HI" = rep(10, length(survnames)),
  "INIT" = log(jitter(rep(0.05, length(survnames)), 30)),
  "PRIOR" = rep(0, length(survnames)),
  "SD" = rep(0, length(survnames)),
  "PR_TYPE" = rep(0, length(survnames)),
  "PHASE" = rep(1, length(survnames)),
  matrix(0, ncol = 7, nrow = length(survnames))
))


# todo: this assumes a time-invariant fixed natural mortality
ctl$natM_type <- 3
####################################################################################
# matage <- rep(3, stocksynthesis.data$Nages+1)
matage <- rep(0.2, stocksynthesis.data$Nages + 1)
# matage <- c(0.2, 1.2, 0.8, rep(0.2, 18)) ###

if (stocksynthesis.data$Nsexes == 1) {
  ctl$natM <- as.data.frame(matage)
}

if (stocksynthesis.data$Nsexes == 2) {
  ctl$natM <- as.data.frame(rbind(matage, matage))
}

ctl$MG_parms <- ctl$MG_parms[-grep("NatM", rownames(ctl$MG_parms)), ]

if (stocksynthesis.data$Nsexes == 1) {
  ctl$MG_parms <- ctl$MG_parms[-grep("Mal", rownames(ctl$MG_parms)), ]
}

# SR
ctl$Use_steep_init_equi <- 0

Fmult.y1 <- 0.1
naa.y1 <- (ctl$natM[1, 1] / (ctl$natM[1, 1] + Fmult.y1)) * stocksynthesis.data$catch$catch[2:nrow(stocksynthesis.data$catch)] / (1 - exp(-ctl$natM[1, 1] - Fmult.y1))

if (naa.y1[1] %in% sort(naa.y1)[1:round(length(naa.y1) / 5)]) naa.y1[1] <- 10 * mean(naa.y1)

ctl$SR_function <- 3 # 3: B-H
ctl$SR_parms[grep("sigma", rownames(ctl$SR_parms)), "INIT"] <- 0.1
ctl$SR_parms[grep("sigma", rownames(ctl$SR_parms)), "PHASE"] <- -2 ###
ctl$SR_parms[grep("steep", rownames(ctl$SR_parms)), "INIT"] <- 0.99
ctl$SR_parms[grep("steep", rownames(ctl$SR_parms)), "PHASE"] <- -2 ###
ctl$SR_parms[grep("steep", rownames(ctl$SR_parms)), "PR_type"] <- 0
ctl$SR_parms[grep("R0", rownames(ctl$SR_parms)), "INIT"] <- log(naa.y1[1])

ctl$N_lambdas <- 1
ctl$lambdas <- ctl$lambdas[-c(1:nrow(ctl$lambdas)), ]
ctl$lambdas[1, ] <- c(9, 1, 1, 0, 1)

ctl$more_stddev_reporting <- 0

ctl$stddev_reporting_selex[1] <- -1
ctl$stddev_reporting_growth[1] <- -1
ctl$stddev_reporting_N_at_A[1] <- -1

if (f.method == 2) {
  ctl$F_Method <- 2
  ctl$F_setup <- c(0.01, 5, 0.00)
  names(ctl$F_setup) <- c("F_setup_1", "F_setup_2", "F_setup_3")
  ctl$init_F <- data.frame(
    "LO" = 0,
    "HI" = 5,
    "INIT" = 0.01,
    "PRIOR" = 0.01,
    "PR_SD" = 0.2,
    "PR_type" = 0,
    "PHASE" = 1,
    "PType" = 18
  )
  ctl$maxF <- 5
}

YOY <- omlist_ss$YOY_ss
YOY_ss <- YOY %>%
  select(Time, "NCO.0")
plot(YOY_ss$NCO.0[YOY_ss$Time %in% fittimes.days])

truenums_ss <- truth$nums[truth$nums$species == species, ]
fgs <- truth$fgs
biolprm <- truth$biolprm

fullresZ <- calc_Z(
  yoy = YOY_ss,
  nums = truenums_ss,
  fgs = fgs,
  biolprm = biolprm,
  toutinc = omlist_ss$runpar$toutinc
)
Z <- mean(fullresZ$atoutput)

# cod_ctl <- SS_write_biol(ctl_obj = ctl,
#                          biolprm_object = biolprm,
#                          species_code = species_code,
#                          M_est = NULL, wtsage=meanwt_spp)

# vector of parameters needed
needed_pars <- c("BHalpha", "BHbeta", "kgw2d", "redfieldcn", "maturityogive", "fsp", "kwsr", "kwrr", "wl")
ind <- rep(0, length(needed_pars))

# Extract needed parameters from a list and assign them to unique vars
for (i in 1:length(needed_pars)) {
  if (is.null(biolprm[needed_pars[i]])) {
    stop(paste("Warning: the biolprm object is missing parameter", needed_pars[i], "- cannot write biology."))
  }
  if (length(biolprm[[needed_pars[i]]]) == 1) {
    assign(needed_pars[i], biolprm[[needed_pars[i]]])
  } else {
    # index of the parameter object matching the species
    ind[i] <- which(biolprm[[needed_pars[i]]][, 1] == species_code)

    if (is.null(ind[i])) {
      stop(paste("Missing value for", needed_pars[i], "for species", species_code))
    }

    # assign to the right variable name
    assign(needed_pars[i], biolprm[[needed_pars[i]]][ind[i], -1])
  }
}

# Calculate recruitment parameters from atlantis values

meanwt_spp <- surv_wtage_species[[2]] %>%
  filter(time > burnin) %>%
  group_by(agecl) %>%
  summarize(meanwt = mean(atoutput))
# Translate weight at age from grams to nitrogen
wtsage_N <- meanwt_spp %>%
  mutate(weight = meanwt * 20 * 5.7)

M_est <- NULL
if (is.null(M_est)) {
  M_est <- 0.2
}


# bh_lnro <- log(BHalpha) - log(kwrr+kwsr)
# # sb0 <- exp(bh_lnro)*sum(exp(-M_est*wtsage_N[,"agecl"])*fsp*wtsage_N[,"weight"]*as.numeric(t(maturity_mean)))
# sb0 <- exp(bh_lnro)*sum(exp(-M_est*wtsage_N[,"agecl"])*fsp*wtsage_N[,"weight"]*as.numeric(t(maturity_mean)))/100000
# b0 <- sum(exp(-Z*wtsage_N[,"agecl"])*exp(bh_lnro)*wtsage_N[,"weight"])
# bh_steepness <- ((kwrr+kwsr)*0.2*sb0)/(BHbeta+0.2*sb0)
# ctl$SR_parms[grep("steep", rownames(ctl$SR_parms)), "INIT"] <- bh_steepness

r4ss::SS_writectl(ctl,
  outfile = file.path(user.od, "control.ss"),
  overwrite = TRUE, verbose = FALSE, version = "3.30"
)


# Write starter.ss for Stock Synthesis ------------------------------------

stocksynthesis.starter <- r4ss::SS_readstarter(
  verbose = FALSE,
  file = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "starter", full.names = TRUE)
)

stocksynthesis.starter$sourcefile <- file.path(here("NOBA_cod_files", "output", "atlantis2ss"), "starter.ss")
stocksynthesis.starter$datfile <- "data.ss"
stocksynthesis.starter$ctlfile <- "control.ss"

if (is.null(report.ages)) {
  stocksynthesis.starter$F_age_range <- range(stocksynthesis.data$agebin_vector)
} else {
  stocksynthesis.starter$F_age_range <- report.ages
}


stocksynthesis.starter$F_report_basis <- 0

r4ss::SS_writestarter(stocksynthesis.starter,
  dir = user.od,
  overwrite = TRUE, warn = FALSE, verbose = FALSE
)

# Write forecast.ss for Stock Synthesis ------------------------------------

stocksynthesis.forecast <- r4ss::SS_readforecast(
  verbose = FALSE,
  file = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "forecast", full.names = TRUE)
)

stocksynthesis.forecast$sourcefile <- paste0(user.od, "forecast.ss")
stocksynthesis.forecast$benchmarks <- 1
stocksynthesis.forecast$MSY <- 2
# forecast$SPRtarget
# forecast$Btarget
stocksynthesis.forecast$Bmark_years <- rep(c(-999, 0), 5)
stocksynthesis.forecast$Bmark_relF_Basis <- 2
stocksynthesis.forecast$Forecast <- 4
stocksynthesis.forecast$Nforecastyrs <- forN
# forecast$F_scalar
stocksynthesis.forecast$Fcast_years <- rep(c(-999, 0), 3)
stocksynthesis.forecast$Fcast_selex <- 0
stocksynthesis.forecast$ControlRuleMethod <- 1
# forecast$BforconstantF
# forecast$BfornoF
stocksynthesis.forecast$Flimitfraction <- 1
stocksynthesis.forecast$FirstYear_for_caps_and_allocations <- max(fit_years) + 1
r4ss::SS_writeforecast(stocksynthesis.forecast,
  dir = user.od,
  overwrite = TRUE, verbose = FALSE
)
)



