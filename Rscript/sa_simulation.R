# Need to update data path etc

devtools::load_all()
library(here)
set.seed(999)

# specify working directories ---------------------------------------------

project_path <- here::here()
ewe_output_path <- file.path(project_path, "data", "ewe", "7ages", "ecosim_output", "BA0")
menhadenSA_output_path <- file.path(project_path, "data", "AtlanticMenhadenSA")

# read Atlantic menhaden Beaufort Assessment Model output data --------

menhadenSA_output <- dget(file.path(menhadenSA_output_path, "am019.rdat"))

years <- 1985:2017
ages <- 0:6
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
  years = years,
  fleet_num = 1,
  selectivity = NULL,
  CV = rep(0.05, length(years)),
  sample_num = apply(fishery_sample_num, 1, sum),
  waa_path = file.path(ewe_output_path, "weight_annual.csv")
)
fishery

# Create survey ----------------------------------------------------------

# selectivity settings
survey_num <- 4

survey_name <- c("nad", "mad", "sad", "yoy")

# set up survey time
# Need to check Table 26 from BAM assessment: Length cutoffs used to distinguish age-0 from age-1+ Atlantic menhaden at different regions.

nad_year <- 1990:2017 # BAM Northern Adult Index (NAD): age 1+ fish; September - January; Time of the year when menhaden were most abundant in this region

mad_year <- 1985:2017 # BAM Middle Adult Index (MAD): age 1+ fish; March - May

sad_year <- 1990:2017 # BAM South Adult Index (SAD): age 1+ fish: April - July

yoy_year <- 1985:2017 # covered all months, many surveys starts at July

survey_time <- list(
  nad = data.frame(
    year = nad_year,
    month = rep(10, length(nad_year)) # Oct 15
  ),
  mad = data.frame(
    year = mad_year,
    month = rep(4, length(mad_year)) # April 15
  ),
  sad = data.frame(
    year = sad_year,
    month = rep(4, length(sad_year)) # April 15
  ),
  yoy = data.frame(
    year = yoy_year,
    month = rep(6, length(yoy_year)) # June 1
  )
)

# set up survey selectivity
nad_sel <- IFA4EBFM::logistic(
  pattern = "double_logistic",
  x = ages,
  slope_asc = 2.2,
  location_asc = 3.0,
  slope_desc = 3.0,
  location_desc = 3.5
)

mad_sel <- IFA4EBFM::logistic(
  pattern = "double_logistic",
  x = ages,
  slope_asc = 4.3,
  location_asc = 2.3,
  slope_desc = 34.9,
  location_desc = 2.3
)

sad_sel <- IFA4EBFM::logistic(
  pattern = "double_logistic",
  x = ages,
  slope_asc = 7.0,
  location_asc = 0.3,
  slope_desc = 7.0,
  location_desc = 2.0
)

survey_selectivity <- list(
  nad = as.data.frame(
    matrix(rep(nad_sel, times = length(years)), ncol = length(ages), byrow = TRUE),
    row.names = years
  ),
  mad = as.data.frame(
    matrix(rep(mad_sel, times = length(years)), ncol = length(ages), byrow = TRUE),
    row.names = years,
  ),
  sad = as.data.frame(
    matrix(rep(sad_sel, times = length(years)), ncol = length(ages), byrow = TRUE),
    row.names = years,
  ),
  yoy = as.data.frame(
    matrix(rep(c(1, rep(0, 6)), times = length(years)), ncol = length(ages), byrow = TRUE),
    row.names = years,
  )
)

survey_selectivity <- lapply(survey_selectivity, setNames, paste("age", ages))

# set up catchability
yr_catchability_change_yoy <- 1986

survey_catchability <- list(
  nad = menhadenSA_output$t.series$q.nad[which(menhadenSA_output$t.series$year %in% years)],
  mad = menhadenSA_output$t.series$q.mad[which(menhadenSA_output$t.series$year %in% years)],
  sad = menhadenSA_output$t.series$q.sad[which(menhadenSA_output$t.series$year %in% years)],
  yoy = c(menhadenSA_output$t.series$q.jai[which(menhadenSA_output$t.series$year %in% c(years[1]:yr_catchability_change_yoy))], menhadenSA_output$t.series$q2.jai[which(menhadenSA_output$t.series$year %in% c((yr_catchability_change_yoy + 1):tail(years, n = 1)))])
)

survey_catchability <- lapply(survey_catchability, setNames, years)

# set up CV
survey_CV <- list(
  nad = menhadenSA_output$t.series$cv.U.nad[which(menhadenSA_output$t.series$year %in% years)],
  mad = menhadenSA_output$t.series$cv.U.mad[which(menhadenSA_output$t.series$year %in% years)],
  sad = menhadenSA_output$t.series$cv.U.sad[which(menhadenSA_output$t.series$year %in% years)],
  yoy = menhadenSA_output$t.series$cv.U.jai[which(menhadenSA_output$t.series$year %in% years)]
)
survey_CV <- lapply(survey_CV, setNames, years)

# set up sample number
survey_sample_num <- list(
  nad = menhadenSA_output$t.series$lcomp.nad.n[which(menhadenSA_output$t.series$year %in% years)],
  mad = menhadenSA_output$t.series$lcomp.mad.n[which(menhadenSA_output$t.series$year %in% years)],
  sad = rep(NA, length = length(years)),
  yoy = rep(NA, length = length(years))
)
survey_sample_num <- lapply(survey_sample_num, setNames, years)

for (i in 1:length(survey_sample_num)){
  survey_sample_num[[i]][survey_sample_num[[i]] == -99999] <- NA
}

# set up age-length population structure
length_bin <- seq(100, 400, 10)/10 # in cm
mid_length_bin <- seq(105, 405, 10)/10 # in cm
nbin <- length(length_bin)
bin_width <- 1

length_CV <- list(
  nad = 0.12,
  mad = 0.17,
  sad = NA,
  yoy = NA
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
