###############################################################################
# 	Benchmark assessment, Atlantic menhaden, for Menhaden TC
# 	Amy Schueller, NMFS, Beaufort Lab
#   Last update: 5/30/2019
# 	This R program runs constant landings projections
###############################################################################

load(file = here::here("data", "AtlanticMenhadenSA", "projection", "bootstrap_with_NLTS_REC.Rdata"))

#################################################################################

# graphics.off()
# rm(list = ls(all = TRUE)) # start fresh by removing everything from the working environment

filename <- "am019" # admb file to run, without tpl or rdat extension
sppname <- "AM" # species label
runlab <- "constantL" # Specifying constant landings projection
ptype <- "wmf" # format to save figure

nyrs.aftermgmt <- 0 # number of years to project after mgmt is implemented
nyrs.current <- 6 # number yrs to maintain current management
nyrs <- nyrs.aftermgmt + nyrs.current # total duration of projection in yrs
yr1 <- 2018 # first year of projection

bootstrap <- as.logical(T) # if TRUE, run parametric bootstrap to get confidence bands
boot.type <- 2 # 1 or 2: 1=parametric bs using only rec devs; 2=empirical from MCB results (1 can be run from a single base run, 2 requires more)
Nage.ic.dev.lim <- 2.0 # For parametric bootstrap: limits on initial variation in Nage, used as a multiple of recruitment st dev in normal space
nboot <- 4864 # number of bootstrap replicates (at least 2000 recommended)
set.seed(99999) # seed for random number generator

make.table <- as.logical(T) # If TRUE, make html table
plot.title <- as.logical(T) # If TRUE, add title to plots


###############################################################################
#------Get results and define some global variables  -------------------------------------------------------------------
spp <- dget(here::here("data", "AtlanticMenhadenSA", "projection", paste(filename, ".rdat", sep = "")))

# life-history stuff
ages <- spp$a.series$age
nages <- length(ages)

M <- spp$a.series$M
Mstd1 <- c(0, 0, 0, 0, 0, 0, 0) # M with no deviations if set to zero
Mstd <- matrix(data = c(Mstd1), nrow = nyrs, ncol = nages, byrow = TRUE) # stdev of M over age and time

# Age and time varying M input from MSVPA-X
# M=matrix(data=c(1.114,	1.241,	1.199,	1.212,	1.149, 1.13,
# 0.841,	0.895,	0.997,	0.962,	0.895, 0.863,
# 0.618,	0.673,	0.653,	0.696,	0.723, 0.639,
# 0.533,	0.557,	0.565,	0.572,	0.585, 0.605,
# 0.492,	0.535,	0.526,	0.538,	0.536, 0.55,
# 0.479,	0.487,	0.496,	0.500,	0.497, 0.498,
# 0.458,	0.465,	0.458,	0.463,	0.464, 0.463,
# 0.458,	0.465,	0.458,	0.463,	0.464, 0.463,
# 0.458,	0.465,	0.458,	0.463,	0.464, 0.463),nrow=nyrs,ncol=nages)  #natural mortality at age over time

# Choices for weights-choose one for each of wgt.fish, wgt.spawn, reprod
wgt.fish <- spp$a.series$weight.middle * 1000000 # Middle of the year values
wgt.spawn <- spp$a.series$weight.spawn * 1000000 # Spawning values
wgt <- wgt.spawn
wgt.L <- spp$a.series$wholewgt.wgted.L.mt * 1000
reprod <- round(spp$a.series$reprod, 0)
fec.age <- spp$a.series$fecundity

# stock-recruit parameters
R0 <- spp$parms$R0
std.rec <- sqrt(var(spp$t.series$logR.dev[1:63])) # st dev

Nic.limits <- Nage.ic.dev.lim * c(-std.rec, std.rec) # limit on N_age deviations in normal space for stochastic sims

# Selectivities (F-weighted across fisheries)
sel.L <- spp$sel.age$sel.v.wgted.L # landings only

# Initial conditions
N.ic <- rep(0, times = nages)
N2018 <- spp$N.age["2018", ]
N2018.spawners <- N2018

N.ic <- N2018
N.inc <- N2018
std.Nic <- sqrt(var(spp$t.series$logR.dev[1:63])) # vector of devations for initial conditions
SSB.ic <- spp$SSB.age.pred[63, ]

# !get bootstrap stuff (pass dummy vals of 0 if not used)
boot.Mage <- 0
boot.Nage.2018 <- 0
boot.selFage <- 0
boot.SSB2018 <- 0
boot.h <- 0
boot.R0 <- 0
boot.sprF0 <- 0
if (boot.type == 2) {
  boot.Nage.2018 <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-N.age.2018.csv"), header = T)
  boot.Nage2018 <- boot.Nage.2018[-(nboot + 1), ] # gets rid of base run
  boot.sel.crn4 <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-sel.cRn4.csv"), header = T)
  boot.sel.crn4 <- boot.sel.crn4[-(nboot + 1), ] # gets rid of base run
  boot.sel.crs4 <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-sel.cRs4.csv"), header = T)
  boot.sel.crs4 <- boot.sel.crs4[-(nboot + 1), ] # gets rid of base run
  boot.sel.cbn2 <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-sel.cBn2.csv"), header = T)
  boot.sel.cbn2 <- boot.sel.cbn2[-(nboot + 1), ] # gets rid of base run
  boot.sel.cbs <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-sel.cBs.csv"), header = T)
  boot.sel.cbs <- boot.sel.cbs[-(nboot + 1), ] # gets rid of base run
  boot.m <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-M.age.csv"), header = T)
  boot.m <- boot.m[-(nboot + 1), ] # gets rid of base run
  boot.mat <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-maturity.csv"), header = T)
  boot.mat <- boot.mat[-(nboot + 1), ] # gets rid of base run
  boot.est <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-estvals.csv"), header = T)
  boot.est <- boot.est[-(nboot + 1), ] # gets rid of base run
  boot.est <- boot.est[, -1] # gets rid of bootstrap number column
  boot.sel.wgted <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-sel.wgted.csv"), header = T)
  boot.sel.wgted <- boot.sel.wgted[-(nboot + 1), ] # gets rid of base run
  boot.r.devs <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-r.devs.csv"), header = F)
  boot.r.devs <- boot.r.devs[-(nboot + 1), ] # gets rid of base run
  boot.fec <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-fecundity.csv"), header = T)
  boot.fec <- boot.fec[-(nboot + 1), ] # gets rid of base run
  boot.recruitment <- read.csv(file = here::here("data", "AtlanticMenhadenSA", "projection", "Boot-recruitment.csv"), header = F)
  boot.recruitment <- boot.recruitment[-(nboot + 1), ] # gets rid of base run
}


###############################################################################
#------Adding in the NLTS recruitment predictions  ----------------------------
library(tidyverse)
# source("projection_EDM.R")
tp_max <- 15

r.devs.for.proj <- as.matrix(boot.recruitment)
years <- seq(1955, 2017, 1)
r.devs.for.proj <- rbind(years, r.devs.for.proj)
# projections <- project_EDM_1D(r.devs.for.proj, tp_max = tp_max)
#
# save.image("bootstrap_with_NLTS_REC.Rdata")

###############################################################################
###############################################################################
#-----------------moving window prediction-------------------------------------
# rec.proj.base<-rbind(spp$t.series$recruits[1:53],spp$t.series$recruits[2:54],
#                     spp$t.series$recruits[3:55],spp$t.series$recruits[4:56],
#                     spp$t.series$recruits[5:57],spp$t.series$recruits[6:58],
#                     spp$t.series$recruits[7:59],spp$t.series$recruits[8:60],
#                     spp$t.series$recruits[9:61],spp$t.series$recruits[10:62],
#                     spp$t.series$recruits[11:63])
#
# proj.2008<-project_EDM_1D(rec.proj.base,tp_max=1)
#
# plot(spp$t.series$year[1:63],spp$t.series$recruits[1:63],type="b",pch=16,lwd=2,xlab="Year",ylab="Recruits")
# lines(spp$t.series$year[53:63],proj.2008,col="green",lwd=2)
# legend("topright",legend=c("base run","NLTS prediction"),lwd=2,col=c("black","green"))
#
###############################################################################
###############################################################################

# 2018,2019,2020,2021,2022
# Preliminary bait landings for 2018 - from Max ----conversion of pounds to mt = 0.000453592
# North = 73,057,367 pounds (ME-DE) = 33.1 kmt
# South = 37,031,328 pounds (MD-FL) = 16.8 kmt

# L.cRs=c(110.9,115.9,115.9,115.9,115.9)   #Actual landings for 2018, 2019-2022 at current TAC
# L.cRn=c(22.7,38.6,38.6,38.6,38.6)        #current TAC = 216,000
# L.cBs=c(16.8,27.4,27.4,27.4,27.4)
# L.cBn=c(33.1,34.1,34.1,34.1,34.1)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(110.9,109.7,92.9,96.5,109.4)   #Actual landings for 2018, TAC at target F
# L.cRn=c(22.7,36.6,31.0,32.2,36.5)        #50% above/below target F - ERP!
# L.cBs=c(16.8,25.9,22.0,22.8,25.8)
# L.cBn=c(33.1,32.3,27.3,28.4,32.2)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(110.9,294.5,227.3,232.4,161.0)   #Actual landings for 2018, TAC at threshold F
# L.cRn=c(22.7,98.2,75.8,77.5,53.7)        #50% above/below threshold F - ERP!
# L.cBs=c(16.8,69.6,53.7,54.9,38.0)
# L.cBn=c(33.1,86.6,66.9,68.4,47.3)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(110.9,171.0,140.2,144.8,144.8)   #Actual landings for 2018, TAC at target F
# L.cRn=c(22.7,57.0,46.7,48.3,48.3)        #50% above/below target F - single species
# L.cBs=c(16.8,42.1,34.5,35.7,35.7)
# L.cBn=c(33.1,51.8,42.5,43.9,43.9)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(110.9,395.2,289.0,296.0,296.0)   #Actual landings for 2018, TAC at threshold F
# L.cRn=c(22.7,131.7,96.3,98.7,98.7)        #50% above/below threshold F - single species
# L.cBs=c(16.8,97.4,71.2,72.9,72.9)
# L.cBn=c(33.1,119.7,87.5,89.6,89.6)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

#################################################################################
## projections run for Aug 2020 Board meeting requests

L.cRs <- c(83.2, 105.0, 115.9, 115.9, 115.9, 115.9) # Actual landings for 2018 and 2019
L.cRn <- c(58.1, 45.8, 38.6, 38.6, 38.6, 38.6) # TAC landings for 2020 - 2022
L.cBs <- c(16.8, 18.9, 27.4, 27.4, 27.4, 27.4) # Current TAC = 216,000
L.cBn <- c(33.4, 39.1, 34.1, 34.1, 34.1, 34.1)
L.cR.cB <- colSums(rbind(L.cRs, L.cRn, L.cBs, L.cBn))

# L.cRs=c(83.2,105.0,115.9,110.1,110.1,110.1)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,36.7,36.7,36.7)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,26.0,26.0,26.0)         #TAC landings = 205,200 for 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,32.4,32.4,32.4)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(83.2,105.0,115.9,104.3,104.3,104.3)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,34.8,34.8,34.8)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,24.6,24.6,24.6)         #TAC landings = 194,400 for 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,30.7,30.7,30.7)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(83.2,105.0,115.9,121.7,121.7,121.7)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,40.5,40.5,40.5)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,28.8,28.8,28.8)         #TAC landings = 226,800 for 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,35.8,35.8,35.8)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(83.2,105.0,115.9,127.5,127.5,127.5)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,42.5,42.5,42.5)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,30.1,30.1,30.1)         #TAC landings = 237,600 for 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,37.5,37.5,37.5)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(83.2,105.0,115.9,105.8,116.0,115.9)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,35.3,38.7,38.6)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,25.0,27.4,27.4)         #60% probability of exceeding TAC in 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,31.1,34.1,34.1)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(83.2,105.0,115.9,100.1,107.6,115.9)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,33.4,35.9,38.6)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,23.7,25.4,27.4)         #55% probability of exceeding TAC in 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,29.4,31.7,34.1)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

L.cRs <- c(83.2, 105.0, 115.9, 94.9, 100.5, 115.9) # Actual landings for 2018 and 2019
L.cRn <- c(58.1, 45.8, 38.6, 31.6, 33.5, 38.6) # TAC landings for 2020 of 216,000
L.cBs <- c(16.8, 18.9, 27.4, 22.4, 23.8, 27.4) # 50% probability of exceeding TAC in 2021 and 2022
L.cBn <- c(33.4, 39.1, 34.1, 27.9, 29.6, 34.1)
L.cR.cB <- colSums(rbind(L.cRs, L.cRn, L.cBs, L.cBn))

# L.cRs=c(83.2,105.0,115.9,90.9,95.1,115.9)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,30.3,31.7,38.6)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,21.5,22.5,27.4)         #45% probability of exceeding TAC in 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,26.7,28.0,34.1)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(83.2,105.0,115.9,87.5,90.8,115.9)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,29.2,30.3,38.6)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,20.7,21.6,27.4)         #40% probability of exceeding TAC in 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,25.7,26.7,34.1)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(83.2,105.0,115.9,84.8,87.4,115.9)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,28.3,29.1,38.6)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,20.0,20.7,27.4)         #35% probability of exceeding TAC in 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,24.9,25.7,34.1)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

# L.cRs=c(83.2,105.0,115.9,82.2,84.3,115.9)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,27.4,28.1,38.6)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,19.4,20.0,27.4)         #30% probability of exceeding TAC in 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,24.2,24.8,34.1)
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))

L.cRs <- c(83.2, 105.0, 115.9, 79.7, 80.9, 115.9) # Actual landings for 2018 and 2019
L.cRn <- c(58.1, 45.8, 38.6, 26.6, 27.0, 38.6) # TAC landings for 2020 of 216,000
L.cBs <- c(16.8, 18.9, 27.4, 18.9, 19.1, 27.4) # 25% probability of exceeding TAC in 2021 and 2022
L.cBn <- c(33.4, 39.1, 34.1, 23.5, 23.8, 34.1)
L.cR.cB <- colSums(rbind(L.cRs, L.cRn, L.cBs, L.cBn))

# L.cRs=c(83.2,105.0,115.9,147.8,150.1,115.9)  #Actual landings for 2018 and 2019
# L.cRn=c(58.1,45.8,38.6,49.3,50.0,38.6)        #TAC landings for 2020 of 216,000
# L.cBs=c(16.8,18.9,27.4,34.9,35.5,27.4)         #50% probability of exceeding single species ref pts in 2021 and 2022
# L.cBn=c(33.4,39.1,34.1,43.5,44.1,34.1)        #######For Dave Chagaris
# L.cR.cB=colSums(rbind(L.cRs,L.cRn,L.cBs,L.cBn))




prop.F.cRs <- 0.53 # based on proportion of 216,000 mt each fishery consists of; or based on allocation
prop.F.cRn <- 0.18
prop.F.cBs <- 0.13
prop.F.cBn <- 1 - prop.F.cRs - prop.F.cRn - prop.F.cBs

###############################################################################
#--------Run stochastic projection----------------------------------------------------------------
if (bootstrap) {
  source(here::here("data", "AtlanticMenhadenSA", "projection", "ModF_proj_stochastic-menhaden-constant landings NLTS rec.r"))
  proj.stoch <- project.stoch(yr1, nyrs.current, nyrs, sel.L, N.inc, ages,
    wgt, wgt.L, reprod, M, R0, nboot,
    quants = c(0.05, 0.25, 0.5, 0.75, 0.95), boot.type,
    boot.m, boot.Nage2018, boot.sel.wgted, boot.est, boot.mat, boot.fec,
    boot.sel.crs4, boot.sel.crn4, boot.sel.cbs, boot.sel.cbn2, fec.age, boot.r.devs, projections
  )
  dput(proj.stoch, file = paste(sppname, ".proj.stoch.", runlab, ".rdat", sep = "")) # Save results
  cat("Stochastic projections complete!\n")
}
###############################################################################
# Full F values
quants <- seq(0, 1, 0.005)
F.quants <- apply(proj.stoch$F.boot[, 1:nyrs], 2, quantile, probs = quants, na.rm = T)
F.quants
###############################################################################
#-------geo F calcs-----------------------------------------
F.geo.mean <- matrix(rep(NA, nboot * nyrs), nrow = nboot)
for (j in 1:nboot)
{
  for (k in 1:nyrs)
  {
    fish.mort <- proj.stoch$F.boot[j, k] * boot.sel.wgted[j, ]
    F.geo.mean[j, k] <- (prod(fish.mort[3:5]))^(1 / 3)
  }
}
quants <- seq(0, 1, 0.005)
# quants=c(0.05,0.25,0.5,0.75,0.95)
F.geo.quants <- apply(F.geo.mean[, 1:nyrs], 2, quantile, probs = quants, na.rm = T)

###############################################################################
#---------F geo mean pdf-------------
# plot(density(F.geo.mean[, 2]), main = "2018", xlab = "Geometric mean F")
# abline(v = 0.60, col = "blue", lwd = 2)
# abline(v = 0.22, col = "orange", lwd = 2)
# legend(x = "topright", legend = c("target", "threshold"), lwd = 2, col = c("orange", "blue"), bty = "n")


###############################################################################
#-------Make plots-----------------------------------------

# windows(width = 8, height = 6, record = T)
par(mfrow = c(2, 2), mar = c(5, 5, 1.5, 1), las = 1)
# yrs=seq(yr1,(yr1+nyrs-2), by=1) # years for plotting and table
yrs <- seq(yr1, 2022, by = 1) # years for plotting and table
yrs <- floor(yrs)
scenario <- "Projection: "
if (plot.title) {
  title1 <- paste(scenario, "Fecundity")
  title2 <- paste(scenario, "Recruits")
  title3 <- paste(scenario, "Fishing mortality rate")
  title4 <- paste(scenario, "Landings")
} else {
  title1 <- ""
  title2 <- ""
  title3 <- ""
  title4 <- ""
}
if (bootstrap) {
  ymax <- max(proj.stoch$SSB.quants, na.rm = T)
} else {
  ymax <- max(proj.stoch$SSB.quants, na.rm = T)
}
par(mgp = c(4, 1, 0))
plot(yrs, proj.stoch$SSB.quants[3, 1:5],
  type = "n", ylim = c(0, ymax), ylab = "Fecundity (billions of eggs)",
  xlab = "", lty = 1, lwd = 2, main = title1, xaxt = "n"
)
axis(side = 1, at = c(2018, 2019, 2020, 2021, 2022), labels = c("2018", "2019", "2020", "2021", "2022"))
lines(yrs, proj.stoch$SSB.quants[3, 1:5], lwd = 2, lty = 2)
# points(yrs,proj.stoch$SSB.quants[2,1:4],pch=16)
abline(h = 1492854, lwd = 2, col = "blue")
abline(h = 2003986, lwd = 2, col = "orange")
if (bootstrap) {
  lines(yrs, proj.stoch$SSB.quants[1, 1:5], lty = 1, lwd = 2)
  lines(yrs, proj.stoch$SSB.quants[2, 1:5], lty = 3, lwd = 2)
  lines(yrs, proj.stoch$SSB.quants[4, 1:5], lty = 3, lwd = 2)
  lines(yrs, proj.stoch$SSB.quants[5, 1:5], lty = 1, lwd = 2)
}

if (bootstrap) {
  ymax <- max(proj.stoch$R.quants)
} else {
  ymax <- max(proj.stoch$R.quants)
}
plot(yrs, proj.stoch$R.quants[3, 1:5],
  type = "n", ylim = c(0, ymax), ylab = "Recruits (billion fish)",
  xlab = "", lty = 1, lwd = 2, main = title2, xaxt = "n"
)
axis(side = 1, at = c(2018, 2019, 2020, 2021, 2022), labels = c("2018", "2019", "2020", "2021", "2022"))
lines(yrs, proj.stoch$R.quants[3, 1:5], lwd = 2, lty = 2)
# points(yrs,proj.stoch$R.quants[2,1:4],pch=16)
if (bootstrap) {
  lines(yrs, proj.stoch$R.quants[1, 1:5], lty = 1, lwd = 2)
  lines(yrs, proj.stoch$R.quants[2, 1:5], lty = 3, lwd = 2)
  lines(yrs, proj.stoch$R.quants[4, 1:5], lty = 3, lwd = 2)
  lines(yrs, proj.stoch$R.quants[5, 1:5], lty = 1, lwd = 2)
}

if (bootstrap) {
  ymax <- max(proj.stoch$F.quants, na.rm = T)
} else {
  ymax <- max(proj.stoch$F.quants, na.rm = T)
}
plot(yrs, proj.stoch$F.quants[3, 1:5],
  type = "n", ylim = c(0, ymax + 0.3), ylab = "F (per yr)",
  xlab = "Year", lty = 1, lwd = 2, main = title3, xaxt = "n"
)
axis(side = 1, at = c(2018, 2019, 2020, 2021, 2022), labels = c("2018", "2019", "2020", "2021", "2022"))
lines(yrs, proj.stoch$F.quants[3, 1:5], lty = 2, lwd = 2)
# points(yrs,F.geo.quants[2,1:4],pch=16)
abline(h = 0.19, lwd = 2, col = "orange")
abline(h = 0.57, lwd = 2, col = "blue")
if (bootstrap) {
  lines(yrs, proj.stoch$F.quants[1, 1:5], lty = 1, lwd = 2)
  lines(yrs, proj.stoch$F.quants[2, 1:5], lty = 3, lwd = 2)
  lines(yrs, proj.stoch$F.quants[4, 1:5], lty = 3, lwd = 2)
  lines(yrs, proj.stoch$F.quants[5, 1:5], lty = 1, lwd = 2)
}

# if (bootstrap) {ymax=max(proj.stoch$L.quants,na.rm=T)
# } else {ymax=max(proj.stoch$L.quants,na.rm=T)}
plot(yrs, L.cR.cB[1:5],
  type = "n", ylim = c(0, 250), ylab = "Landings (1000 mt)",
  xlab = "Year", lty = 1, lwd = 2, main = title4, xaxt = "n"
)
axis(side = 1, at = c(2018, 2019, 2020, 2021, 2022), labels = c("2018", "2019", "2020", "2021", "2022"))
lines(yrs, L.cR.cB[1:5], lty = 1, lwd = 2)
points(yrs, L.cR.cB[1:5], pch = 16)
# text(yr1,0.95*max(ymax),'D')
# if (bootstrap) {lines(yrs,proj.stoch$L.quants[1,-10],lty=1,lwd=1);
# lines(yrs,proj.stoch$L.quants[3,-10],lty=1,lwd=1)}

# savePlot(filename=paste(sppname,"-proj_at_currentTAC-NLTS rec-",runlab,".wmf",sep=""), type=ptype)
# savePlot(filename=paste(sppname,"-proj_60percent-NLTS rec-",runlab,".wmf",sep=""), type=ptype)
######################################################################################################################################
# savePlot(filename = paste(sppname, "-proj_25percent-NLTS rec-", runlab, ".wmf", sep = ""), type = ptype) # final one used by Amy
######################################################################################################################################
# savePlot(filename=paste(sppname,"-proj_TAC237600-NLTS rec-",runlab,".wmf",sep=""), type=ptype)



###############################################################################
### Outputs for EwE - F distributions

# write.csv(proj.stoch$F.boot, file="Fvalues_currentTAC.csv", quote=F, row.names=F)
# write.csv(proj.stoch$F.boot, file="Fvalues_target.csv", quote=F, row.names=F)
# write.csv(proj.stoch$F.boot, file="Fvalues_threshold.csv", quote=F, row.names=F)


################################################################################
## Density plot of F values
d <- density(proj.stoch$F.boot[, 4])
plot(d, xlab = "F (per yr)", main = "Density plot of 2021 F at TAC of 216,000", xlim = c(0, 0.6))
polygon(d, col = "light blue")
abline(v = 0.19, col = "black", lty = 2, lwd = 2)
abline(v = 0.57, col = "black", lty = 1, lwd = 2)
abline(v = 0.235, col = "black", lty = 3, lwd = 2)
legend(x = 0.35, y = 5, legend = c("F median", "Ftarget", "Fthreshold"), col = "black", lwd = 2, lty = c(3, 2, 1))


d <- density(proj.stoch$F.boot[, 5])
plot(d, xlab = "F (per yr)", main = "Density plot of 2022 F at TAC of 216,000", xlim = c(0, 0.6))
polygon(d, col = "light blue")
abline(v = 0.19, col = "black", lty = 2, lwd = 2)
abline(v = 0.57, col = "black", lty = 1, lwd = 2)
abline(v = 0.224, col = "black", lty = 3, lwd = 2)
legend(x = 0.35, y = 4, legend = c("F median", "Ftarget", "Fthreshold"), col = "black", lwd = 2, lty = c(3, 2, 1))




abline(v = proj.stoch$F.quants[3, 4], col = "black", lty = 2, lwd = 2)
abline(v = proj.stoch$F.quants[1, 4], col = "black", lty = 1, lwd = 2)
abline(v = proj.stoch$F.quants[5, 4], col = "black", lty = 1, lwd = 2)
abline(v = proj.stoch$F.quants[2, 4], col = "black", lty = 3, lwd = 2)
abline(v = proj.stoch$F.quants[4, 4], col = "black", lty = 3, lwd = 2)
