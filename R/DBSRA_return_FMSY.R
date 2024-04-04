#'@export

DBSRA_return_FMSY <- function(x, Data, reps = 100, depo=NULL, hcr=NULL) {
  # returns a vector of DBSRA estimates of the TAC for a particular
  # simulation x for(x in 1:nsim){

  if (MSEtool::NAor0(Data@CV_BMSY_B0[x])) stop("Data@CV_BMSY_B0 is NA")
  C_hist <- Data@Cat[x, ]
  TAC <- rep(NA, reps)
  Btrend <- matrix(NA, nrow=reps, ncol=length(C_hist))
  Bt_Kstore <- FMSY_Mstore <- BMSY_K_Mstore <- FMSYstore <- rep(NA, reps)
  DBSRAcount <- 1
  if (is.null(depo)) {
    if (is.na(Data@Dep[x]) | is.na(Data@CV_Dep[x])) {
      out <- new("Rec")
      out@TAC <- rep(as.numeric(NA), reps)
      return(out)
    }
  } else {
    Data@CV_Dep[x] <- tiny
  }
  if (is.na(Data@BMSY_B0[x])){
    out <- new("Rec")
    out@TAC <- rep(as.numeric(NA), reps)
    return(out)
  }

  while (DBSRAcount < (reps + 1)) {
    if (is.null(depo)) depo <- max(0.01, min(0.99, Data@Dep[x]))  # known depletion is between 1% and 99% - needed to generalise the Dick and MacCall method to extreme depletion scenarios
    Bt_K <- rbeta(100, MSEtool::alphaconv(depo, min(depo * Data@CV_Dep[x], (1 - depo) * Data@CV_Dep[x])),
                  MSEtool::betaconv(depo, min(depo * Data@CV_Dep[x], (1 - depo) * Data@CV_Dep[x])))  # CV 0.25 is the default for Dick and MacCall mu=0.4, sd =0.1
    Bt_K <- Bt_K[Bt_K > 0.00999 & Bt_K < 0.99001][1]  # interval censor (0.01,0.99)  as in Dick and MacCall 2011

    Mdb <- MSEtool::trlnorm(100, Data@Mort[x], Data@CV_Mort[x])
    Mdb <- Mdb[Mdb < 0.9][1]  # !!!! maximum M is 0.9   interval censor
    if (is.na(Mdb)) Mdb <- 0.9  # !!!! maximum M is 0.9   absolute limit
    FMSY_M <- MSEtool::trlnorm(1, Data@FMSY_M[x], Data@CV_FMSY_M[x])
    BMSY_K <- rbeta(100, MSEtool::alphaconv(Data@BMSY_B0[x], Data@CV_BMSY_B0[x] *  Data@BMSY_B0[x]),
                    MSEtool::betaconv(Data@BMSY_B0[x], Data@CV_BMSY_B0[x] * Data@BMSY_B0[x]))  #0.045 corresponds with mu=0.4 and quantile(BMSY_K,c(0.025,0.975)) =c(0.31,0.49) as in Dick and MacCall 2011
    tryBMSY_K <- BMSY_K[BMSY_K > 0.05 & BMSY_K < 0.95][1]  # interval censor (0.05,0.95) as in Dick and MacCall, 2011
    if (is.na(tryBMSY_K)) {
      Min <- min(BMSY_K, na.rm = TRUE)
      Max <- max(BMSY_K, na.rm = TRUE)
      if (Max <= 0.05) BMSY_K <- 0.05
      if (Min >= 0.95) BMSY_K <- 0.95
    }
    if (!is.na(tryBMSY_K))  BMSY_K <- tryBMSY_K

    Bt_Kstore[DBSRAcount] <- Bt_K
    FMSY_Mstore[DBSRAcount] <- FMSY_M
    BMSY_K_Mstore[DBSRAcount] <- BMSY_K

    adelay <- max(floor(iVB(Data@vbt0[x], Data@vbK[x], Data@vbLinf[x],  Data@L50[x])), 1)

    # scale catches for optimization
    scaler <- 1000/mean(C_hist, na.rm=TRUE)
    C_hist2 <- scaler * C_hist
    opt <- optimize(DBSRAopt, log(c(0.01 * mean(C_hist2, na.rm=TRUE), 1000 * mean(C_hist2, na.rm=TRUE))), C_hist = C_hist2,
                    nys = length(C_hist2), Mdb = Mdb, FMSY_M = FMSY_M, BMSY_K = BMSY_K,
                    Bt_K = Bt_K, adelay = adelay, tol = 0.01)

    Bctemp <- DBSRAopt(opt$minimum,  C_hist = C_hist2,
                       nys = length(C_hist2), Mdb = Mdb, FMSY_M = FMSY_M, BMSY_K = BMSY_K,
                       Bt_K = Bt_K, adelay = adelay, opt=2)

    Btrend[DBSRAcount,] <- Bctemp/scaler
    Kc <- exp(opt$minimum) / scaler
    BMSYc <- Kc * BMSY_K
    FMSYc <- Mdb * FMSY_M
    UMSYc <- (FMSYc/(FMSYc + Mdb)) * (1 - exp(-(FMSYc + Mdb)))
    MSYc <- Kc * BMSY_K * UMSYc
    TAC[DBSRAcount] <- UMSYc * Kc * Bt_K
    FMSYstore[DBSRAcount] <- UMSYc

    if(!is.null(hcr)) {
      if (length(hcr)!=2) stop("hcr must be numeric vector of length 2")
      # 40-10 rule
      if (Bt_K < hcr[1] & Bt_K > hcr[2])  TAC[DBSRAcount] <- TAC[DBSRAcount] * (Bt_K - hcr[2])/(hcr[1]-hcr[2])
      if (Bt_K < hcr[2]) TAC[DBSRAcount] <- TAC[DBSRAcount] * tiny  # this has to still be a numeric value, albeit very small
    }
    DBSRAcount <- DBSRAcount + 1

  }  # end of reps
  list(TAC=TAC, Btrend=Btrend, C_hist=C_hist, Bt_Kstore=Bt_Kstore, FMSY_Mstore=FMSY_Mstore,
       BMSY_K_Mstore=BMSY_K_Mstore, hcr=hcr, FMSYstore=FMSYstore)

}
