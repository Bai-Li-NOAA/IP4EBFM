#' Generate frequently used input data for Stock Synthesis 3
#'
#' @param file_path A file path to a directory where the assessment input and output files will be saved.
#' @param r0 UNexploited recruitment from Beverton-Holt stock-recruitment model.
#' @param steepness Steepness from Beverton-Holt stock-recruitment model. Recruitment relative to unfished recruitment at 20% of unfished spawning biomass.
#' @param sigmar Standard deviation of log recruitment.
#' @param projection_f Fishing mortality inputs for projections.
#' @param projection_catch Catch inputs for projections.
#' @param sa_data Simulated stock assessment input data from Rscript/simulation.R.
#' @param model_year A vector of years for model fitting.
#' @param projection_year A vector of years for projection.
#' @param use_depletion A logical value.
#' @param depletion_ratio Ratio of depletion.
#' @param initial_equilibrium_catch
#' @import r4ss
#' @return Outputs from Stock Synthesis 3
#' @examples
#' \dontrun{
#' generate_ss3(
#'   file_path  = here::here("data", "data_rich"),
#'   r0 = 12, steepness = 0.5, sigmar =0.25,
#'   projection_f = 0.75, projection_catch = NULL,
#'   sa_data = sa_data, model_year = 1985:2012,
#'   projection_year = 2013:2017,
#'   use_depletion = FALSE, depletion_ratio = NULL
#' )
#' }
#' @export
generate_ss3 <- function(file_path, r0, steepness, sigmar,
                         projection_f, projection_catch = NULL,
                         sa_data, model_year, projection_year,
                         use_depletion = FALSE, depletion_ratio = NULL, initial_equilibrium_catch=TRUE) {
  # Write data.ss  ------------------------------------------

  ss3_data <- r4ss::SS_readdat(
    verbose = FALSE,
    file = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "data", full.names = TRUE)
  )

  ss3_data$styr <- model_year[1]
  ss3_data$endyr <- tail(model_year, n = 1)
  ss3_data$spawn_month <- 1.00001 # default is 1
  #ss3_data$Nsexes <- sa_data$biodata$nsex
  ss3_data$Nsexes <- ss3_data$Ngenders <- (-1) # use -1 for 1 sex setup with SSB multiplied by female_frac parameter
  ss3_data$Nages <- length(sa_data$biodata$ages)
  ss3_data$N_areas <- sa_data$biodata$narea

  ss3_data$Nfleet <- length(sa_data$fishery$obs_total_catch_biomass)
  fleet_name <- names(sa_data$fishery$obs_total_catch_biomass)

  survey_id <- 1:2
  # survey_id <- 1:4
  ss3_data$Nsurveys <- length(survey_id)
  #ss3_data$Nsurveys <- length(sa_data$survey$obs_abundance_index) # all 4 surveys

  survey_name <- names(sa_data$survey$obs_abundance_index)[survey_id] # first and second survey
  #survey_name <- names(sa_data$survey$obs_abundance_index) # all 4 surveys
  survey_time <- sapply(1:length(survey_name), function(x) unique(sa_data$survey$om_baa[[x]]$month))

  ss3_data$Nfleets <- ss3_data$Nfleet + ss3_data$Nsurveys

  if (depletion) {
    survey_name <- c(names(sa_data$survey$obs_abundance_index)[survey_id], "Depl")
    survey_time <- c(sapply(survey_id, function(x) unique(sa_data$survey$om_baa[[x]]$month)), 0.1)

    ss3_data$Nsurveys <- length(survey_id) + 1
    ss3_data$Nfleets <- ss3_data$Nfleet + ss3_data$Nsurveys

  }



  ss3_data$fleetinfo <- data.frame(
    "type" = c(rep(1, ss3_data$Nfleet), rep(3, ss3_data$Nsurveys)),
    "surveytiming" = c(-1, survey_time),
    "area" = rep(1, ss3_data$Nfleets),
    "units" = c(1, rep(2, ss3_data$Nsurveys)),
    "need_catch_mult" = rep(0, ss3_data$Nfleets),
    "fleetname" = c(fleet_name, survey_name)
  )

  if (depletion) {
    ss3_data$fleetinfo <- data.frame(
      "type" = c(rep(1, ss3_data$Nfleet), rep(3, ss3_data$Nsurveys)),
      "surveytiming" = c(-1, survey_time),
      "area" = rep(1, ss3_data$Nfleets),
      "units" = c(1, rep(2, length(survey_id)), 1),
      "need_catch_mult" = rep(0, ss3_data$Nfleets),
      "fleetname" = c(fleet_name, survey_name)
    )
  }

  ss3_data$fleetnames <- c(fleet_name, survey_name)
  ss3_data$surveytiming <- c(-1, survey_time)

  ss3_data$units_of_catch <- ss3_data$fleetinfo$units

  fleet_year_id <- names(sa_data$fishery$obs_total_catch_biomass$fleet1) %in% model_year
  ss3_data$catch <- data.frame(
    year = model_year,
    seas = 1,
    fleet = 1,
    catch = sa_data$fishery$obs_total_catch_biomass$fleet1[fleet_year_id],
    catch_se = sa_data$fishery$om_cv[fleet_year_id]
  )

  if (initial_equilibrium_catch) ss3_data$catch <- rbind(c(-999, 1, 1, 0.1, 0.05), ss3_data$catch)

  ss3_data$CPUEinfo <- data.frame(
    Fleet = 1:ss3_data$Nfleets,
    Units = c(1, rep(0, ss3_data$Nsurveys)),
    Errtype = 0,
    SD_Report = 0
  )

  if (any(survey_id %in% 4)) {
    ss3_data$CPUEinfo <- data.frame(
      Fleet = 1:ss3_data$Nfleets,
      Units = c(1, rep(0, ss3_data$Nsurveys-1), 33),
      Errtype = 0,
      SD_Report = 0
    )
  }

  if (depletion) {
    ss3_data$CPUEinfo <- data.frame(
      Fleet = 1:ss3_data$Nfleets,
      Units = c(1, rep(0, length(survey_id)), 34),
      Errtype = 0,
      SD_Report = 0
    )
  }
  row.names(ss3_data$CPUEinfo) <- ss3_data$fleetnames

  cpue_data <- list()
  for (i in survey_id) {
    survey_years <- model_year[model_year %in% names(sa_data$survey$obs_abundance_index[[i]])]
    cpue_data[[i]] <- data.frame(
      year = survey_years,
      seas = unique(sa_data$survey$om_baa[[i]]$month),
      index = i + 1,
      obs = sa_data$survey$obs_abundance_index[[i]][as.character(survey_years)]/1000,
      se_log = sa_data$survey$om_cv[[i]][as.character(survey_years)]
    )
  }

  ss3_data$CPUE <- do.call(rbind, cpue_data)

  if (depletion) {
    ss3_data$CPUE <- rbind (
      ss3_data$CPUE,
      # c(model_year[1], 1, ss3_data$Nfleets, 1, 0.1),
      # c(tail(model_year, n=1), 1, ss3_data$Nfleets, depletion_ratio, 0.1)
      c(model_year[1], 1, ss3_data$Nfleets, 1, 0.0001),
      c(tail(model_year, n=1), 1, ss3_data$Nfleets, depletion_ratio, 0.0001)
    )
  }

  # set up population length bin structure
  ss3_data$lbin_method <- 2
  ss3_data$binwidth <- sa_data$biodata$bin_width
  ss3_data$minimum_size <- sa_data$biodata$length_bin[1]
  ss3_data$maximum_size <- tail(sa_data$biodata$length_bin, n = 1)
  ss3_data$lbin_vector <- sa_data$biodata$length_bin
  ss3_data$N_lbins <- length(ss3_data$lbin_vector)
  ss3_data$use_lencomp <- 1
  ss3_data$comp_tail_compression <- rep(-0.0001, times = ss3_data$Nfleets)
  ss3_data$add_to_comp <- rep(1e-5, times = ss3_data$Nfleets)
  ss3_data$len_info <- data.frame(
    mintailcomp = rep(0, times = ss3_data$Nfleets),
    addtocomp = 1e-5,
    combine_M_F = 0,
    CompressBins = 0,
    CompError = 0,
    ParmSelect = 0,
    minsamplesize = 1
  )

  if (depletion) {
    ss3_data$len_info <- data.frame(
      mintailcomp = rep(0, times = ss3_data$Nfleets-1),
      addtocomp = 1e-5,
      combine_M_F = 0,
      CompressBins = 0,
      CompError = 0,
      ParmSelect = 0,
      minsamplesize = 1
    )
    ss3_data$len_info <- rbind(
      ss3_data$len_info,
      c(-1, 0.001, 0, 0, 0, 0, 0)
    )
  }

  row.names(ss3_data$len_info) <- ss3_data$fleetnames

  lencomp <- list()
  for (i in survey_id) {
    year <- as.numeric(row.names(na.omit(sa_data$survey$obs_lencomp_num_ss3[[i]])))
    year_id <- year[year %in% model_year]
    if (length(year_id) == 0) {
      lencomp[[i]] <- NA
    } else {
      lencomp[[i]] <- data.frame(
        Yr = year_id,
        Seas = unique(sa_data$survey$om_baa[[i]]$month),
        FltSvy = i + 1,
        Gender = 0,
        Part = 0,
        Nsamp = sa_data$survey$om_sample_number[[i]][as.character(year_id)]
      )
      lencomp[[i]] <- cbind(lencomp[[i]], sa_data$survey$obs_lencomp_num_ss3[[i]][as.character(year_id), ])
    }
  }
  ss3_data$lencomp <- do.call(rbind, lencomp)
  ss3_data$lencomp <- na.omit(ss3_data$lencomp)

  # set up population age bin structure
  ss3_data$N_agebins <- length(sa_data$biodata$ages)
  ss3_data$agebin_vector <- sa_data$biodata$ages+1 # make sure the starting age is 1 instead of 0
  ss3_data$N_ageerror_definitions <- 1
  ss3_data$ageerror <- matrix(c(rep(-1, ss3_data$Nages + 1), rep(0, ss3_data$Nages + 1)), nrow = 2, byrow = TRUE)

  ss3_data$age_info <- data.frame(
    mintailcomp = rep(0, times = ss3_data$Nfleets),
    addtocomp = 1e-7,
    combine_M_F = 1,
    CompressBins = 0,
    CompError = 0,
    ParmSelect = 0,
    minsamplesize = 0.001
  )

  if (depletion) {
    ss3_data$age_info <- data.frame(
      mintailcomp = rep(0, times = ss3_data$Nfleets - 1),
      addtocomp = 1e-7,
      combine_M_F = 1,
      CompressBins = 0,
      CompError = 0,
      ParmSelect = 0,
      minsamplesize = 0.001
    )

    ss3_data$age_info <- rbind(
      ss3_data$age_info,
      c(-1, 0.001, 0, 0, 0, 0, 0)
    )
  }
  row.names(ss3_data$age_info) <- ss3_data$fleetnames

  ss3_data$Lbin_method <- 1 # for age data

  year <- as.numeric(row.names(sa_data$fishery$obs_caa_prop$fleet1))
  year_id <- year[year %in% model_year]
  agecomp <- data.frame(
    Yr = year_id,
    Seas = 1,
    FltSvy = 1,
    Gender = 0,
    Part = 0,
    Ageerr = 1,
    Lbin_lo = 1,
    Lbin_hi = -1,
    Nsamp = sa_data$fishery$om_sample_number[as.character(year_id)]
  )
  agecomp <- cbind(agecomp, sa_data$fishery$obs_caa_prop$fleet1[as.character(year_id), ])
  ss3_data$agecomp <- agecomp

  ss3_data$use_MeanSize_at_Age_obs <-
    ss3_data$N_environ_variables <-
    ss3_data$N_sizefreq_methods <-
    ss3_data$do_tags <-
    ss3_data$morphcomp_data <-
    ss3_data$use_selectivity_priors <- 0

  ss3_data$MeanSize_at_Age_obs <- NULL
  r4ss::SS_writedat(
    datlist = ss3_data, verbose = FALSE, outfile = file.path(file_path, "data.ss"),
    overwrite = TRUE
  )

  # Write control.ss  -----------------------------------------------
  # Load SS3 default control.ss
  ss3_ctl <- r4ss::SS_readctl(
    verbose = FALSE,
    file = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "control", full.names = TRUE),
    use_datlist = TRUE,
    datlist = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "data", full.names = TRUE)
  )

  ss3_ctl$recr_dist_method <- 4
  ss3_ctl$recr_dist_pattern$age <- 1
  ss3_ctl$N_Block_Designs <- 0 # Change to 0?
  #ss3_ctl$Block_Design[[1]] <- c(model_year[1], model_year[1])

  # Natural mortality
  #Age specific M
  ss3_ctl$natM_type <- 3
  ss3_ctl$natM <- as.data.frame(c(sa_data$biodata$natural_mortality_matrix[1, 1], sa_data$biodata$natural_mortality_matrix[1, ]))

  # Growth model
  ss3_ctl$GrowthModel <- 1 # vonBert with L1 &L2
  ss3_ctl$Growth_Age_for_L1 <- 0
  ss3_ctl$Growth_Age_for_L2 <- 999 # use as Linf
  ss3_ctl$Exp_Decay <- (-998) # not allow growth above maxage

  # Maturity
  ss3_ctl$maturity_option <- 3 # age-based

  ss3_ctl$Age_Maturity <- data.frame(t(c(0, sa_data$biodata$maturity_matrix[1, ])))


  ss3_ctl$First_Mature_Age <- 2
  ss3_ctl$fecundity_option <- 1 # 1: eggs=Wt*(a+b*Wt)

  # Growth parameters

  if (ss3_data$Nsexes == 1 | ss3_data$Nsexes == -1) {
    ss3_ctl$MG_parms <- ss3_ctl$MG_parms[-grep("Mal", rownames(ss3_ctl$MG_parms)), ]
  }

  if (ss3_ctl$natM_type == 0) ss3_ctl$MG_parms[grep("NatM", rownames(ss3_ctl$MG_parms)), ] <- c(0, 2, median(sa_data$biodata$natural_mortality_matrix[1,]), 0, 99, 0, 3, 0, 0, 0, 0, 0, 0, 0, 2)
  if (ss3_ctl$natM_type == 3) ss3_ctl$MG_parms <- ss3_ctl$MG_parms[-grep("NatM", rownames(ss3_ctl$MG_parms)), ]

  l_at_amin <- round(mean(sa_data$survey$om_laa$age0))
  l_at_amax <- round(mean(sa_data$survey$om_laa$age6), digits=0)

  ss3_ctl$MG_parms[grep("L_at_Amin", rownames(ss3_ctl$MG_parms)), ] <-
    c(1, 15, l_at_amin, 0, 99, 0, -3, 0, 0, 0, 0, 0, 0, 0, 2)
  ss3_ctl$MG_parms[grep("L_at_Amax", rownames(ss3_ctl$MG_parms)), ] <-
    c(40, 50, l_at_amax, 0, 99, 0, -3, 0, 0, 0, 0, 0, 0, 0, 2)
  ss3_ctl$MG_parms[grep("VonBert_K", rownames(ss3_ctl$MG_parms)), ] <-
    c(5e-02, 0.99, sa_data$biodata$k, 0, 99, 0, -3, 0, 0, 0, 0, 0, 0, 0, 2)
  ss3_ctl$MG_parms[grep("CV_young", rownames(ss3_ctl$MG_parms)), ] <-
    c(0.05, 0.3, 0.25, 0, 99, 0, 3, 0, 0, 0, 0, 0, 0, 0, 2)
  ss3_ctl$MG_parms[grep("CV_old", rownames(ss3_ctl$MG_parms)), ] <-
    c(0.05, 0.2, 0.09, 0, 99, 0, 3, 0, 0, 0, 0, 0, 0, 0, 2)
  ss3_ctl$MG_parms[grep("Wtlen_1", rownames(ss3_ctl$MG_parms)), ] <-
    c(-3, 3, sa_data$biodata$lw_a, 0, 99, 0, -3, 0, 0, 0, 0, 0, 0, 0, 3)
  ss3_ctl$MG_parms[grep("Wtlen_2", rownames(ss3_ctl$MG_parms)), ] <-
    c(-3, 4, sa_data$biodata$lw_b, 0, 99, 0, -3, 0, 0, 0, 0, 0, 0, 0, 3)

  ss3_ctl$MG_parms[grep("Frac", rownames(ss3_ctl$MG_parms)), ] <- c(0.000001, 0.99, 0.5, 0.5, 0.5, 0, -1, 0, 0, 0, 0, 0, 0, 0, 14)

  ss3_ctl$MG_parms <- ss3_ctl$MG_parms[-grep("RecrDist", rownames(ss3_ctl$MG_parms)), ]

  # Stock-recruitment
  fmult_y1 <- 0.1
  m_y1 <- median(sa_data$biodata$natural_mortality_matrix[1,])
  naa_y1 <- (0.9 / (m_y1 + fmult_y1)) * ss3_data$catch$catch / (1 - exp(-m_y1 - fmult_y1))

  if (naa_y1[1] %in% sort(naa_y1)[1:round(length(naa_y1)/5)]) naa_y1[1] <- 10*mean(naa_y1)

  ss3_ctl$SR_function <- 3 # 3: B-H
  #ss3_ctl$SR_parms[grep("R0", rownames(ss3_ctl$SR_parms)), "INIT"] <- log(naa_y1[1])
  ss3_ctl$SR_parms[grep("R0", rownames(ss3_ctl$SR_parms)), "INIT"] <- r0
  ss3_ctl$SR_parms[grep("steep", rownames(ss3_ctl$SR_parms)), "INIT"] <- steepness
  ss3_ctl$SR_parms[grep("steep", rownames(ss3_ctl$SR_parms)), "PHASE"] <- -4
  ss3_ctl$SR_parms[grep("steep", rownames(ss3_ctl$SR_parms)), "PR_type"] <- 0
  ss3_ctl$SR_parms[grep("sigma", rownames(ss3_ctl$SR_parms)), "INIT"] <-  sigmar # recommended value from SS3
  ss3_ctl$SR_parms[grep("sigma", rownames(ss3_ctl$SR_parms)), "PHASE"] <- -2

  # Recruitment bias adjustment
  ss3_ctl$MainRdevYrFirst <- ss3_data$styr
  ss3_ctl$MainRdevYrLast <- ss3_data$endyr
  ss3_ctl$recdev_phase <- 2
  ss3_ctl$recdev_early_phase <- 2
  ss3_ctl$Fcast_recr_phase <- 0
  ss3_ctl$lambda4Fcast_recr_like
  ss3_ctl$last_early_yr_nobias_adj <- -999 # ss3_data$styr - 1
  ss3_ctl$first_yr_fullbias_adj <- -(ss3_data$Nages-1) #ss3_data$styr
  ss3_ctl$last_yr_fullbias_adj <- ss3_data$endyr
  ss3_ctl$first_recent_yr_nobias_adj <- ss3_data$endyr + 1
  ss3_ctl$max_bias_adj <- 1 # or 0?

  # Fishing mortality
  ss3_ctl$F_ballpark_year <- ss3_data$endyr
  ss3_ctl$F_Method <- 3
  ss3_ctl$maxF <- 10
  ss3_ctl$F_iter <- 4
  if (initial_equilibrium_catch) ss3_ctl$init_F <- data.frame(
    "LO" = 0,
    "HI" = 2,
    "INIT" = 0.3,
    "PRIOR" = 0.3,
    "PR_SD" = 0.2,
    "PR_type" = 0,
    "PHASE" = 1,
    "PType" = 18
  )

  # Catchability
  ss3_ctl$Q_options <- data.frame(
    fleet = 2:(ss3_data$Nsurveys + 1),
    link = 1,
    link_info = 1,
    extra_se = 0,
    biasadj = 0,
    float = 0
  )

  if (depletion) {
    ss3_ctl$Q_options <- data.frame(
      fleet = 2:(ss3_data$Nsurveys),
      link = 1,
      link_info = 1,
      extra_se = 0,
      biasadj = 0,
      float = 0
    )

    ss3_ctl$Q_options <- rbind(
      ss3_ctl$Q_options,
      c(ss3_data$Nfleets, 1, 0, 0, 0, 0)
    )

  }
  row.names(ss3_ctl$Q_options) <- ss3_data$fleetnames[-1]

  ss3_ctl$Q_parms <- rbind(data.frame(
    "LO" = rep(-10, ss3_data$Nsurveys),
    "HI" = rep(10, ss3_data$Nsurveys),
    "INIT" = log(jitter(rep(0.05, ss3_data$Nsurveys), 30)),
    "PRIOR" = rep(0, ss3_data$Nsurveys),
    "SD" = rep(0, ss3_data$Nsurveys),
    "PR_TYPE" = rep(0, ss3_data$Nsurveys),
    "PHASE" = rep(1, ss3_data$Nsurveys),

    matrix(0, ncol = 7, nrow = ss3_data$Nsurveys)
  ))

  if (depletion) {
    ss3_ctl$Q_parms <- rbind(data.frame(
      "LO" = rep(-10, ss3_data$Nsurveys),
      "HI" = rep(10, ss3_data$Nsurveys),
      "INIT" = c(log(jitter(rep(0.05, length(survey_id)), 30)), 0),
      "PRIOR" = rep(0, ss3_data$Nsurveys),
      "SD" = rep(0, ss3_data$Nsurveys),
      "PR_TYPE" = rep(0, ss3_data$Nsurveys),
      "PHASE" = c(rep(1, length(survey_id)), -1),

      matrix(0, ncol = 7, nrow = ss3_data$Nsurveys)
    ))
  }

  # Selectivity
  ss3_ctl$size_selex_types <- data.frame(
    Pattern = rep(0, ss3_data$Nfleets),
    Discard = 0,
    Male = 0,
    Special = 0
  )
  row.names(ss3_ctl$size_selex_types) <- ss3_data$fleetnames

  ss3_ctl$age_selex_types <- data.frame(
    Pattern = c(19, 19, 19),
    Discard = 0,
    Male = 0,
    Special = 0
  )

  if (length(survey_id) == 4){
    ss3_ctl$age_selex_types <- data.frame(
      Pattern = c(19, 12, 19, 19, 11),
      Discard = 0,
      Male = 0,
      Special = 0
    )
  }

  if (depletion) {
    ss3_ctl$age_selex_types <- data.frame(
      Pattern = c(19, 12, 19, 0),
      #Pattern = c(19, 12, 19, 19, 11),
      Discard = 0,
      Male = 0,
      Special = 0
    )
  }
  row.names(ss3_ctl$age_selex_types) <- ss3_data$fleetnames

  colname <- colnames(ss3_ctl$age_selex_parms)
  ss3_ctl$size_selex_parms <- NULL
  ss3_ctl$age_selex_parms <- rbind(
    # Fleet 1
    data.frame(
      Lo = rep(0, 6),
      Hi = max(ss3_data$agebin_vector),
      INIT = c(1.8, 3.1, 0.01, 0.88, 1, 0.1),
      PRIOR = 0,
      SD = 99,
      PR_TYPE = 0,
      PHASE = c(2, 2, -2, 2, 2, -2),
      matrix(0, ncol = 7, nrow = 6)
    ),

    # Survey 1
    data.frame(
      Lo = rep(0, 6),
      Hi = max(ss3_data$agebin_vector),
      INIT = c(2.3, 4.3, 2.3, 3.5, 1, 0.1),
      PRIOR = 0,
      SD = 99,
      PR_TYPE = 0,
      PHASE = 2,
      matrix(0, ncol = 7, nrow = 6)
    ),

    # Survey 2
    data.frame(
      Lo = rep(0, 6),
      Hi = max(ss3_data$agebin_vector),
      INIT = c(2.3, 4.3, 2.3, 3.5, 1, 0.1),
      PRIOR = 0,
      SD = 99,
      PR_TYPE = 0,
      PHASE = 2,
      matrix(0, ncol = 7, nrow = 6)
    )
  )

  if (length(survey_id) == 4){
    ss3_ctl$age_selex_parms <- rbind(
      # Fleet 1
      data.frame(
        Lo = rep(0, 6),
        Hi = max(ss3_data$agebin_vector),
        INIT = c(2, 3, 3.5, 3, 1, 0.1),
        PRIOR = 0,
        SD = 99,
        PR_TYPE = 0,
        PHASE = 2,
        matrix(0, ncol = 7, nrow = 6)
      ),

      # Survey 1
      data.frame(
        Lo = c(0, 0),
        Hi = c(max(ss3_data$agebin_vector), max(ss3_data$agebin_vector)),
        INIT = c(3.0, 3.0),
        PRIOR = c(0, 0),
        SD = c(99, 99),
        PR_TYPE = 0,
        PHASE = 2,
        matrix(0, ncol = 7, nrow = 2)
      ),

      # Survey 2
      data.frame(
        Lo = rep(0, 6),
        Hi = max(ss3_data$agebin_vector),
        INIT = c(2.3, 4.3, 2.3, 3.5, 1, 0.1),
        PRIOR = 0,
        SD = 99,
        PR_TYPE = 0,
        PHASE = 2,
        matrix(0, ncol = 7, nrow = 6)
      ),

      # Survey 3
      data.frame(
        Lo = rep(0, 6),
        Hi = 10,
        INIT = c(0.3, 7.0, 2.0, 7.0, 1, 0.1),
        PRIOR = 0,
        SD = 99,
        PR_TYPE = 0,
        PHASE = 2,
        matrix(0, ncol = 7, nrow = 6)
      ),

      # Survey 4
      data.frame(
        Lo = c(1, 1),
        Hi = c(1, 1),
        INIT = c(1, 1),
        PRIOR = c(0, 0),
        SD = c(99, 99),
        PR_TYPE = 0,
        PHASE = 2,
        matrix(0, ncol = 7, nrow = 2)
      )
    )
  }

  colnames(ss3_ctl$age_selex_parms) <- colname

  ss3_ctl$N_lambdas <- 1
  ss3_ctl$lambdas <- data.frame(
    like_comp = 9,
    fleet = 1,
    phase = 1,
    value = 0,
    sizefreq_method = 1
  )
  ss3_ctl$more_stddev_reporting <- 0
  r4ss::SS_writectl(ctllist = ss3_ctl,
                    outfile = file.path(file_path, "control.ss"),
                    overwrite = TRUE, verbose = TRUE, version = "3.30"
  )

  # Write starter.ss  ------------------------------------

  ss3_starter <- r4ss::SS_readstarter(
    verbose = FALSE,
    file = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "starter", full.names = TRUE)
  )

  ss3_starter$sourcefile <- file.path(file_path, "starter.ss")
  ss3_starter$datfile <- "data.ss"
  ss3_starter$ctlfile <- "control.ss"
  ss3_starter$F_age_range <- range(ss3_data$agebin_vector)

  ss3_starter$F_report_units <- 3
  ss3_starter$F_report_basis <- 0
  #ss3_starter$F_age_range <- c(sa_data$biodata$ages[1], ss3_data$Nages-2)

  r4ss::SS_writestarter(ss3_starter,
                        dir = file.path(file_path),
                        overwrite = TRUE, warn = FALSE, verbose = FALSE
  )

  # Write forecast.ss  ------------------------------------

  ss3_forecast <- r4ss::SS_readforecast(
    verbose = FALSE,
    file = dir(utils::tail(dir(system.file("extdata", package = "r4ss"), pattern = "simple", full.names = TRUE), 1), pattern = "forecast", full.names = TRUE)
  )

  ss3_forecast$sourcefile <- paste0(file_path, "forecast.ss")
  ss3_forecast$benchmarks <- 1
  ss3_forecast$MSY <- 2
  ss3_forecast$SPRtarget <- 0.4
  ss3_forecast$Btarget <- 0.4
  ss3_forecast$Bmark_years <- rep(ss3_data$endyr, 10)
  ss3_forecast$Bmark_relF_Basis <- 1
  ss3_forecast$Forecast <- 2
  ss3_forecast$Nforecastyrs <- length(projection_year)
  ss3_forecast$F_scalar <- 0
  ss3_forecast$Fcast_years <- rep(0, 6)
  ss3_forecast$Fcast_selex <- 0
  ss3_forecast$ControlRuleMethod <- 2
  ss3_forecast$BforconstantF <- 0.4
  ss3_forecast$BfornoF <- 0.1
  ss3_forecast$Flimitfraction <- 0.75
  ss3_forecast$N_forecast_loops <- 3
  ss3_forecast$First_forecast_loop_with_stochastic_recruitment <- 3
  ss3_forecast$FirstYear_for_caps_and_allocations <- max(projection_year) + 1
  ss3_forecast$InputBasis <- 99

  ss3_forecast$ForeCatch <- data.frame(
    "Year" = projection_year,
    "Seas" = 1,
    "Fleet" =1,
    "Catch or F" = projection_f
  )

  r4ss::SS_writeforecast(ss3_forecast,
                         dir = file.path(file_path),
                         overwrite = TRUE, verbose = FALSE
  )


}
