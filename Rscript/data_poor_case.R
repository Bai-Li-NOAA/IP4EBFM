
# Data-poor case introduction --------------------------------------------------
## Using depletion-Based Stock Reduction Analysis(DB-SRA) from DLMtool
## (https://github.com/DLMtool/DLMtool)

# Install required R packages -------------------------------------
required_pkg <- c("DLMtool", "here") ## version 6.0.3

pkg_to_install <- required_pkg[!(required_pkg %in%
  installed.packages()[, "Package"])]
if (length(pkg_to_install)) install.packages(pkg_to_install)

lapply(required_pkg, library, character.only = TRUE)

# Case 0: default stock assessment run ----------------------------

# Load simulated input data
source(here::here("Rscript", "simulation.R"))
sensitivity_run = FALSE
## Questions: DB-SRA is a method designed for determining a catch limit
## and management reference points for data-limited fisheries
## where catches are known from the beginning of exploitation.
## However, the catch data from the menhaden-like species case is not
## from the beginning of the exploitation.

# Populate the input data object
model_year <- 1985:2012
projection_year <- 2013:2017
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
ss_case0@Dep <- tail(ss_case0@Cat[1, ], n = 1) / ss_case0@Cat[1, 1]
# VB maximum growth rate
ss_case0@vbK <- sa_data$biodata$k
# VB theoretical age at zero length
# default from EwE: -0.1
# https://www.researchgate.net/publication/267193103_Ecopath_with_Ecosim_A_User's_Guide#pf66
ss_case0@vbt0 <- sa_data$biodata$t0
# VB maximum length
ss_case0@vbLinf <- (sa_data$biodata$winf * 1000 / sa_data$biodata$lw_a)^(1 / sa_data$biodata$lw_b)
# ss_case0@vbLinf <- 500 # mm from FishBase
# Ratio of FMSY/M
# Q: Is it possible to find the ratio of FMSY to M
# for pelagic species in the Northwestern Atlantic Ocean?
# EwE FMSY values
fmsy <- c(
  0.092402786, 0.344614655, 1.101458788, 0.722086847,
  1.569404483, 0.988227546, 0.72328496
)

fmsy_m <- fmsy / sa_data$biodata$natural_mortality_matrix[1, ]

ss_case0@FMSY_M <- mean(fmsy_m)
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

DBSRA(1, ss_case0, plot = TRUE)
DBSRA_40(1, ss_case0, plot = TRUE)
DBSRA4010(1, ss_case0, plot = TRUE)

# Sensitivity runs
if (sensitivity_run){
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
  save(altValue_data, file=here::here("Rscript", "data_poor_sensitivity_run.RData"))
} else {
  load(here::here("Rscript", "data_poor_sensitivity_run.RData"))
}

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

# Projection --------------------------------------------------
# case 0
projection_output <- list()
for (i in 1:length(projection_year)) {
  ss_case <- ss_case0
  year <- model_year[1]:(projection_year[i] - 1)
  data_id <- as.numeric(names(sa_data$fishery$obs_total_catch_biomass$fleet1)) %in% year
  ss_case@Cat <- matrix(sa_data$fishery$obs_total_catch_biomass$fleet1[data_id],
    nrow = 1
  )
  ss_case@Year <- year
  ss_case@Dep <- tail(ss_case@Cat[1, ], n = 1) / ss_case@Cat[1, 1]
  projection_output[[i]] <- DBSRA_(1, ss_case)
}

# plot figures
ylim <- range(unlist(sapply(projection_output, '[', 'TAC')))
plot(c(model_year, projection_year),
  c(projection_output[[1]]$C_hist, rep(NA, length(projection_year))),
  type = "l",
  ylim = ylim,
  xlab = "Year", ylab = "Catch (mt)"
)

for (i in 1:length(projection_year)) {
  boxplot(projection_output[[i]]$TAC,
    add = TRUE,
    at = projection_year[i],
    col = "grey",
    width = 1,
    outline = TRUE,
    axes = FALSE
  )
}

catch_year <- projection_year[1:length(projection_year)-1]
points(catch_year, sa_data$fishery$obs_total_catch_biomass$fleet1[names(sa_data$fishery$obs_total_catch_biomass$fleet1) %in% catch_year],
       pch = 16, col="blue")

legend("top",
       c("Observed Catch", "Observed Catch for TAC estimates", "TAC"),
       lty= c(1, NA, NA),
       pch=c(NA, 16, NA),
       col=c("black", "blue", NA),
       fill=c(NA, NA, "gray"),
       border=c(NA, NA, "black"),
       bty="n")
