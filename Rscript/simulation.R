devtools::load_all()
library(here)
set.seed(999)

# specify working directories ---------------------------------------------

project_path <- here::here()
ewe_output_path <- file.path(project_path, "data", "ewe_output")
menhadenSA_output_path <- file.path(project_path, "data", "AtlanticMenhadenSA")

# read Atlantic menhaden Beaufort Assessment Model output data --------

menhadenSA_output <- dget(file.path(menhadenSA_output_path, "am019.rdat"))

# functional groups information -------------------------------------------
# Get information from the Ecopath basic input table
group_name <- c(
  "StripedBass0",
  "StripedBass2_5",
  "StripedBass6+",
  "AtlanticMenhadenJuvenile",
  "AtlanticMenhadenAdult",
  "SpinyDogfish",
  "BluefishJuvenile",
  "BluefishAdult",
  "WeakfishJuvenile",
  "WeakfishAdult",
  "AtlanticHerring0_1",
  "AtlanticHerring2+",
  "Anchovies",
  "Benthos",
  "Zooplankton",
  "Phytoplankton",
  "Detritus"
)

functional_groups <- data.frame(
  group_name = group_name,
  ewe_code = paste0("X", 1:length(group_name)),
  ewe_name = c(
    "striped bass 0",
    "striped bass 2-5",
    "striped bass 6+",
    "menhaden juv",
    "menhaden adult",
    "spiny dogfish",
    "bluefish juv",
    "bluefish adult",
    "weakfish juv",
    "weakfish adult",
    "Atlantic herring 0-1",
    "Atlantic herring 2+",
    "anchovies",
    "benthos",
    "zooplankton",
    "phytoplankton",
    "Detritus"
  )
)

menhaden_juvenile_code <- functional_groups$ewe_code[functional_groups$group_name == "AtlanticMenhadenJuvenile"]

menhaden_adult_code <- functional_groups$ewe_code[functional_groups$group_name == "AtlanticMenhadenAdult"]

# generate true total landings and landings age composition data using EwE and BAM output data  --------------------------------------
# read annual landings

annual_landings <- read_ewe_output(
  file_path = here::here("data", "ewe_output"),
  file_names = "catch_annual.csv",
  skip_nrows = 8,
  plot = FALSE,
  functional_groups = functional_groups$group_name
)[[1]]

ewe_years <- annual_landings$Year
menhaden_juvenile_landings <- annual_landings[, "AtlanticMenhadenJuvenile"] * 1000 # in 1000s mt
menhaden_adult_landings <- annual_landings[, "AtlanticMenhadenAdult"] * 1000 # in 1000s mt
menhaden_total_landings <- menhaden_juvenile_landings + menhaden_adult_landings

# plot observed total catch of menhaden from BAM assessment v.s. menhaden adult catch from EwE
sa_year_id <- which(menhadenSA_output$t.series$year %in% ewe_years)

# BAM assessment includes landings from commercial reduction fishery-north (cRn), commercial reduction fishery-south (cRs), commercial bait fishery-north (cBn), and commercial bait fishery-south (cBs), the age composition data follow dirichlet-multinomial overdispersion parameter (log space)

# generate true landings age composition data
model_ages <- as.character(0:6)
adult_ages <- as.character(1:6)
sa_Lagecomp_probs <- menhadenSA_output$L.age.pred.mt[sa_year_id, adult_ages] / sum(menhadenSA_output$L.age.pred.mt[sa_year_id, adult_ages])

# Lagecomp_dirichletMultinomial <- MGLM::rdirmn(
#   n = length(ewe_years),
#   size = menhaden_adult_landings,
#   alpha = sa_Lagecomp_probs
# ) # Many 0s

Lagecomp_true <- matrix(NA, nrow = length(ewe_years), ncol = length(model_ages))
colnames(Lagecomp_true) <- model_ages

Lagecomp_probs_true <- matrix(NA, nrow = length(ewe_years), ncol = length(model_ages))
colnames(Lagecomp_probs_true) <- model_ages

Lagecomp_true[, 1] <- menhaden_juvenile_landings
for (i in 1:nrow(Lagecomp_true)) {
  Lagecomp_true[i, adult_ages] <- rmultinom(
    n = 1,
    size = menhaden_adult_landings[i],
    prob = sa_Lagecomp_probs[i, ]
  )

  Lagecomp_probs_true[i, ] <- Lagecomp_true[i, ] / sum(Lagecomp_true[i, ])
}

# generate observed total landings and landings age composition data  --------

# observed landings
sa_fishery <- grep("^cv.L.", names(menhadenSA_output$t.series))
fishery_name <- gsub("cv.L.", "", x=names(menhadenSA_output$t.series)[sa_fishery])

sa_cvL <- as.data.frame(matrix(NA, ncol=length(fishery_name), nrow=length(ewe_years)))
names(sa_cvL) <- paste0(fishery_name, "_CV")

for (i in 1:length(fishery_name)){
  sa_cvL[, paste0(fishery_name[i], "_CV")] <- menhadenSA_output$t.series[sa_year_id, paste0("cv.L.", fishery_name[[i]])]
}

cvL <- apply(sa_cvL, 1, mean) #0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.070 0.045 0.045 0.045 0.045 0.045
L_obs <- c()
for(i in 1:length(ewe_years)){

  sdL <- sqrt(log(1+cvL[i]^2)) #SD in log space, given CV in arithmetic space
  lnL <- rnorm(1, mean=0, sd=sdL) #log error
  L_obs[i] <- menhaden_total_landings[i]*exp(lnL) #multiplicative lognormal error

}

# make comparison figures
par(mfrow=c(1,1))
yrange <- range(menhaden_total_landings, menhadenSA_output$t.series$total.L.mt[sa_year_id], L_obs)
plot(annual_landings$Year, menhaden_total_landings,
     xlab = "Years", ylab = "Landings (mt)",
     type = "l", lty = 1
)
lines(menhadenSA_output$t.series$year[sa_year_id], menhadenSA_output$t.series$total.L.mt[sa_year_id], lty = 2)
lines(annual_landings$Year, L_obs, lty = 3)

legend("topright",
       c("EwE_true", "BAM", "EwE_obs_err"),
       lty = c(1, 2, 3),
       bty = "n"
)

# sampling of age composition
nsampleL <- rep(200, nrow(Lagecomp_true))

Lagecomp_obs <- matrix(NA, nrow = length(ewe_years), ncol = length(model_ages))
colnames(Lagecomp_obs) <- model_ages

for (i in 1:nrow(Lagecomp_true)){
  if(sum(Lagecomp_true[i,])==0) {
    probs <- rep(0, length(Lagecomp_true[i,]))
    Lagecomp_obs[i,] <- rep(0, length(Lagecomp_true[i,]))
  } else {
    probs <- Lagecomp_true[i,]/sum(Lagecomp_true[i,])
    Lagecomp_obs[i,] <- rmultinom(n=1, size=nsampleL[i], prob=probs)/nsampleL[i]
  }
}

par(mfrow = c(3, 3))
for (i in 1:nrow(Lagecomp_true)) {
  yrange <- range(Lagecomp_true[i, ], menhadenSA_output$L.age.pred.mt[sa_year_id[i], ])
  plot(model_ages, Lagecomp_true[i, ],
       ylim = yrange,
       type = "l",
       ylab = "Age comp", xlab = "Ages"
  )
  points(model_ages, menhadenSA_output$L.age.pred.mt[sa_year_id[i], ])
  par(new = TRUE)
  plot(model_ages, Lagecomp_obs[i, ],
       xlab = "", ylab = "",
       type="l", lty=2, axes=F,
       col="blue")
  axis(side = 4, at = pretty(range(Lagecomp_obs[i, ])), col="blue")
  legend("topright",
         c("EwE_true", "BAM", "EwE_obs_err"),
         title = ewe_years[i],
         lty = c(1, NA, 2),
         pch = c(NA, 1, NA),
         bty = "n",
         cex = 0.8,
         col = c("black", "black", "blue")
  )
}

# generate true survey indices and length composition data --------
# read annual biomass
annual_biomass <- read_ewe_output(
  file_path = here::here("data", "ewe_output"),
  file_names = "biomass_annual.csv",
  skip_nrows = 8,
  plot = FALSE,
  functional_groups = functional_groups$group_name
)[[1]]

species_juvenile_biomass <- annual_biomass[, "AtlanticMenhadenJuvenile"] * 1000 # in mt
species_adult_biomass <- annual_biomass[, "AtlanticMenhadenAdult"] * 1000 # in mt
species_total_biomass <- species_juvenile_biomass + species_adult_biomass

sa_Bagecomp_probs <- menhadenSA_output$B.age[sa_year_id, adult_ages] / sum(menhadenSA_output$B.age[sa_year_id, adult_ages])

Bagecomp_true <- matrix(NA, nrow = length(ewe_years), ncol = length(model_ages))
colnames(Bagecomp_true) <- model_ages

Bagecomp_probs_true <- matrix(NA, nrow = length(ewe_years), ncol = length(model_ages))
colnames(Bagecomp_probs_true) <- model_ages

Bagecomp_true[, 1] <- species_juvenile_biomass
for (i in 1:nrow(Bagecomp_true)) {
  Bagecomp_true[i, adult_ages] <- rmultinom(
    n = 1,
    size = species_adult_biomass[i],
    prob = sa_Bagecomp_probs[i, ]
  )

  Bagecomp_probs_true[i, ] <- Bagecomp_true[i, ] / sum(Bagecomp_true[i, ])
}



# generate observed survey indices and length composition data ------------

# BAM data
sa_survey <- grep("^cv.U.", names(menhadenSA_output$t.series))
survey_name <- gsub("cv.U.", "", x=names(menhadenSA_output$t.series)[sa_survey])
# Issue: could not find selectivity information for survey sad and jai, so only create two surveys in this study? nad and mad?
survey_name <- c("nad", "mad")

# catchability
q_survey <- vector(mode="list", length=length(survey_name))
names(q_survey) <- survey_name
for(i in 1:length(survey_name)){
  q_survey[[survey_name[i]]]<- matrix(menhadenSA_output$t.series[sa_year_id, paste0("q.", survey_name[i])], nrow=length(ewe_years), ncol=length(model_ages), byrow=FALSE)

}

# selectivity
sel_survey <- vector(mode="list", length=length(survey_name))
names(sel_survey) <- survey_name
for(i in 1:length(survey_name)){
  temp <- matrix(NA, nrow = length(ewe_years), ncol=length(model_ages))

  condition <- which(ewe_years %in% as.numeric(row.names(menhadenSA_output$sel.age[[paste0("sel.m.", survey_name[i])]])))

  temp[condition, ] <- menhadenSA_output$sel.age[[paste0("sel.m.", survey_name[i])]]
  sel_survey[[survey_name[i]]] <- temp

}

# weight-at-age
waa_survey <- vector(mode="list", length=length(survey_name))
names(waa_survey) <- survey_name
for(i in 1:length(survey_name)){
  waa_survey[[survey_name[i]]]<- matrix(menhadenSA_output$a.series$weight.spawn, nrow=length(ewe_years), ncol=length(model_ages), byrow=TRUE)

}

# biomass-at-age
baa_survey <- vector(mode="list", length=length(survey_name))
names(baa_survey) <- survey_name
for(i in 1:length(survey_name)){
  baa_survey[[survey_name[i]]]<- menhadenSA_output$B.age[sa_year_id, ]
}

# true survey indices using ewe and bam
survey_indices_agecomp_true <- vector(mode="list", length=length(survey_name))
names(survey_indices_agecomp_true) <- survey_name

survey_indices_true <- vector(mode="list", length=length(survey_name))
names(survey_indices_true) <- survey_name

for (i in 1:length(survey_name)){
  survey_indices_agecomp_true[[survey_name[i]]] <- Bagecomp_true * sel_survey[[survey_name[i]]] * waa_survey[[survey_name[i]]] * q_survey[[survey_name[i]]]
  survey_indices_true[[survey_name[i]]] <- apply(survey_indices_agecomp_true[[survey_name[i]]], 1, sum)
}

# observed survey indices

sa_cvU <- as.data.frame(matrix(NA, ncol=length(survey_name), nrow=length(ewe_years)))
names(sa_cvU) <- survey_name
for (i in 1:length(survey_name)){
  sa_cvU[, survey_name[i]] <- menhadenSA_output$t.series[sa_year_id, paste0("cv.U.", survey_name[[i]])]
}

U_obs <- c()

for(i in 1:length(ewe_years)){

  sdU <- sqrt(log(1+sa_cvU [i, 1]^2)) #SD in log space, given CV in arithmetic space
  lnU <- rnorm(1, mean=0, sd=sdU) #log error
  U_obs[i] <- survey_indices_true[[1]][i]*exp(lnU) #multiplicative lognormal error

}
