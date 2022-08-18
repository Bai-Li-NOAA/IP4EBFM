library(RColorBrewer)
library(ggplot2)
library(tidyverse)
library(reshape2)
library(here)
set.seed(999)

options(digits = 2)

# specify working directories ---------------------------------------------

project_path <- here::here()

ewe_output_path <- file.path(project_path, "data", "ewe", "7ages_newsim_final", "ewe7ages_ecosim_final", "ecosim_forcing_pdsi_egg_amo1")
# ewe_output_path <- file.path(project_path, "data", "ewe", "7ages_newsim_final", "ewe7ages_ecosim_final_fleetdynamics", "ecosim_forcing_pdsi_egg_amo1")
# ewe_output_path <- file.path(project_path, "data", "ewe", "7ages_newsim_noFbegin", "ewe7ages_ecosim_noFbegin", "ecosim_forcing_pdsi_egg_amo1_noFbegin")

menhadenSA_output_path <- file.path(project_path, "data", "AtlanticMenhadenSA")

# read Atlantic menhaden Beaufort Assessment Model output data --------

menhadenSA_output <- dget(file.path(menhadenSA_output_path, "am019.rdat"))

years <- 1985:2017
ages <- 0:6

# fishery selectivity
fishery_sel <- IFA4EBFM::logistic(
    pattern = "double_logistic",
    x = ages,
    slope_asc = 3.1,
    location_asc = 1.8,
    slope_desc = 0.88,
    location_desc = 0.01
) # CRS 1972 selectivity

# F-at-age
phase1_nyear <- 15
phase2_nyear <- 5
set.seed(9999)
f_full <- c(
    rep(0.15, length=phase1_nyear),
    seq(0.25, 0.7, length = phase2_nyear),
    seq(0.7, 0.2, length = length(years) - phase1_nyear - phase2_nyear)
) *
    exp(rnorm(length(years), mean = 0, sd = 0.2))
fatage <- matrix(NA, nrow = length(f_full), ncol = length(fishery_sel))
rownames(fatage) <- years
colnames(fatage) <- paste0("menhaden", ages)
for (i in 1:length(f_full)) {
    fatage[i, ] <- f_full[i] * fishery_sel
}

write.csv(fatage, file.path(project_path, "data", "ewe", "7ages_newsim_final", "fatage.csv"))

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
    CV = rep(0.05, length(years)),
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
    survey1 = rep(0.1, length(years)),
    survey2 = rep(0.1, length(years))
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
