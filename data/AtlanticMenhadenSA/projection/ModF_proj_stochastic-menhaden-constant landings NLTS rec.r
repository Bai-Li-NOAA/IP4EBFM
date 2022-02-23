###############################################################################
# 	SEDAR40, Atlantic menhaden, for Menhaden TC
#   Amy Schueller 9/26/2014
# 	Stochastic projections: Constant landings scenario
###############################################################################

"L.calc.wgt" <- function(F.age, Z.age, N.age, wgt) {
  # fcn computes landings in wgt
  # INPUT
  # F.age = vector of fishing mortality rate at age
  # Z.age = vector of total mortality rate at age including dead discards
  # N.age = vector of abundance at age
  # wgt   = vector of weight at age
  L.age <- rep(NA, times = length(N.age))
  L.age <- wgt * F.age * N.age * (1.0 - exp(-Z.age)) / Z.age
  L <- sum(L.age)
  return(L)
} # end fcn L.calc

"L.calc.num" <- function(F.age, Z.age, N.age) {
  # fcn computes landings in numbers
  # INPUT
  # F.age = vector of fishing mortality rate at age
  # Z.age = vector of total mortality rate at age including dead discards
  # N.age = vector of abundance at age
  # wgt   = vector of weight at age
  L.age <- rep(NA, times = length(N.age))
  L.age <- F.age * N.age * (1.0 - exp(-Z.age)) / Z.age
  L <- sum(L.age)
  return(L)
} # end fcn L.calc.num

F.fit <- function(x, landings, numbers, wgt, sel.crs, sel.crn, sel.cbs, sel.cbn, MforZ) {
  # fcn finds the F that matches landings, called by the optimize fcn
  # INPUT
  # x = the range of values for F over which to find a minimum
  # landings = the amount of total landings in metric tons
  # numbers = vector of numbers at age
  # sel.crs, sel.crn, sel.cbs, sel.cbn = fishery selectivities
  F <- x
  L.cRs.F <- rep(NA, nages)
  L.cRn.F <- rep(NA, nages)
  L.cBs.F <- rep(NA, nages)
  L.cBn.F <- rep(NA, nages)

  Z.F <- Z.calc(F, MforZ, sel.crs, sel.crn, sel.cbs, sel.cbn)

  L.cRs.F <- wgt * F * prop.F.cRs * sel.crs * numbers * (1 - exp(-Z.F)) / Z.F
  L.cRn.F <- wgt * F * prop.F.cRn * sel.crn * numbers * (1 - exp(-Z.F)) / Z.F
  L.cBs.F <- wgt * F * prop.F.cBs * sel.cbs * numbers * (1 - exp(-Z.F)) / Z.F
  L.cBn.F <- wgt * F * prop.F.cBn * sel.cbn * numbers * (1 - exp(-Z.F)) / Z.F

  L.F <- sum(L.cRs.F) + sum(L.cRn.F) + sum(L.cBs.F) + sum(L.cBn.F)

  L.min <- (abs(L.F - landings))^2
  return(L.min)
} # end fcn F.fit

Z.calc <- function(fullF, MforZ, sel.crs, sel.crn, sel.cbs, sel.cbn) {
  # fcn calculates age-specific total mortality
  # INPUT
  # fullF = estimated full F from landings (which were an input)
  Zmort <- MforZ
  Zmort <- Zmort + prop.F.cRs * fullF * sel.crs
  Zmort <- Zmort + prop.F.cRn * fullF * sel.crn
  Zmort <- Zmort + prop.F.cBs * fullF * sel.cbs
  Zmort <- Zmort + prop.F.cBn * fullF * sel.cbn
  return(Zmort)
} # end fcn Z.calc

L.calc <- function(f, N.age, wgt, sel.crs, sel.crn, sel.cbs, sel.cbn, MforZ) {
  # fcn computes landings given vector of fishery specific F's
  # f = fishing mortality
  # N.age = vector of numbers at age
  F.crn <- f[1]
  F.crs <- f[2]
  F.cbs <- f[3]
  F.cbn <- f[4]

  Z <- MforZ
  Z <- Z + F.crs * sel.crs
  Z <- Z + F.crn * sel.crn
  Z <- Z + F.cbs * sel.cbs
  Z <- Z + F.cbn * sel.cbn

  L.cRs <- wgt * F.crs * sel.crs * N.age * (1 - exp(-Z)) / Z
  L.cRn <- wgt * F.crn * sel.crn * N.age * (1 - exp(-Z)) / Z
  L.cBs <- wgt * F.cbs * sel.cbs * N.age * (1 - exp(-Z)) / Z
  L.cBn <- wgt * F.cbn * sel.cbn * N.age * (1 - exp(-Z)) / Z

  L <- sum(L.cRs) + sum(L.cRn) + sum(L.cBs) + sum(L.cBn)
  return(L)
} # end fcn L.calc


"project.stoch" <- function(yr1, nyrs.current, nyrs, sel.L, N.inc, ages,
                            wgt, wgt.L, reprod, M, R0, nboot, quants, boot.type,
                            boot.Mage, boot.Nage2009, boot.selLage, boot.R0, boot.mat, boot.fec,
                            boot.sel.crs, boot.sel.crn, boot.sel.cbs, boot.sel.cbn, fec.age, boot.r.devs, projections) {
  # fcn runs stochastic projections
  # INPUT
  # yr1    = first calendar year of projection
  # nyrs.current   = number years to maintain F.current
  # nyrs   = total number years to project
  # sel.L  = vector of selectivity at age to compute landings
  # N.inc  = vector of abundance at age in yr1 used to add variability
  # ages   = vector of ages
  # wgt    = vector of weight at age of popn
  # wgt.L  = vector of weight at age of landings
  # reprod = vector of reproductive contribution at age to SSB
  # M      = natural mortality rate
  # R0     = virgin recruitment of spawner-recruit fcn
  # nboot  = number of bootstraps
  # quants = quantiles of nboot projections reported in output
  # boot.type = defines type of bootstrapping
  # boot.Mage, boot.Nage2009, boot.selLage,
  # boot.SSB2008, boot.R0, boot.mat: used if boot.type=2

  nages <- length(ages)

  Z.age <- rep(NA, nages) # total mortality by age
  M.age <- rep(NA, nages) # natural mortality by age
  W.age <- matrix(rep(NA, nboot * (nyrs * nages)), nrow = nboot) # weight at age
  reprod <- rep(NA, nages)
  wgt1 <- rep(NA, nages)

  F.age <- rep(NA, nages) # fishing mortality by age
  F.age.boot <- array(rep(NA, nboot * nyrs * nages), dim = c(nboot, nyrs, nages))
  Z.age.boot <- array(rep(NA, nboot * nyrs * nages), dim = c(nboot, nyrs, nages))
  N.age <- matrix(rep(NA, (nyrs + 1) * nages), nrow = nyrs + 1) # numbers at age by year
  N.age.boot <- array(rep(NA, nboot * (nyrs + 1) * nages), dim = c(nboot, nyrs + 1, nages))
  N.ssb.age <- matrix(rep(NA, (nyrs + 1) * nages), nrow = nyrs + 1) # numbers at age by year
  logNic1 <- rep(NA, nages - 1) # For initial numbers at age-in order to include some variability
  SSB <- matrix(rep(NA, nboot * nyrs), nrow = nboot) # spawning stock biomass (in same units as reprod)
  B <- matrix(rep(NA, nboot * nyrs), nrow = nboot) # total stock biomass (mt)
  Recruits <- matrix(rep(NA, nboot * nyrs), nrow = nboot) # recruits in numbers
  F <- matrix(rep(NA, nboot * nyrs), nrow = nboot) # full F (/yr)
  Mdevs <- matrix(rep(NA, nboot * (nyrs * nages)), nrow = nboot) # natural mortality deviations
  Landings <- matrix(rep(NA, nboot * nyrs), nrow = nboot) # landings in weight
  logR.dev <- matrix(rep(NA, nboot * nyrs), nrow = nboot) # recruitment deviations (log-space)--TYPE 1


  ######## Begin bootstrap#########################################################
  for (iboot in 1:nboot) {
    # Initial conditions

    if (boot.type == 2) {
      M <- as.numeric(boot.m[iboot, ])
      mat <- as.numeric(boot.mat[iboot, ])
      fec <- as.numeric(boot.fec[iboot, ])
      sel.L <- as.numeric(boot.selLage[iboot, ])
      N.age[1, ] <- as.numeric(boot.Nage2009[iboot, ])
      # R0=as.numeric(boot.est[iboot])
      sel.crs <- as.numeric(boot.sel.crs[iboot, ])
      sel.crn <- as.numeric(boot.sel.crn[iboot, ])
      sel.cbs <- as.numeric(boot.sel.cbs[iboot, ])
      sel.cbn <- as.numeric(boot.sel.cbn[iboot, ])
      # r.dev=as.numeric(boot.r.devs[iboot,])
      proj.r <- as.numeric(projections[iboot, ])
    }

    for (iyr in 1:(nyrs - 1)) {
      if (iyr < (nyrs.current + 1)) { # period to estimate F
        numbers <- N.age[iyr, ]
        landings <- L.cR.cB[iyr]
        FLtemp <- optimize(
          f = F.fit, interval = c(0.001, 3.0), tol = 0.0000000000001, landings = landings, numbers = numbers, wgt = wgt.L,
          sel.crs = sel.crs, sel.crn = sel.crn, sel.cbs = sel.cbs, sel.cbn = sel.cbn, MforZ = M
        )
        F[iboot, iyr] <- FLtemp$minimum
        F.vec.tmp <- c(prop.F.cRs * F[iboot, iyr], prop.F.cRn * F[iboot, iyr], prop.F.cBs * F[iboot, iyr], prop.F.cBn * F[iboot, iyr])
        # Landings[iboot,iyr]=L.calc(F.vec.tmp,number,wgt.L,sel.crs,sel.crn,sel.cbs,sel.cbn,M)
      }

      F.age <- sel.L * F[iboot, iyr]
      Z.age <- M + F.age
      F.age.boot[iboot, iyr, ] <- F.age
      Z.age.boot[iboot, iyr, ] <- Z.age

      if (iyr == 1) {
        N.ssb.age[1, ] <- N.age[1, ]
        N.age[1, 1] <- proj.r[1]
        # N.age[1,1]=exp(as.numeric(sample(r.dev,1,replace=TRUE)))+R0
      }
      reprod1 <- 0.5 * mat * fec
      SSB[iboot, iyr] <- sum(N.ssb.age[iyr, ] * reprod1)
      # print(c(iboot,iyr,SSB[iboot,iyr]))
      B[iboot, iyr] <- sum(N.age[iyr, ] * wgt)

      # logR.dev=as.numeric(sample(r.dev,1,replace=TRUE))
      # N.age[iyr+1,1]=exp(logR.dev)+R0
      N.age[iyr + 1, 1] <- proj.r[iyr + 1]

      N.age[(iyr + 1), 2:nages] <- N.age[iyr, 1:(nages - 1)] * (exp(-1.0 * Z.age[1:(nages - 1)]))
      N.age[(iyr + 1), nages] <- N.age[(iyr + 1), nages] +
        N.age[iyr, nages] * (exp(-1.0 * Z.age[nages])) # plus group
      N.ssb.age[(iyr + 1), ] <- N.age[(iyr + 1), ]
      # print(c(iboot,iyr,N.age[iboot,iyr]))
    } # end iyr loop

    # F[iboot,nyrs]=F.proj
    # F.age=sel.L*F[iboot,nyrs]

    # for (iage in 1:nages) {
    #      M.iage=Mdevs[iboot,((nages*nyrs)-nages+iage)]
    #      M.age[iage]=M.iage
    #      reprod1[iage]=reprod.random[iboot,((nages*iyr)-nages+iage)]
    #      wgt1[iage]=W.age[iboot,((nages*iyr)-nages+iage)]
    #   }
    # Z.age=M.age+F.age

    N.age.boot[iboot, , ] <- N.age
    SSB[iboot, nyrs] <- sum(N.ssb.age[nyrs, ] * reprod1)
    B[iboot, nyrs] <- sum(N.age[nyrs, ] * wgt)

    Recruits[iboot, ] <- N.age.boot[iboot, -(nyrs + 1), 1]
  } # end iboot

  # calculate quantiles from bootstrap replicates
  SSB.quants <- apply(SSB[, 1:nyrs], 2, quantile, probs = quants, na.rm = T)
  B.quants <- apply(B[, 1:nyrs], 2, quantile, probs = quants, na.rm = T)
  R.quants <- apply(Recruits[, 1:nyrs], 2, quantile, probs = quants, na.rm = T)
  F.quants <- apply(F[, 1:nyrs], 2, quantile, probs = quants, na.rm = T)
  # L.quants=apply(Landings[,1:nyrs],2,quantile,probs=quants,na.rm=T)

  yrs <- yr1:(yr1 + nyrs - 1)

  return(list(
    yrs = yrs, F.quants = F.quants, # L.quants=L.quants,
    SSB.quants = SSB.quants,
    B.quants = B.quants, R.quants = R.quants, SSB = SSB, # landings=Landings,
    Ftocheck = F,
    SSB.boot = SSB, B.boot = B, R.boot = Recruits, # L.boot=Landings,
    N.boot = N.age.boot,
    Z.boot = Z.age.boot, F.boot = F
  ))
}
