# Need to update data path etc

devtools::load_all()
library(here)
set.seed(999)

# specify working directories ---------------------------------------------

project_path <- here::here()
ewe_output_path <- file.path(project_path, "data", "ewe", "7ages", "ecosim_output", "BApos")
menhadenSA_output_path <- file.path(project_path, "data", "AtlanticMenhadenSA")

# read Atlantic menhaden Beaufort Assessment Model output data --------

menhadenSA_output <- dget(file.path(menhadenSA_output_path, "am019.rdat"))


# Create fishery ----------------------------------------------------------

years <- 1985:2017
fishery <- create_fishery(
    file_path = file.path(ewe_output_path, "catch_annual.csv"),
    skip_nrows = 8,
    species = 4:10,
    species_labels = paste0("age", 0:6),
    years = years,
    fleet_num = 1,
    selectivity = NULL,
    CV = rep(0.05, length(years)),
    sample_num = rep(200, length(years)),
    waa_path = file.path(ewe_output_path, "weight_annual.csv"))
fishery
