# Data-moderate case --------------------------------------------------
## Using Just Another Bayesian Biomass Assessment (JABBA)
## Website: https://github.com/jabbamodel/JABBA

# Install required R packages -------------------------------------
required_pkg <- c(
  "devtools", "here", "gplots",
  "coda", "rjags", "R2jags",
  "fitdistrplus", "reshape"
)

pkg_to_install <- required_pkg[!(required_pkg %in%
  installed.packages()[, "Package"])]
if (length(pkg_to_install)) install.packages(pkg_to_install)

lapply(required_pkg, library, character.only = TRUE)

devtools::install_github("jabbamodel/JABBA",
  ref = "d73313debf9326f2be920846ee361b3dcca8c22d"
)
library(JABBA)

# Case 0: default stock assessment run ----------------------------

# Load simulated input data
source(here::here("Rscript", "simulation.R"))

# Set up JABBA assessment
assessment <- "MenhadenLikeSpecies"
output_dir <- here::here("data", "data_moderate")
dir.create(output_dir, showWarnings = F)

model_year <- 1985:2012
projection_year <- 2013:2017

survey_name <- paste0("survey", 1:2)

# Prepare survey data
cpue <- se <- data.frame(
  Year = model_year
)

for (i in 1:length(survey_name)) {
  cpue[[survey_name[i]]] <- NA

  cpue[[survey_name[i]]][cpue$Year %in% as.numeric(names(sa_data$survey$obs_abundance_index[[survey_name[i]]]))] <-
    sa_data$survey$obs_abundance_index[[survey_name[i]]][as.numeric(names(sa_data$survey$obs_abundance_index[[survey_name[i]]])) %in% cpue$Year] / 1000 # 1000 fish

  se[[survey_name[i]]] <- NA
  se[[survey_name[i]]] <- sa_data$survey$om_cv[[survey_name[i]]][as.numeric(names(sa_data$survey$om_cv[[survey_name[i]]])) %in% cpue$Year]
}

# Prepare catch data
catch_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% model_year
catch <- data.frame(
  Year = model_year,
  Total = sa_data$fishery$obs_total_catch_biomass$fleet1[catch_id]
)
rownames(catch) <- 1:nrow(catch)

# Set up JABBA input data
catch_last <- tail(catch$Total, n=1)
tacs <- c(catch_last*0.5, catch_last, catch_last*1.5)
ss_case0_input <- JABBA::build_jabba(
  catch = catch,
  cpue = cpue,
  se = se,
  assessment = assessment,
  scenario = "case0",
  model.type = "Pella_m",
  add.catch.CV = FALSE,
  catch.cv = 0.1,
  catch.error = c("random", "under")[1],
  r.dist = c("lnorm", "range")[1],
  r.prior = c(0.6, 0.8), # 0.6: time-varying intrinsic growth rate from https://doi.org/10.3389/fmars.2021.608059
  K.dist = c("lnorm", "range")[1],
  K.prior = c(6500000, 0.8), # 6500000: max(catch$Total)*10
  projection = TRUE,
  TACs = tacs,
  pyrs = length(projection_year),
  catch.metric = "mt"
)

# Fit JABBA
ss_case0 <- JABBA::fit_jabba(
  jbinput = ss_case0_input,
  save.jabba = TRUE,
  save.all = TRUE,
  #save.trj = TRUE,
  save.prj = TRUE,
  output.dir = output_dir,
  save.csvs = T
)

# Plot figures using JABBA
JABBA::jabba_plots(jabba = ss_case0, output.dir = output_dir)
# plot with CIs (80% for projections)
JABBA::jbplot_prj(ss_case0, type = "BBmsy")
JABBA::jbplot_prj(ss_case0, type = "BB0")
JABBA::jbplot_prj(ss_case0, type = "FFmsy")


# Plot figures ----------------------------------------------------

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


fmsy <- rep(ss_case0$posteriors$Hmsy, times=(length(projection_year)+1)*length(tacs))
ss_case0$prj_posterior$f <- ss_case0$prj_posterior$harvest * fmsy

bmsy <- rep(ss_case0$posteriors$SBmsy, times=(length(projection_year)+1)*length(tacs))
ss_case0$prj_posterior$biomass <- ss_case0$prj_posterior$stock*bmsy

# Biomass
biomass <- read_ewe_output(
  file_path = here::here("data", "ewe", "7ages", "ecosim_with_environmental_driver", "amo_pcp"),
  file_names = "biomass_monthly.csv",
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = functional_groups,
  figure_colors = NULL
)

time_id <- seq(1, nrow(biomass[[1]]), by = 12)
biomass_ewe <- apply(biomass[[1]][, age_name], 1, sum) * 1000000

par(mfrow=c(1,2))
ylim <- range(biomass_ewe[time_id], ss_case0$timeseries[, "mu", "B"])
plot(c(model_year, projection_year),
     biomass_ewe[time_id],
     xlab = "Year", ylab = "Biomass (mt)",
     ylim = ylim,
     pch = 16
)
lines(model_year, ss_case0$timeseries[, "mu", "B"])
legend("bottomright",
       c("EWE", "JABBA"),
       bty="n",
       pch=c(16, NA),
       lty=c(NA, 1))

ylim <- range(biomass_ewe[time_id], ss_case0$timeseries[, , "B"])
plot(c(model_year, projection_year),
  biomass_ewe[time_id],
  xlab = "Year", ylab = "Biomass (mt)",
  ylim = ylim,
  pch = 16
)

lines(model_year, ss_case0$timeseries[, "mu", "B"])
lines(model_year, ss_case0$timeseries[, "lci", "B"], lty = 2)
lines(model_year, ss_case0$timeseries[, "uci", "B"], lty = 2)

for (i in 1:length(projection_year)) {
  subdata_id <- (ss_case0$prj_posterior$year == projection_year[i]) & (ss_case0$prj_posterior$tac %in% catch_last)

  boxplot(ss_case0$prj_posterior$biomass[subdata_id],
          add = TRUE,
          at = projection_year[i],
          col = "grey",
          width = 1,
          outline = TRUE,
          axes = FALSE
  )
}




# mortality
mortality <- read_ewe_output(
  file_path = here::here("data", "ewe", "7ages", "ecosim_with_environmental_driver", "amo_pcp"),
  file_names = "mortality_monthly.csv",
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = functional_groups,
  figure_colors = NULL
)
mortality_ewe <- apply(biomass[[1]][, age_name], 1, max)

par(mfrow=c(1,1), mar=c(4,4,1,4))
plot(c(model_year, projection_year),
     mortality_ewe[time_id],
     xlab = "Year", ylab = "EwE Mortality",
     pch = 16, lty=1, type="o"
)
par(new = TRUE)
plot(model_year, ss_case0$timeseries[, "mu", "F"],
     type = "l", axes = FALSE, lty=2,
     bty = "n", xlab = "", ylab = "")
axis(side=4, at = pretty(range(ss_case0$timeseries[, "mu", "F"])))
mtext("JABBA F", side=4, line=2)
legend("topright",
       c("EWE", "JABBA"),
       bty="n",
       pch=c(16, NA),
       lty=c(1, 2))

