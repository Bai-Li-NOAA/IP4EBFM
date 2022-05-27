#' Generate frequently used input data for JABBA
#'
#' @param assessment_name name of the assessment
#' @param output_dir A file path to a directory where the assessment output will be saved.
#' @param sa_data Simulated stock assessment input data from Rscript/simulation.R.
#' @param model_year A vector of years for model fitting.
#' @param projection_year A vector of years for projection.
#' @param tacs A vector of total allowable catch values for projection.
#' @return A list of initial input values
#' @examples
#' \dontrun{
#' generate_jabba(output_dir = here::here("data", "data_moderate"))
#' }
#' @export
generate_jabba <- function(assessment_name, output_dir,
                           sa_data, model_year, projection_year,
                           tacs=NULL) {

  dir.create(output_dir, showWarnings = F)

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
  if (is.null(tacs)) {
    catch_last <- tail(catch$Total, n = 1)
    tacs <- c(catch_last * 0.5, catch_last, catch_last * 1.5)
  }

  jabba_input <- JABBA::build_jabba(
    catch = catch,
    cpue = cpue,
    se = se,
    assessment = assessment_name,
    scenario = "case0",
    model.type = "Pella_m",
    add.catch.CV = FALSE,
    catch.cv = 0.1,
    catch.error = c("random", "under")[1],
    r.dist = c("lnorm", "range")[1],
    r.prior = c(0.6, 0.5), # 0.6: time-varying intrinsic growth rate from https://doi.org/10.3389/fmars.2021.608059
    # r.prior = c(0.6, 0.1),
    K.dist = c("lnorm", "range")[1],
    K.prior = c(6500000, 0.8), # 6500000: max(catch$Total)*10
    #K.prior = c(4000000, 0.2),
    projection = TRUE,
    TACs = tacs,
    pyrs = length(projection_year),
    catch.metric = "mt"
  )

  return(jabba_input)
}
