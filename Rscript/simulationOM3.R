library(RColorBrewer)
library(ggplot2)
library(tidyverse)
library(reshape2)
library(here)
set.seed(999)

options(digits = 2)

# specify working directories ---------------------------------------------

project_path <- here::here()

ewe_output_path <- file.path(project_path, "data", "ewe", "7ages_newsim_om3", "ewe7ages_ecosim_om3", "ecosim_forcing_pdsi_egg_amo1")

menhadenSA_output_path <- file.path(project_path, "data", "AtlanticMenhadenSA")

# read Atlantic menhaden Beaufort Assessment Model output data --------

menhadenSA_output <- dget(file.path(menhadenSA_output_path, "am019.rdat"))

years <- 1985:2017
ages <- 0:6


# Specifiy fishing mortality rates --------------------------------

# fishery selectivity
fishery_sel <- IFA4EBFM::logistic(
    pattern = "double_logistic",
    x = ages,
    slope_asc = 3.1,
    location_asc = 1.8,
    slope_desc = 0.88,
    location_desc = 0.01
) # CRS 1972 selectivity

phase1_nyear <- 5
# phase2_nyear <- 10
phase2_nyear <- 15
# phase2_nyear <- 20
phase3_nyear <- length(years) - phase1_nyear - phase2_nyear

set.seed(9999)
f_full <- c(
    rep(0.01, length = phase1_nyear),
    cumprod(c(0.2, rep(1.25, phase2_nyear-1))),
    cumprod(c(1.8, rep(0.85, phase3_nyear-1)))
) *
    exp(rnorm(length(years), mean = 0, sd = 0.2))

# f_full <- c(
#     rep(0.01, length = phase1_nyear),
#     cumprod(c(0.2, rep(1.22, phase2_nyear-1))),
#     cumprod(c(1.8, rep(0.85, phase3_nyear-1)))
# ) *
#     exp(rnorm(length(years), mean = 0, sd = 0.2))
fatage <- matrix(NA, nrow = length(f_full), ncol = length(fishery_sel))
rownames(fatage) <- years
colnames(fatage) <- paste0("menhaden", ages)
for (i in 1:length(f_full)) {
    fatage[i, ] <- f_full[i] * fishery_sel
}

dir_path <- file.path(project_path, "data", "ewe", "7ages_newsim_om3")
dir.create(dir_path, showWarnings = FALSE)
write.csv(fatage, file.path(dir_path, "fatage.csv"))

f_full_scale <- rescale(f_full)
f_full_scale_month <- rep(f_full_scale, each=12)
write.csv(f_full, file.path(dir_path, "f_full.csv"))
write.csv(f_full_scale_month, file.path(dir_path, "f_full_scale.csv"))


# Specify catchability at age -------------------------------------
ewe_catchability <- read.csv(here::here("data", "ewe", "qatage.csv"))

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

age_name <- paste0("AtlanticMenhaden", 0:6)

# Load "true" data
biomass <- read_ewe_output(
    file_path = ewe_output_path,
    file_names = "biomass_monthly.csv",
    skip_nrows = 8,
    plot = FALSE,
    figure_titles = NULL,
    functional_groups = functional_groups,
    figure_colors = NULL
)
biomass_ewe <- apply(biomass[[1]][, age_name], 1, sum) * 1000000
density_dependent_q <- 90*biomass_ewe^(-0.49)

density_dependent_effort <- rescale(f_full_scale_month/density_dependent_q)
qatage_adj <- qatage <- ewe_catchability[, grep("menhaden", colnames(ewe_catchability))]
for (i in 1:ncol(qatage)){
    qatage_adj[, i] <- qatage[, i]/density_dependent_q[1]*density_dependent_q
}
write.csv(density_dependent_effort, file.path(dir_path, "density_dependent_effort.csv"))
write.csv(qatage_adj, file.path(dir_path, "qatage_adj.csv"))
# Create fishery ----------------------------------------------------------

fishery_sample_num <- cbind(
    menhadenSA_output$t.series$acomp.cRs.n[which(menhadenSA_output$t.series$year %in% years)],
    menhadenSA_output$t.series$acomp.cBs.n[which(menhadenSA_output$t.series$year %in% years)],
    menhadenSA_output$t.$acomp.cBn.n[which(menhadenSA_output$t.series$year %in% years)],
    menhadenSA_output$t.series$acomp.cRn.n[which(menhadenSA_output$t.series$year %in% years)]
)
fishery_sample_num[fishery_sample_num==-99999] <- 0

fishery <- create_fishery(
    file_path = file.path(ewe_output_path, "catch_annual.csv"),
    skip_nrows = 8,
    species = 4:10,
    species_labels = paste0("age", ages),
    ewe_years = 0:32,
    data_years = years,
    fleet_num = 1,
    selectivity = NULL,
    CV = rep(fishery_CV_input, length(years)),
    # sample_num = apply(fishery_sample_num, 1, sum),
    sample_num = rep(800, length(years)),
    waa_path = file.path(ewe_output_path, "weight_annual.csv")
)
# Create survey ----------------------------------------------------------

# selectivity settings
survey_num <- 2

survey_name <- c("survey1", "survey2")

# set up survey time
# Need to check Table 26 from BAM assessment: Length cutoffs used to distinguish age-0 from age-1+ Atlantic menhaden at different regions.

survey1_year <- 1990:2017 # Adult Index (survey1): age 1+ fish; September - January; Time of the year when menhaden were most abundant in this region

survey2_year <- 1985:2017 # Adult Index (survey2): age 1+ fish; March - May

survey_time <- list(
    survey1 = data.frame(
        year = survey1_year,
        month = rep(10, length(survey1_year)) # Oct 15
    ),
    survey2 = data.frame(
        year = survey2_year,
        month = rep(4, length(survey2_year)) # April 15
    )
)

# set up survey selectivity
# survey1_sel <- IFA4EBFM::logistic(
#   pattern = "double_logistic",
#   x = ages,
#   slope_asc = 2.2,
#   location_asc = 3.0,
#   slope_desc = 3.0,
#   location_desc = 3.5
# )
#
# survey1_sel <- IFA4EBFM::logistic(
#   pattern = "simple_logistic",
#   x = ages,
#   slope_asc = 2.2,
#   location_asc = 3.0
# )

survey1_sel <- IFA4EBFM::logistic(
    pattern = "double_logistic",
    x = ages,
    slope_asc = 4.3,
    location_asc = 2.3,
    slope_desc = 3.5,
    location_desc = 2.3
)

survey2_sel <- IFA4EBFM::logistic(
    pattern = "double_logistic",
    x = ages,
    slope_asc = 4.3,
    location_asc = 2.3,
    slope_desc = 3.5,
    location_desc = 2.3
)


survey_selectivity <- list(
    survey1 = as.data.frame(
        matrix(rep(survey1_sel, times = length(years)), ncol = length(ages), byrow = TRUE),
        row.names = years
    ),
    survey2 = as.data.frame(
        matrix(rep(survey2_sel, times = length(years)), ncol = length(ages), byrow = TRUE),
        row.names = years,
    )
)

survey_selectivity <- lapply(survey_selectivity, setNames, paste("age", ages))

# set up catchability
survey_catchability <- list(
    survey1 = menhadenSA_output$t.series$q.nad[which(menhadenSA_output$t.series$year %in% years)],
    survey2 = menhadenSA_output$t.series$q.mad[which(menhadenSA_output$t.series$year %in% years)]
)

survey_catchability <- lapply(survey_catchability, setNames, years)

# set up CV
# survey_CV <- list(
#   survey1 = menhadenSA_output$t.series$cv.U.nad[which(menhadenSA_output$t.series$year %in% years)],
#   survey2 = menhadenSA_output$t.series$cv.U.mad[which(menhadenSA_output$t.series$year %in% years)]
# )

survey_CV <- list(
    survey1 = rep(survey_CV_input, length(years)),
    survey2 = rep(survey_CV_input, length(years))
)

survey_CV <- lapply(survey_CV, setNames, years)

# set up sample number
survey_sample_num <- list(
    # survey1 = menhadenSA_output$t.series$lcomp.nad.nfish[which(menhadenSA_output$t.series$year %in% years)],
    #survey2 = menhadenSA_output$t.series$lcomp.mad.nfish[which(menhadenSA_output$t.series$year %in% years)]
    survey1 = rep(800, length= length(years)),
    survey2 = rep(800, length= length(years))
)
survey_sample_num <- lapply(survey_sample_num, setNames, years)

for (i in 1:length(survey_sample_num)) {
    survey_sample_num[[i]][survey_sample_num[[i]] == -99999] <- NA
}

# set up age-length population structure
length_bin <- seq(10.0, 600, 10) / 10 # in cm
mid_length_bin <- seq(15, 605, 10) / 10 # in cm
nbin <- length(length_bin)
bin_width <- 1

length_CV <- list(
    survey1 = 0.12,
    survey2 = 0.17
)

# Create survey
survey <- IFA4EBFM::create_survey(
    file_path = file.path(ewe_output_path, "biomass_monthly.csv"),
    skip_nrows = 8,
    species = 4:10,
    species_labels = paste0("age", ages),
    years = years,
    survey_num = survey_num,
    survey_time = survey_time,
    selectivity = survey_selectivity,
    catchability = survey_catchability,
    CV = survey_CV,
    sample_num = survey_sample_num,
    waa_path = file.path(ewe_output_path, "weight_monthly.csv"),
    length_bin = length_bin,
    mid_length_bin = mid_length_bin,
    nbin = nbin,
    bin_width = bin_width,
    length_CV = length_CV
)

biodata <- create_biodata(nsex=1, narea=1, ages=ages, years=years,
                          length_bin=length_bin, mid_length_bin=mid_length_bin,
                          nbin=nbin, bin_width=bin_width, length_CV=length_CV,
                          annual_weight_path=file.path(ewe_output_path, "weight_annual.csv"),
                          monthly_weight_path=file.path(ewe_output_path, "weight_monthly.csv"),
                          species=4:10,
                          species_labels=paste0("age", ages),
                          skip_nrows=8,
                          lw_a=0.01, lw_b=3,
                          k=0.331,
                          t0 = -0.1,
                          winf = 0.237,
                          maturity_at_age=c(0.0, 0.1, 0.5, 0.9, 1.0, 1.0, 1.0), # From both BAM and EwE
                          natural_mortality_at_age=c(1.76, 1.31, 1.03, 0.9, 0.81, 0.76, 0.72) # From both BAM and EwE
)

sa_data <- list(
    fishery = fishery,
    survey = survey,
    biodata = biodata
)

rm(list=setdiff(ls(), "sa_data"))
