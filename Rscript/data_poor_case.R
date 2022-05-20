devtools::load_all()

# Install required R packages -------------------------------------
required_pkg <- c("DLMtool", "here", "ggplot2", "reshape2") ## DLMtool: version 6.0.3

pkg_to_install <- required_pkg[!(required_pkg %in%
                                   installed.packages()[, "Package"])]
if (length(pkg_to_install)) install.packages(pkg_to_install)

lapply(required_pkg, library, character.only = TRUE)

# Load simulated input data
source(here::here("Rscript", "simulation.R"))
source(here::here("Rscript", "load_indices.R"))

# Load EwE biomass----------------------------
model_year <- 1985:2012
projection_year <- 2013:2017

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

biomass <- read_ewe_output(
  file_path = here::here("data", "ewe", "7ages", "ecosim_with_environmental_driver", "amo_pcp"),
  file_names = "biomass_monthly.csv",
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = functional_groups,
  figure_colors = NULL
)

time_id <- seq(1, nrow(biomass[[1]]), by = 12)[1:length(model_year)]
biomass_ewe <- apply(biomass[[1]][, age_name], 1, sum)[time_id] * 1000000


# Case 0.1: default stock assessment run ----------------------------
sensitivity_run <- FALSE
sensitivity_plot <- FALSE
## DB-SRA is a method designed for determining a catch limit
## and management reference points for data-limited fisheries
## where catches are known from the beginning of exploitation.
## However, the catch data from the menhaden-like species case is not
## from the beginning of the exploitation.

# Populate the input data object

# Create a blank DLM object
ss_case0 <- new("Data")
# Change default area from 2 to 1
ss_case0@nareas <- 1
# Name of the case
ss_case0@Name <- "case0"
# Catch data
data_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% model_year
ss_case0@Cat <- matrix(sa_data$fishery$obs_total_catch_biomass$fleet1[data_id],
                       nrow = 1
)
# State units of catch
ss_case0@Units <- sa_data$fishery$units_info$units_biomass
# Years
ss_case0@Year <- model_year
# Depletion relative to unfished
# Use Catch 2015/Catch1985 will cause
ss_case0@Dep <- tail(ss_case0@Cat[1, ], n = 1) / ss_case0@Cat[1, 1] # 0.27

# VB maximum growth rate
ss_case0@vbK <- sa_data$biodata$k
# VB theoretical age at zero length
# default from EwE: -0.1
# https://www.researchgate.net/publication/267193103_Ecopath_with_Ecosim_A_User's_Guide#pf66
ss_case0@vbt0 <- sa_data$biodata$t0
# VB maximum length
# ss_case0@vbLinf <- (sa_data$biodata$winf * 1000 / sa_data$biodata$lw_a)^(1 / sa_data$biodata$lw_b)
ss_case0@vbLinf <- 500 # mm from FishBase
# Ratio of FMSY/M
# Q: Is it possible to find the ratio of FMSY to M
# for pelagic species in the Northwestern Atlantic Ocean?
# EwE FMSY values
fmsy <- c(
  0.092402786, 0.344614655, 1.101458788, 0.722086847,
  1.569404483, 0.988227546, 0.72328496
)

fmsy_m <- fmsy / sa_data$biodata$natural_mortality_matrix[1, ]

ss_case0@FMSY_M <- mean(fmsy_m) # 0.92

#ss_case0@Mort <- 0.67 #sa_data$biodata$natural_mortality_matrix[1, ]/(1-exp(-ss_case0@vbK*(1:7-ss_case0@vbt0)))^(-3*0.305)

# BMSY relative to unfished
# Dick and MacCall (2011): use 0.4 if target biomass is 40% of unfished biomass
ss_case0@BMSY_B0 <- 0.3 # BAM FEC30% target

# Length at 50% maturity
age_maturity50 <- 2
ss_case0@L50 <- ss_case0@vbLinf *
  (1 - exp(-ss_case0@vbK *
             (age_maturity50 - ss_case0@vbt0)))

# Run DBSRA, DBSRA_40 and DBSRA4010
## DBSRA: Base Version. TAC is calculated assumed MSY harvest rate
## multiplied by the estimated current abundance (estimated B0 x Depletion)

## DBSRA_40: Same as the Base Version but assumes 40 percent current
## depletion (Bcurrent/B0 = 0.4), which is more or less the most
## optimistic state for a stock (i.e. very close to BMSY/B0 for many stocks).

## DBSRA4010: Base version paired with the 40-10 rule that linearly
## throttles back the TAC when depletion is below 0.4 down to zero at
## 10 percent of unfished biomass.

ss_case01 <- ss_case0
dbsra <- DLMtool::DBSRA(1, ss_case01, plot = TRUE)
# dbsra40 <- DLMtool::DBSRA_40(1, ss_case0, plot = TRUE)
# dbsra4010 <- DLMtool::DBSRA4010(1, ss_case0, plot = TRUE)

# Sensitivity runs
if (sensitivity_run) {
  altValue_list <- list(
    samples = 1:100,
    dep = seq(0.1, 0.9, by = 0.1),
    fmsy_m = c(0.1, 0.5, 1, 1.5, 2),
    bmsy_b0 = seq(0.1, 0.9, by = 0.1)
  )

  altValue_data <- do.call(expand.grid, altValue_list)
  altValue_data$dbsra_tac <-
    altValue_data$dbsra40_tac <-
    altValue_data$dbsra4010_tac <- NA

  id <- seq(1, nrow(altValue_data), by = 100)
  for (i in 1:length(id)) {
    ss_case <- ss_case0
    ss_case@Dep <- altValue_data$dep[id[i]]
    ss_case@FMSY_M <- altValue_data$fmsy_m[id[i]]
    ss_case@BMSY_B0 <- altValue_data$bmsy_b0[id[i]]

    altValue_data$dbsra_tac[id[i]:(id[i] + 99)] <- DBSRA(1, ss_case, plot = FALSE)@TAC
    altValue_data$dbsra40_tac[id[i]:(id[i] + 99)] <- DBSRA_40(1, ss_case, plot = FALSE)@TAC
    altValue_data$dbsra4010_tac[id[i]:(id[i] + 99)] <- DBSRA4010(1, ss_case, plot = FALSE)@TAC
  }
  save(altValue_data, file = here::here("Rscript", "data_poor_sensitivity_run.RData"))
} else {
  load(here::here("Rscript", "data_poor_sensitivity_run.RData"))
}

if (sensitivity_plot) {
  plot_dbsra <- ggplot(data = altValue_data, aes(x = dep, y = dbsra_tac, group = dep)) +
    geom_boxplot(aes(fill = dep)) +
    facet_grid(fmsy_m ~ bmsy_b0, labeller = label_both) +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45))
  plot_dbsra

  plot_dbsra40 <- ggplot(data = altValue_data, aes(x = dep, y = dbsra40_tac, group = dep)) +
    geom_boxplot(aes(fill = dep)) +
    facet_grid(fmsy_m ~ bmsy_b0, labeller = label_both) +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45))
  plot_dbsra40

  plot_dbsra4010 <- ggplot(data = altValue_data, aes(x = dep, y = dbsra4010_tac, group = dep)) +
    geom_boxplot(aes(fill = dep)) +
    facet_grid(fmsy_m ~ bmsy_b0, labeller = label_both) +
    theme_bw() +
    theme(axis.text.x = element_text(angle = 45))
  plot_dbsra4010
}


# Projection: case 0.1 --------------------------------------------------
projection_output1 <- list()
for (i in 1:length(projection_year)) {
  ss_case <- ss_case01
  year <- model_year[1]:(projection_year[i] - 1)
  data_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% year
  ss_case@Cat <- matrix(sa_data$fishery$obs_total_catch_biomass$fleet1[data_id],
                        nrow = 1
  )
  ss_case@Year <- year
  #ss_case@Dep <- tail(ss_case@Cat[1, ], n = 1) / ss_case@Cat[1, 1]
  ss_case@Dep <- ss_case01@Dep
  projection_output1[[i]] <- DLMtool::DBSRA_(
    x = 1,
    Data = ss_case,
    depo = NULL, # Optional fixed depletion (single value)
    hcr = NULL # Optional harvest control rule for throttling catch as a function of B/B0.
  )
}

# plot figures
par(mfrow=c(1,2))
ylim <- range(projection_output1[[1]]$C_hist, unlist(sapply(projection_output1, "[", "TAC")))
plot(c(model_year, projection_year),
     c(projection_output1[[1]]$C_hist, rep(NA, length(projection_year))),
     type = "l",
     ylim = ylim,
     xlab = "Year", ylab = "Catch (mt)"
)

for (i in 1:length(projection_year)) {
  boxplot(projection_output1[[i]]$TAC,
          add = TRUE,
          at = projection_year[i],
          col = "grey",
          width = 1,
          outline = TRUE,
          axes = FALSE
  )
}

catch_year <- projection_year[1:length(projection_year) - 1]
points(catch_year, sa_data$fishery$obs_total_catch_biomass$fleet1[names(sa_data$fishery$obs_total_catch_biomass$fleet1) %in% catch_year],
       pch = 16, col = "blue"
)

legend("top",
       c("Observed Catch", "Observed Catch for TAC estimates", "TAC"),
       lty = c(1, NA, NA),
       pch = c(NA, 16, NA),
       col = c("black", "blue", NA),
       fill = c(NA, NA, "gray"),
       border = c(NA, NA, "black"),
       bty = "n",
       title = "Case 0.1"
)

# plot biomass


dbsraB <- apply(projection_output1[[1]]$Btrend, 2, median)
ylim <- range(biomass_ewe, dbsraB)
plot(model_year,
     biomass_ewe,
     xlab = "Year", ylab = "Biomass (mt)",
     ylim = ylim,
     pch = 16
)
lines(model_year, dbsraB)
legend("bottomright",
       c("EWE", "DBSRA"),
       bty = "n",
       pch = c(16, NA),
       lty = c(NA, 1),
       title = "Case 0.1"
)

# Case 0.2 ---------------------------
ss_case02 <- ss_case0
ss_case02@Dep <- 0.9

msy <- c(
  5.783313499, 5.83166065, 4.462390283, 4.322232771, 3.622124216, 4.401786498, 3.455276984
)

b0 <- 2000000

bmsy <- c(
  1.170854865, 1.180642591, 0.90342859, 0.875053021, 0.733313468, 0.891159071, 0.699534845
)*1000000


# BMSY relative to unfished
# Dick and MacCall (2011): use 0.4 if target biomass is 40% of unfished biomass
ss_case02@BMSY_B0 <- mean(bmsy/b0)

dbsra <- DLMtool::DBSRA(1, ss_case02, plot = TRUE)

# Projection: case 0.2 --------------------------------------------------
projection_output2 <- list()
for (i in 1:length(projection_year)) {
  ss_case <- ss_case02
  year <- model_year[1]:(projection_year[i] - 1)
  data_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% year
  ss_case@Cat <- matrix(sa_data$fishery$obs_total_catch_biomass$fleet1[data_id],
                        nrow = 1
  )
  ss_case@Year <- year
  #ss_case@Dep <- tail(ss_case@Cat[1, ], n = 1) / ss_case@Cat[1, 1]
  ss_case@Dep <- ss_case02@Dep
  projection_output2[[i]] <- DLMtool::DBSRA_(
    x = 1,
    Data = ss_case,
    depo = NULL, # Optional fixed depletion (single value)
    hcr = NULL # Optional harvest control rule for throttling catch as a function of B/B0.
  )
}

# plot figures
par(mfrow=c(1,2))
ylim <- range(projection_output2[[1]]$C_hist, unlist(sapply(projection_output2, "[", "TAC")))
plot(c(model_year, projection_year),
     c(projection_output2[[1]]$C_hist, rep(NA, length(projection_year))),
     type = "l",
     ylim = ylim,
     xlab = "Year", ylab = "Catch (mt)"
)

for (i in 1:length(projection_year)) {
  boxplot(projection_output2[[i]]$TAC,
          add = TRUE,
          at = projection_year[i],
          col = "grey",
          width = 1,
          outline = TRUE,
          axes = FALSE
  )
}

catch_year <- projection_year[1:length(projection_year) - 1]
points(catch_year, sa_data$fishery$obs_total_catch_biomass$fleet1[names(sa_data$fishery$obs_total_catch_biomass$fleet1) %in% catch_year],
       pch = 16, col = "blue"
)

legend("top",
       c("Observed Catch", "Observed Catch for TAC estimates", "TAC"),
       lty = c(1, NA, NA),
       pch = c(NA, 16, NA),
       col = c("black", "blue", NA),
       fill = c(NA, NA, "gray"),
       border = c(NA, NA, "black"),
       bty = "n",
       title = "Case 0.2"
)

# plot biomass
dbsraB <- apply(projection_output2[[1]]$Btrend, 2, median)
ylim <- range(biomass_ewe, dbsraB)
plot(model_year,
     biomass_ewe,
     xlab = "Year", ylab = "Biomass (mt)",
     ylim = ylim,
     pch = 16
)
lines(model_year, dbsraB)
legend("bottomright",
       c("EWE", "DBSRA"),
       bty = "n",
       pch = c(16, NA),
       lty = c(NA, 1),
       title = "Case 0.2"
)


# Case 0.3: Equilibrium catch --------------------------------------
ss_case03 <- ss_case0
equi_year <- 2000:2012
equi_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% equi_year
equi_catch <- sa_data$fishery$obs_total_catch_biomass$fleet1[equi_id]
data_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% model_year
ss_case03@Cat <- matrix(c(equi_catch, sa_data$fishery$obs_total_catch_biomass$fleet1[data_id]),
                       nrow = 1
)


ss_case03@Year <- (model_year[1] - length(equi_year)):tail(model_year, n=1)
ss_case03@Dep <- tail(ss_case03@Cat[1, ], n = 1) / ss_case03@Cat[1, 1] # 0.91

dbsra <- DLMtool::DBSRA(1, ss_case03, plot = TRUE)


# Projection: case 0.3 --------------------------------------------------
projection_output3 <- list()
for (i in 1:length(projection_year)) {
  ss_case <- ss_case03

  equi_year <- 2000:2012
  equi_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% equi_year
  equi_catch <- sa_data$fishery$obs_total_catch_biomass$fleet1[equi_id]
  data_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% c(model_year[1]:(projection_year[i] - 1))

  ss_case@Cat <- matrix(c(equi_catch, sa_data$fishery$obs_total_catch_biomass$fleet1[data_id]),
                         nrow = 1
  )

  #ss_case@Dep <- tail(ss_case@Cat[1, ], n = 1) / ss_case@Cat[1, 1]
  ss_case@Dep <- ss_case03@Dep
  projection_output3[[i]] <- DLMtool::DBSRA_(
    x = 1,
    Data = ss_case,
    depo = NULL, # Optional fixed depletion (single value)
    hcr = NULL # Optional harvest control rule for throttling catch as a function of B/B0.
  )
}

# plot figures
par(mfrow=c(1,2))
ylim <- range(projection_output3[[1]]$C_hist, unlist(sapply(projection_output3, "[", "TAC")))
plot(c(ss_case@Year, projection_year),
     c(projection_output3[[1]]$C_hist, rep(NA, length(projection_year))),
     type = "l",
     ylim = ylim,
     xlab = "Year", ylab = "Catch (mt)"
)

for (i in 1:length(projection_year)) {
  boxplot(projection_output3[[i]]$TAC,
          add = TRUE,
          at = projection_year[i],
          col = "grey",
          width = 1,
          outline = TRUE,
          axes = FALSE
  )
}

catch_year <- projection_year[1:length(projection_year) - 1]
points(catch_year, sa_data$fishery$obs_total_catch_biomass$fleet1[names(sa_data$fishery$obs_total_catch_biomass$fleet1) %in% catch_year],
       pch = 16, col = "blue"
)

legend("top",
       c("Observed Catch", "Observed Catch for TAC estimates", "TAC"),
       lty = c(1, NA, NA),
       pch = c(NA, 16, NA),
       col = c("black", "blue", NA),
       fill = c(NA, NA, "gray"),
       border = c(NA, NA, "black"),
       bty = "n",
       title = "Case 0.3"
)

# plot biomass
dbsraB <- apply(projection_output3[[1]]$Btrend, 2, median)
ylim <- range(biomass_ewe, dbsraB)
plot(ss_case03@Year,
     c(rep(NA, length(equi_year)), biomass_ewe),
     xlab = "Year", ylab = "Biomass (mt)",
     ylim = ylim,
     pch = 16
)
lines(ss_case03@Year, dbsraB)
legend("bottomright",
       c("EWE", "DBSRA"),
       bty = "n",
       pch = c(16, NA),
       lty = c(NA, 1),
       title = "Case 0.3"
)


# case 0.4 --------------------------------------------------------

dep = seq(0.1, 0.9, by = 0.05)

# sum of squared differences
ssd <- data.frame(
  dep = dep,
  ssd = NA
)
for (i in 1:length(dep)){
  ss_case04 <- ss_case0
  ss_case04@Dep <- dep[i]
  dbsra <- DLMtool::DBSRA_(
    x = 1,
    Data = ss_case04,
    depo = NULL,
    hcr = NULL
  )
  dbsraB <- apply(dbsra$Btrend, 2, median)
  ssd$ssd[i] <- sum((dbsraB - biomass_ewe)^2)
}
# dep = 0.75 has the smallest sum of squared differences: 8334088125529
ss_case04 <- ss_case0
ss_case04@Dep <- 0.75
dbsra <- DLMtool::DBSRA_(
  x = 1,
  Data = ss_case04,
  depo = NULL,
  hcr = NULL
)
dbsraB_dep <- apply(dbsra$Btrend, 2, median)

bmsy_b0 <- seq(0.1, 0.9, by = 0.05)
# sum of squared differences
ssd <- data.frame(
  bmsy_b0 = bmsy_b0,
  ssd = NA
)
for (i in 1:length(bmsy_b0)){
  ss_case04 <- ss_case0
  ss_case04@Dep <- 0.75
  ss_case04@BMSY_B0 <- bmsy_b0[i]
  dbsra <- DLMtool::DBSRA_(
    x = 1,
    Data = ss_case04,
    depo = NULL,
    hcr = NULL
  )
  dbsraB <- apply(dbsra$Btrend, 2, median)
  ssd$ssd[i] <- sum((dbsraB - biomass_ewe)^2)
}
# bmsy_b0 = 0.3 has the smallest sum of squared differences: 9317919804101
ss_case04 <- ss_case0
ss_case04@Dep <- 0.75
ss_case04@BMSY_B0 <- 0.3
dbsra <- DLMtool::DBSRA_(
  x = 1,
  Data = ss_case04,
  depo = NULL,
  hcr = NULL
)
dbsraB_bmsyb0 <- apply(dbsra$Btrend, 2, median)


fmsy_m <- seq(0.1, 2, by = 0.05)
# sum of squared differences
ssd <- data.frame(
  fmsy_m = fmsy_m,
  ssd = NA
)
for (i in 1:length(fmsy_m)){
  ss_case04 <- ss_case0
  ss_case04@Dep <- 0.75
  ss_case04@BMSY_B0 <- 0.3
  ss_case04@FMSY_M <- fmsy_m[i]
  dbsra <- DLMtool::DBSRA_(
    x = 1,
    Data = ss_case04,
    depo = NULL,
    hcr = NULL
  )
  dbsraB <- apply(dbsra$Btrend, 2, median)
  ssd$ssd[i] <- sum((dbsraB - biomass_ewe)^2)
}
# fmsy_m = 1.05 has the smallest sum of squared differences: 7249794744635
ss_case04 <- ss_case0
ss_case04@Dep <- 0.75
ss_case04@BMSY_B0 <- 0.3
ss_case04@FMSY_M <- 1.05
dbsra <- DLMtool::DBSRA_(
  x = 1,
  Data = ss_case04,
  depo = NULL,
  hcr = NULL
)
dbsraB_fmsym <- apply(dbsra$Btrend, 2, median)

# Projection: case 0.4 --------------------------------------------------
projection_output4 <- list()
for (i in 1:length(projection_year)) {
  ss_case <- ss_case04
  year <- model_year[1]:(projection_year[i] - 1)
  data_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% year
  ss_case@Cat <- matrix(sa_data$fishery$obs_total_catch_biomass$fleet1[data_id],
                        nrow = 1
  )
  ss_case@Year <- year
  #ss_case@Dep <- tail(ss_case@Cat[1, ], n = 1) / ss_case@Cat[1, 1]
  ss_case@Dep <- ss_case04@Dep
  projection_output4[[i]] <- DLMtool::DBSRA_(
    x = 1,
    Data = ss_case,
    depo = NULL, # Optional fixed depletion (single value)
    hcr = NULL # Optional harvest control rule for throttling catch as a function of B/B0.
  )
}

# plot figures
par(mfrow=c(1,2))
ylim <- range(projection_output4[[1]]$C_hist, unlist(sapply(projection_output4, "[", "TAC")))
plot(c(model_year, projection_year),
     c(projection_output4[[1]]$C_hist, rep(NA, length(projection_year))),
     type = "l",
     ylim = ylim,
     xlab = "Year", ylab = "Catch (mt)"
)

for (i in 1:length(projection_year)) {
  boxplot(projection_output4[[i]]$TAC,
          add = TRUE,
          at = projection_year[i],
          col = "grey",
          width = 1,
          outline = TRUE,
          axes = FALSE
  )
}

catch_year <- projection_year[1:length(projection_year) - 1]
points(catch_year, sa_data$fishery$obs_total_catch_biomass$fleet1[names(sa_data$fishery$obs_total_catch_biomass$fleet1) %in% catch_year],
       pch = 16, col = "blue"
)

legend("top",
       c("Observed Catch", "Observed Catch for TAC estimates", "TAC"),
       lty = c(1, NA, NA),
       pch = c(NA, 16, NA),
       col = c("black", "blue", NA),
       fill = c(NA, NA, "gray"),
       border = c(NA, NA, "black"),
       bty = "n",
       title = "Case 0.4"
)

# plot biomass


dbsraB <- apply(projection_output4[[1]]$Btrend, 2, median)
ylim <- range(biomass_ewe, dbsraB)
plot(model_year,
     biomass_ewe,
     xlab = "Year", ylab = "Biomass (mt)",
     ylim = ylim,
     pch = 16
)
lines(model_year, dbsraB)
legend("bottomright",
       c("EWE", "DBSRA"),
       bty = "n",
       pch = c(16, NA),
       lty = c(NA, 1),
       title = "Case 0.4"
)



# Projection based on case 0.1 ------------------------------------

lm_slope <- data.frame(
  case = 0.1,
  projection_year = 1:length(projection_year),
  amo = NA,
  pcp = NA,
  bassB = NA,
  dollars = NA
)

for (projection_year_id in 1:length(projection_year)){
  projection_output <- projection_output1
  menhaden_b <- apply(projection_output[[projection_year_id]]$Btrend, 2, median)
  year_id <- seq(1, nrow(amo_unsmooth_lag1), by = 12)[1:(length(model_year)+projection_year_id-1)]

  if (projection_year_id == 1) {
    index_year = model_year
  } else {
    index_year <- c(model_year, projection_year[1:(projection_year_id-1)])
  }


  # Linear regression model -----------------------------------------

  amo <- amo_unsmooth_lag1[year_id, ]
  amo_lm <- lm(menhaden_b ~ amo$raw_value)
  summary(amo_lm)
  amo_fit <- fitted(amo_lm)
  lm_slope$amo[projection_year_id] <- paste0(
    round(summary(amo_lm)$coefficients[2, 1], digits = 2),
    if(summary(amo_lm)$coefficients[2, 4] <= 0.05) {"*"})

  pcp <- precipitation[year_id, ]
  pcp_lm <- lm(menhaden_b ~ pcp$raw_value)
  summary(pcp_lm)
  pcp_fit <- fitted(pcp_lm)
  lm_slope$pcp[projection_year_id] <- paste0(
    round(summary(pcp_lm)$coefficients[2, 1], digits = 2),
    if(summary(pcp_lm)$coefficients[2, 4] <= 0.05) {"*"})

  bassB <- bass_bio[bass_bio$Year %in% index_year, ]
  bassB_lm <- lm(menhaden_b ~ bassB$bass_bio)
  summary(bassB_lm)
  bassB_fit <- fitted(bassB_lm)
  lm_slope$bassB[projection_year_id] <- paste0(
    round(summary(bassB_lm)$coefficients[2, 1], digits = 2),
    if(summary(bassB_lm)$coefficients[2, 4] <= 0.05) {"*"})

  sub_menhaden_b <- menhaden_b[index_year %in% menhaden_dollars$Year]
  sub_menhadenD <- menhaden_dollars$Dollars[menhaden_dollars$Year %in% index_year]
  dollars_lm <- lm(sub_menhaden_b ~ sub_menhadenD)
  summary(dollars_lm)
  dollars_fit <- fitted(dollars_lm)
  lm_slope$dollars[projection_year_id] <- paste0(
    round(summary(dollars_lm)$coefficients[2, 1], digits = 2),
    if(summary(dollars_lm)$coefficients[2, 4] <= 0.05) {"*"})

  if (projection_year_id == length(projection_year)){

    par(mfrow = c(2, 2))

    plot(amo$raw_value, menhaden_b,
         xlab = "AMO raw values",
         ylab = "Biomass of menhaden-like species"
    )
    lines(amo$raw_value, amo_fit, lty = 2, col = "blue")

    plot(pcp$raw_value, menhaden_b,
         xlab = "Precipitation raw values",
         ylab = "Biomass of menhaden-like species"
    )
    lines(pcp$raw_value, pcp_fit, lty = 2, col = "blue")

    plot(bassB$bass_bio, menhaden_b,
         xlab = "Biomass of Striped bass",
         ylab = "Biomass of menhaden-like species"
    )
    lines(bassB$bass_bio, bassB_fit, lty = 2, col = "blue")

    plot(sub_menhadenD, sub_menhaden_b,
         xlab = "Menhaden dollars",
         ylab = "Biomass of menhaden-like species"
    )
    lines(sub_menhadenD, dollars_fit, lty = 2, col = "blue")

  }


  # status of indicators --------------------------------------------

  amo_soi <- calc_soi(
    indicator_data = amo$raw_value,
    slope = coef(amo_lm)[2]
  )

  pcp_soi <- calc_soi(
    indicator_data = pcp$raw_value,
    slope = coef(pcp_lm)[2]
  )

  bassB_soi <- calc_soi(
    indicator_data = bassB$bass_bio,
    slope = coef(bassB_lm)[2]
  )

  dollars_soi <- calc_soi(
    indicator_data = sub_menhadenD,
    slope = coef(dollars_lm)[2]
  )

  if (projection_year_id == 1) {
    scaled_data <- data.frame(
      year = model_year,
      projection_year_id = projection_year_id,
      amo = scale(amo$raw_value)[,1],
      pcp = scale(pcp$raw_value)[,1],
      bassB = scale(bassB$bass_bio)[,1],
      dollars = scale(sub_menhadenD)[,1],
      menhadenB = scale(menhaden_b)[,1]
    )

    soi_data <- data.frame(
      year = model_year,
      projection_year_id = projection_year_id,
      amo = amo_soi,
      pcp = pcp_soi,
      bass_b = bassB_soi,
      dollars = dollars_soi
    )
  } else{
    scaled_data <- rbind(
      scaled_data,
      data.frame(
        year = index_year,
        projection_year_id = projection_year_id,
        amo = scale(amo$raw_value)[,1],
        pcp = scale(pcp$raw_value)[,1],
        bassB = scale(bassB$bass_bio)[,1],
        dollars = scale(sub_menhadenD)[,1],
        menhadenB = scale(menhaden_b)[,1]
      )
    )

    soi_data <- rbind(
      soi_data,
      data.frame(
        year = index_year,
        projection_year_id = projection_year_id,
        amo = amo_soi,
        pcp = pcp_soi,
        bass_b = bassB_soi,
        dollars = dollars_soi
      )
    )
  }



  # Adjusted TAC ----------------------------------------------------

  Bt_BMSY <- projection_output[[projection_year_id]]$Bt_Kstore / projection_output[[projection_year_id]]$BMSY_K_Mstore

  amo_tac <- adjust_projection_dbsra(
    tac = projection_output[[projection_year_id]]$TAC,
    soi = tail(amo_soi, n = 1),
    Bt_BMSY = Bt_BMSY
  )
  pcp_tac <- adjust_projection_dbsra(
    tac = projection_output[[projection_year_id]]$TAC,
    soi = tail(pcp_soi, n = 1),
    Bt_BMSY = Bt_BMSY
  )
  bassB_tac <- adjust_projection_dbsra(
    tac = projection_output[[projection_year_id]]$TAC,
    soi = tail(bassB_soi, n = 1),
    Bt_BMSY = Bt_BMSY
  )
  dollars_tac <- adjust_projection_dbsra(
    tac = projection_output[[projection_year_id]]$TAC,
    soi = tail(dollars_soi, n = 1),
    Bt_BMSY = Bt_BMSY
  )

  if (projection_year_id == 1){
    tac_data <- data.frame(
      iter = 1:length(amo_tac),
      projection_year_id = projection_year_id,
      DBSRA = projection_output[[projection_year_id]]$TAC,
      amo = amo_tac,
      pcp = pcp_tac,
      bassB = bassB_tac,
      dollars = dollars_tac
    )
  } else {
    tac_data <- rbind(
      tac_data,
      data.frame(
        iter = 1:length(amo_tac),
        projection_year_id = projection_year_id,
        DBSRA = projection_output[[projection_year_id]]$TAC,
        amo = amo_tac,
        pcp = pcp_tac,
        bassB = bassB_tac,
        dollars = dollars_tac
      )
    )
  }
}

scaled_data_melt <- reshape2::melt(
  scaled_data,
  id = c("year", "projection_year_id")
)
scaled_data_melt$projection_year_id <- as.factor(scaled_data_melt$projection_year_id)


ggplot(scaled_data_melt, aes(x = year, y = value, color = projection_year_id)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  labs(
    title = "Scaled Indices",
    x = "Year",
    y = "Scaled Indices"
  ) +
  theme_bw()


soi_data_melt <- reshape2::melt(
  soi_data,
  id = c("year", "projection_year_id")
)
soi_data_melt$projection_year_id <- as.factor(soi_data_melt$projection_year_id)

ggplot(soi_data_melt, aes(x = year, y = value, color = projection_year_id)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  labs(
    title = "Status of Indicators",
    x = "Year",
    y = "Status of Indicators"
  ) +
  theme_bw()

tac_data_melt <- reshape2::melt(
  tac_data,
  id = c("iter", "projection_year_id")
)
tac_data_melt$projection_year_id <- as.factor(tac_data_melt$projection_year_id)

ggplot(tac_data_melt, aes(x = iter, y = value, color = projection_year_id)) +
  geom_line() +
  facet_wrap(~variable) +
  labs(
    title = "TAC",
    x = "Iteration",
    y = "TAC"
  ) +
  theme_bw()

ggplot(tac_data_melt, aes(x=variable, y = value, color = projection_year_id)) +
  geom_boxplot()+
  labs(
    title = "TAC",
    x = "",
    y = "TAC"
  ) +
  theme_bw()

knitr::kable(lm_slope)

# Projection based on case 0.4 ------------------------------------

lm_slope <- data.frame(
  case = 0.4,
  projection_year = 1:length(projection_year),
  amo = NA,
  pcp = NA,
  bassB = NA,
  dollars = NA
)

for (projection_year_id in 1:length(projection_year)){
  projection_output <- projection_output4
  menhaden_b <- apply(projection_output[[projection_year_id]]$Btrend, 2, median)
  year_id <- seq(1, nrow(amo_unsmooth_lag1), by = 12)[1:(length(model_year)+projection_year_id-1)]

  if (projection_year_id == 1) {
    index_year = model_year
  } else {
    index_year <- c(model_year, projection_year[1:(projection_year_id-1)])
  }


  # Linear regression model -----------------------------------------

  amo <- amo_unsmooth_lag1[year_id, ]
  amo_lm <- lm(menhaden_b ~ amo$raw_value)
  summary(amo_lm)
  amo_fit <- fitted(amo_lm)
  lm_slope$amo[projection_year_id] <- paste0(
    round(summary(amo_lm)$coefficients[2, 1], digits = 2),
    if(summary(amo_lm)$coefficients[2, 4] <= 0.05) {"*"})

  pcp <- precipitation[year_id, ]
  pcp_lm <- lm(menhaden_b ~ pcp$raw_value)
  summary(pcp_lm)
  pcp_fit <- fitted(pcp_lm)
  lm_slope$pcp[projection_year_id] <- paste0(
    round(summary(pcp_lm)$coefficients[2, 1], digits = 2),
    if(summary(pcp_lm)$coefficients[2, 4] <= 0.05) {"*"})

  bassB <- bass_bio[bass_bio$Year %in% index_year, ]
  bassB_lm <- lm(menhaden_b ~ bassB$bass_bio)
  summary(bassB_lm)
  bassB_fit <- fitted(bassB_lm)
  lm_slope$bassB[projection_year_id] <- paste0(
    round(summary(bassB_lm)$coefficients[2, 1], digits = 2),
    if(summary(bassB_lm)$coefficients[2, 4] <= 0.05) {"*"})

  sub_menhaden_b <- menhaden_b[index_year %in% menhaden_dollars$Year]
  sub_menhadenD <- menhaden_dollars$Dollars[menhaden_dollars$Year %in% index_year]
  dollars_lm <- lm(sub_menhaden_b ~ sub_menhadenD)
  summary(dollars_lm)
  dollars_fit <- fitted(dollars_lm)
  lm_slope$dollars[projection_year_id] <- paste0(
    round(summary(dollars_lm)$coefficients[2, 1], digits = 2),
    if(summary(dollars_lm)$coefficients[2, 4] <= 0.05) {"*"})



  if (projection_year_id == length(projection_year)){

    par(mfrow = c(2, 2))

    plot(amo$raw_value, menhaden_b,
         xlab = "AMO raw values",
         ylab = "Biomass of menhaden-like species"
    )
    lines(amo$raw_value, amo_fit, lty = 2, col = "blue")

    plot(pcp$raw_value, menhaden_b,
         xlab = "Precipitation raw values",
         ylab = "Biomass of menhaden-like species"
    )
    lines(pcp$raw_value, pcp_fit, lty = 2, col = "blue")

    plot(bassB$bass_bio, menhaden_b,
         xlab = "Biomass of Striped bass",
         ylab = "Biomass of menhaden-like species"
    )
    lines(bassB$bass_bio, bassB_fit, lty = 2, col = "blue")

    plot(sub_menhadenD, sub_menhaden_b,
         xlab = "Menhaden dollars",
         ylab = "Biomass of menhaden-like species"
    )
    lines(sub_menhadenD, dollars_fit, lty = 2, col = "blue")

  }

  # status of indicators --------------------------------------------

  amo_soi <- calc_soi(
    indicator_data = amo$raw_value,
    slope = coef(amo_lm)[2]
  )

  pcp_soi <- calc_soi(
    indicator_data = pcp$raw_value,
    slope = coef(pcp_lm)[2]
  )

  bassB_soi <- calc_soi(
    indicator_data = bassB$bass_bio,
    slope = coef(bassB_lm)[2]
  )

  dollars_soi <- calc_soi(
    indicator_data = sub_menhadenD,
    slope = coef(dollars_lm)[2]
  )

  if (projection_year_id == 1) {
    scaled_data <- data.frame(
      year = model_year,
      projection_year_id = projection_year_id,
      amo = scale(amo$raw_value)[,1],
      pcp = scale(pcp$raw_value)[,1],
      bassB = scale(bassB$bass_bio)[,1],
      dollars = scale(sub_menhadenD)[,1],
      menhadenB = scale(menhaden_b)[,1]
    )

    soi_data <- data.frame(
      year = model_year,
      projection_year_id = projection_year_id,
      amo = amo_soi,
      pcp = pcp_soi,
      bass_b = bassB_soi,
      dollars = dollars_soi
    )
  } else{
    scaled_data <- rbind(
      scaled_data,
      data.frame(
        year = index_year,
        projection_year_id = projection_year_id,
        amo = scale(amo$raw_value)[,1],
        pcp = scale(pcp$raw_value)[,1],
        bassB = scale(bassB$bass_bio)[,1],
        dollars = scale(sub_menhadenD)[,1],
        menhadenB = scale(menhaden_b)[,1]
      )
    )

    soi_data <- rbind(
      soi_data,
      data.frame(
        year = index_year,
        projection_year_id = projection_year_id,
        amo = amo_soi,
        pcp = pcp_soi,
        bass_b = bassB_soi,
        dollars = dollars_soi
      )
    )
  }



  # Adjusted TAC ----------------------------------------------------

  Bt_BMSY <- projection_output[[projection_year_id]]$Bt_Kstore / projection_output[[projection_year_id]]$BMSY_K_Mstore

  amo_tac <- adjust_projection_dbsra(
    tac = projection_output[[projection_year_id]]$TAC,
    soi = tail(amo_soi, n = 1),
    Bt_BMSY = Bt_BMSY
  )
  pcp_tac <- adjust_projection_dbsra(
    tac = projection_output[[projection_year_id]]$TAC,
    soi = tail(pcp_soi, n = 1),
    Bt_BMSY = Bt_BMSY
  )
  bassB_tac <- adjust_projection_dbsra(
    tac = projection_output[[projection_year_id]]$TAC,
    soi = tail(bassB_soi, n = 1),
    Bt_BMSY = Bt_BMSY
  )
  dollars_tac <- adjust_projection_dbsra(
    tac = projection_output[[projection_year_id]]$TAC,
    soi = tail(dollars_soi, n = 1),
    Bt_BMSY = Bt_BMSY
  )

  if (projection_year_id == 1){
    tac_data <- data.frame(
      iter = 1:length(amo_tac),
      projection_year_id = projection_year_id,
      DBSRA = projection_output[[projection_year_id]]$TAC,
      amo = amo_tac,
      pcp = pcp_tac,
      bassB = bassB_tac,
      dollars = dollars_tac
    )
  } else {
    tac_data <- rbind(
      tac_data,
      data.frame(
        iter = 1:length(amo_tac),
        projection_year_id = projection_year_id,
        DBSRA = projection_output[[projection_year_id]]$TAC,
        amo = amo_tac,
        pcp = pcp_tac,
        bassB = bassB_tac,
        dollars = dollars_tac
      )
    )
  }
}

scaled_data_melt <- reshape2::melt(
  scaled_data,
  id = c("year", "projection_year_id")
)
scaled_data_melt$projection_year_id <- as.factor(scaled_data_melt$projection_year_id)


ggplot(scaled_data_melt, aes(x = year, y = value, color = projection_year_id)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  labs(
    title = "Scaled Indices",
    x = "Year",
    y = "Scaled Indices"
  ) +
  theme_bw()


soi_data_melt <- reshape2::melt(
  soi_data,
  id = c("year", "projection_year_id")
)
soi_data_melt$projection_year_id <- as.factor(soi_data_melt$projection_year_id)

ggplot(soi_data_melt, aes(x = year, y = value, color = projection_year_id)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  labs(
    title = "Status of Indicators",
    x = "Year",
    y = "Status of Indicators"
  ) +
  theme_bw()

tac_data_melt <- reshape2::melt(
  tac_data,
  id = c("iter", "projection_year_id")
)
tac_data_melt$projection_year_id <- as.factor(tac_data_melt$projection_year_id)

ggplot(tac_data_melt, aes(x = iter, y = value, color = projection_year_id)) +
  geom_line() +
  facet_wrap(~variable) +
  labs(
    title = "TAC",
    x = "Iteration",
    y = "TAC"
  ) +
  theme_bw()

ggplot(tac_data_melt, aes(x=variable, y = value, color = projection_year_id)) +
  geom_boxplot()+
  labs(
    title = "TAC",
    x = "",
    y = "TAC"
  ) +
  theme_bw()

knitr::kable(lm_slope)
