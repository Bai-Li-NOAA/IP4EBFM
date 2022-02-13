devtools::load_all()
# Set working path and load Atlantic menhaden BAM stock assessment --------
project_path <- here::here()
working_dir <- file.path(project_path, "data", "ewe")
sa_path <- file.path(project_path, "data", "AtlanticMenhadenSA")
sa_data <- dget(file.path(sa_path, "am019.rdat"))

static_year <- 1985
full_ages <- 0:6
restructure_ages <- 1:6
group_name <- c(
  "StripedBass0",
  "StripedBass2_5",
  "StripedBass6+",
  "AtlanticMenhaden0",
  "AtlanticMenhaden1",
  "AtlanticMenhaden2",
  "AtlanticMenhaden3",
  "AtlanticMenhaden4",
  "AtlanticMenhaden5",
  "AtlanticMenhaden6+",
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

age_groups <- list(
  group1 = as.character(c(1:2)),
  group2 = as.character(c(3:6))
)

staticB <- sa_data$B.mdyr.age[as.character(static_year), ] / 1000 # mt
staticL <- sa_data$L.age.pred.mt[as.character(static_year), ] / 1000

staticZ <- sa_data$Z.age[as.character(static_year), ]
staticM <- sa_data$M.age[as.character(static_year), ]
staticF <- sa_data$F.age[as.character(static_year), ]
round(staticZ, digits = 4) == round(staticM + staticF, digits = 4)

sim_years <- 1985:2017
# Update Ecopath basic input: total mortality and leading biomass --------

# Check if menhaden BAM 1+ biomass equals to EwE adult biomass
testthat::expect_equal(
  object = sum(staticB[as.character(restructure_ages)]),
  expected = 1.704,
  tolerance = 0.001
)

staticB
staticZ
staticM

# Reproduce EwE adult total mortality
testthat::expect_equal(
  object = weighted.mean(sa_data$a.series$M[2:7], sa_data$N.age.mdyr["1985",2:7]) + sum(sa_data$L.age.pred.mt["1985", 2:7])/sum(sa_data$B.mdyr.age["1985", 2:7]),
  expected = 1.454,
  tolerance = 0.001
)

updateZ <- sa_data$a.series$M + sa_data$L.age.pred.mt["1985", ]/sa_data$B.mdyr.age["1985", ]
# Update relative biomass accumulation rate BA/B: (B1986-B1985)/B1986?
# Biomass in the beginning of the year
(sa_data$t.series$B[sa_data$t.series$year == 1986] - sa_data$t.series$B[sa_data$t.series$year == 1985]) / sa_data$t.series$B[sa_data$t.series$year == 1986] #-0.2071214

# Biomass in the middle of the year
(sum(sa_data$B.mdyr.age["1986", ]) -  sum(sa_data$B.mdyr.age["1985", ])) / sum(sa_data$B.mdyr.age["1986", ]) #-0.08145015

(sum(sa_data$B.mdyr.age["1986", ]) /  sum(sa_data$B.mdyr.age["1985", ])) -1

# Update Ecopath diet composition -------------------------------------------------
# diet composition data from https://hjort.cbl.umces.edu/NWACS/TS_694_17_NWACS_Model_Documentation.pdf: menhaden groups include small (0), medium (1-2), and large groups (3+)
# Here data from medium and large groups are used to calculate diet composition ratio
diet_groups <- rbind(
  c(0.0199, 0.078, 0.1288, 0, 0, 0, 0, 0, 0, 0, 0.0024, 0, 0.0497 + 0.0394, 0, 0.0102 + 0.0302, 0, 0, 0, 0, 0),
  c(0, 0.001, 0.0991, 0, 0, 0, 0, 0, 0, 0, 0.0012, 0, 0.0099, 0, 0.001, 0, 0, 0, 0, 0)
)
colnames(diet_groups) <- group_name[1:ncol(diet_groups)]
rownames(diet_groups) <- paste0("group", 1:nrow(diet_groups))

diet_total <- rbind(c(0.0199, 0.079, 0.228, 0, 0, 0, 0, 0, 0, 0, 0.00201, 0, 0.0495, 0, 0.0178, 0, 0, 0, 0, 0))
colnames(diet_total) <- group_name[1:ncol(diet_total)]

colnames(diet_total)[which(apply(diet_groups, 2, sum) != diet_total)]

# diet_ratio <- diet_groups
diet_ratio <- sapply(1:nrow(diet_groups), function(x) {
  diet_groups[x, ] / colSums(diet_groups)
})
colnames(diet_ratio) <- paste0("group", 1:ncol(diet_ratio))

# reallocate diet composition for species ages 1-6+ using species biomass information

diet_comp <- matrix(NA, nrow = length(restructure_ages), ncol = ncol(diet_total))
for (i in 1:length(age_groups)) {
  for (j in 1:length(age_groups[[i]])) {
    age_id <- age_groups[[i]][j]
    diet_comp[as.numeric(age_id), ] <- staticM[age_id] / sum(staticM[age_groups[[i]]]) * diet_total * diet_ratio[, i]
  }
}

round(apply(diet_comp, 2, sum), digits = 4) == round(diet_total, digits = 4)
write.csv(diet_comp, file = file.path(working_dir, "7ages",  "updated_diet_comp.csv"))

zooplankton <- c(0.1800 * 3, 0.22 * 3) # Medium and Large
phytoplankton <- c(0.221 + 0.018, 0.1630 + 0.0140) # Medium and Large
detritus <- c(0.2210, 0.1630) # Medium and Large

# phytoplankton_vec <- 0.223 * phytoplankton/sum(phytoplankton)
# zooplankton_vec <- 0.57 * zooplankton/sum(zooplankton)
# detritus_vec <- 0.206 *detritus/sum(detritus)

# Update Ecopath fishery: landings ------------------------------------------------
testthat::expect_equal(
  object = sum(staticL[as.character(restructure_ages)]),
  expected = 0.329,
  tolerance = 0.001
)

staticL

# Update Ecosim vulnerabilities --------------------------------------------------

predationM <- read.csv(file.path(working_dir, "7ages", "ecopath_output", "NWACS AM 7ages-Predation mortality rates.csv"))
species_predationM <- predationM[5:10, 3:ncol(predationM)]
species_predationM[is.na(species_predationM)] <- 0

predationM_ratio <- sapply(1:nrow(species_predationM), function(x) {
  as.numeric(species_predationM[x, ] / colSums(species_predationM))
})

vul_total <- c(1797.56, 1.02, 280.35, 0, 0, 0, 0, 0, 0, 0, 2, 0, 62.99, 0, 2522.68, 0, 0, 0, 0, 0, 0)

vul_comp <- matrix(NA, nrow = length(restructure_ages), ncol = length(vul_total))

for (i in 1:nrow(vul_comp)) {
  vul_comp[i, ] <- predationM_ratio[, i] * vul_total
}

vul_comp[, which(vul_total <= 2 & vul_total != 0)] <- matrix(rep(vul_total[which(vul_total <= 2 & vul_total != 0)], each = length(restructure_ages)), nrow = length(restructure_ages), byrow = FALSE)
vul_comp

round(apply(vul_comp, 2, sum, na.rm = T), digits = 4) == round(vul_total, digits = 4)
write.csv(vul_comp, file = file.path(working_dir, "7ages", "updated_vul_comp.csv"))


# Update Ecosim time series -----------------------------------------------
ALK <- function(length, mean_length, cv) {
  # Author: Christine Stawitz from https://github.com/nmfs-fish-tools/spatial_workshop/blob/main/growth_functions.r
  # Find the indices of the mean length the observed length is between
  indices <- max(which(length > mean_length), 1)
  indices <- c(indices, indices + 1)
  # Find the sd
  sd_ages <- cv * mean_length
  # Evaluate cumulative normal distribution at each mean
  p <- lapply(indices, function(x) pnorm((length - mean_length[x]) / sd_ages[x], 0, 1))
  return(indices[which.max(unlist(p))])
}

# load time series data
annualI <- scan(file.path(working_dir, "1age", "ecosim_input", "NWACS MICE 5 v2-1-6-Time series grid.csv"), what = "", sep = "\n")
col_names <- read.table(text = as.character(annualI[3]), sep = ",")
annualI <- annualI[-c(1:8)]
annualI <- read.table(
  text = as.character(annualI),
  sep = ","
)
colnames(annualI) <- col_names

1 / mean(sa_data$t.series$cv.U.mad[sa_data$t.series$year %in% sim_years])
1 / mean(sa_data$t.series$cv.U.nad[sa_data$t.series$year %in% sim_years], na.rm = T)

# MAD survey
age_match <- unlist(lapply(
  as.numeric(colnames(sa_data$comp.mats$lcomp.mad.ob)),
  ALK,
  mean_length = sa_data$a.series$length,
  cv = mean(sa_data$a.series$length.cv.mad)
))

mad_lcomp <- sa_data$comp.mats$lcomp.mad.ob
colnames(mad_lcomp) <- age_match - 1
mad_acomp <- t(rowsum(t(mad_lcomp), group = colnames(mad_lcomp), na.rm = T))

for (i in 1:nrow(mad_acomp)) {
  mad_acomp[i, ] <- mad_acomp[i, ] * sa_data$t.series$U.mad.ob[sa_data$t.series$year %in% rownames(mad_acomp)[i]]
}
rownames(mad_acomp) <- rownames(sa_data$comp.mats$lcomp.mad.ob)

apply(mad_acomp, 1, sum)
sa_data$t.series$U.mad.ob[sa_data$t.series$year %in% rownames(mad_acomp)]

write.csv(mad_acomp, file = file.path(working_dir, "7ages", "updated_madacomp.csv"))

# NAD survey
age_match <- unlist(lapply(
  as.numeric(colnames(sa_data$comp.mats$lcomp.nad.ob)),
  ALK,
  mean_length = sa_data$a.series$length,
  cv = mean(sa_data$a.series$length.cv.nad)
))

nad_lcomp <- sa_data$comp.mats$lcomp.nad.ob
colnames(nad_lcomp) <- age_match - 1
nad_acomp <- t(rowsum(t(nad_lcomp), group = colnames(nad_lcomp), na.rm = T))

for (i in 1:nrow(nad_acomp)) {
  nad_acomp[i, ] <- nad_acomp[i, ] * sa_data$t.series$U.nad.ob[sa_data$t.series$year %in% rownames(nad_acomp)[i]]
}

rownames(nad_acomp) <- rownames(sa_data$comp.mats$lcomp.nad.ob)

apply(nad_acomp, 1, sum)
sa_data$t.series$U.nad.ob[sa_data$t.series$year %in% rownames(nad_acomp)]

write.csv(nad_acomp, file = file.path(working_dir, "7ages", "updated_nadacomp.csv"))

# fishing mortality at age
faa <- sa_data$F.age[as.character(sim_years), ]
write.csv(faa, file = file.path(working_dir, "7ages", "updated_faa.csv"))

# catch at age
caa <- sa_data$L.age.pred.mt[as.character(sim_years), ] / 1000
write.csv(caa, file = file.path(working_dir, "7ages", "updated_caa.csv"))

# Update Ecosim fishing mortality -----------------------------------------

# load annual fishing mortality data
annualF <- scan(file.path(working_dir, "7ages", "ecosim_input", "NWACS AM 7ages-Fishing mortality functions grid.csv"), what = "", sep = "\n")
annualF <- annualF[-c(1:3)]
annualF <- read.table(
  text = as.character(annualF),
  sep = ","
)
annualF <- annualF[, -1]
annualF <- annualF[ , colSums(is.na(annualF)) < nrow(annualF)]
annualF <- annualF[rowSums(is.na(annualF)) < ncol(annualF), ]
colnames(annualF) <- c(group_name)

# use estimated fishing mortality from BAM
for (i in 1:6) {
  annualF[, i + 4] <- rep(sa_data$F.age[as.character(sim_years), i + 1], each = 12)
}

write.csv(annualF, file = file.path(working_dir, "7ages", "updated_f.csv"))

# use Catch/Biomass for fishing mortality inputs
scaleF <- annualF

for (i in 1:6) {
  scaleF[, i + 4] <- rep(sa_data$L.age.pred.mt[as.character(sim_years), i + 1]/sa_data$B.mdyr.age[as.character(sim_years), i + 1], each = 12)
}
write.csv(scaleF, file = file.path(working_dir, "7ages", "updated_scalef.csv"))

scaleF_unique <- sa_data$L.age.pred.mt[as.character(sim_years), ]/sa_data$B.mdyr.age[as.character(sim_years), ]
write.csv(scaleF_unique, file = file.path(working_dir, "7ages", "updated_scalef_unique.csv"))

# Update Ecosim AM rec dev forcing ----------------------------------------
rec_dev <- rep(exp(sa_data$t.series$logR.dev[sa_data$t.series$year %in% sim_years]), each = 12)
write.csv(rec_dev, file = file.path(working_dir, "7ages", "updated_AMrecdev.csv"))

