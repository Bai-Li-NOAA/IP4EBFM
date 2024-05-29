library(ASSAMC)
devtools::load_all()
working_dir <- getwd()

# Set-up OM (sigmaR = 0.4) ------------------------------------------------

maindir <- tempdir()
model_input <- ASSAMC::save_initial_input()
C1 <- save_initial_input(
  base_case = TRUE,
  input_list = model_input,
  maindir = maindir,
  om_sim_num = 100,
  keep_sim_num = 100,
  figure_number = 10,
  seed_num = 9924,
  case_name = "C1"
)


# generate om_input, om_output, and em_input
# using function from the model comparison project
ASSAMC::run_om(input_list = C1)
setwd(working_dir)



library(DLMtool)
library(JABBA)

om_fmsy <- dbsra_fmsy <- jabba_fmsy <- c()

for (i in 1:100){

  load(file.path(maindir, "C1", "output", "OM", paste0("OM", i, ".RData")))
  om_fmsy[i] <- om_output$msy$Fmsy

  # Data-poor stock assessment ----------------------------------------------
  # Create a blank DLM object
  ss_case0 <- new("Data")
  # Change default area from 2 to 1
  ss_case0@nareas <- 1
  # Name of the case
  ss_case0@Name <- "case0"
  # Catch data
  ss_case0@Cat <- matrix(em_input$L.obs$fleet1,
                         nrow = 1)
  # State units of catch
  ss_case0@Units <- "mt"
  # Years
  ss_case0@Year <- om_input$year
  # Depletion relative to unfished
  BC <- exp(0.5 * om_input$logR_sd^2)
  B0 <- (BC * 0.8 * om_input$R0 * om_input$h * om_input$Phi.0 - 0.2 * om_input$Phi.0 * om_input$R0 * (1 - om_input$h)) / (om_input$h - 0.2)
  ss_case0@Dep <- tail(om_output$biomass.mt, n=1)/B0
  # ss_case0@Dep <- tail(ss_case0@Cat[1, ], n = 1) / max(ss_case0@Cat[1, ])

  # VB maximum growth rate
  ss_case0@vbK <- om_input$K
  # VB theoretical age at zero length
  ss_case0@vbt0 <- om_input$a0
  # VB maximum length
  ss_case0@vbLinf <- om_input$Linf
  # Ratio of FMSY/M
  ss_case0@FMSY_M <- om_output$msy$Fmsy/om_input$M
  ss_case0@Mort <- om_input$M
  ss_case0@CV_Mort <- 0.5
  ss_case0@BMSY_B0 <- om_output$msy$Bmsy / B0
  om_input$mat.age <-
    age_maturity50 <- which(om_input$mat.age > 0.5)[1]
  ss_case0@L50 <- om_input$Linf*(1-exp(-om_input$K*(age_maturity50-om_input$a0)))

  # Run DBSRA, DBSRA_40 and DBSRA4010
  dbsra <- DLMtool::DBSRA(1, ss_case0, plot = FALSE)

  dbsra_output <- IP4EBFM::DBSRA_return_FMSY(
    x = 1,
    Data = ss_case0,
    depo = NULL, # Optional fixed depletion (single value)
    hcr = NULL # Optional harvest control rule for throttling catch as a function of B/B0.
  )

  dbsra_fmsy[i] <- median(dbsra_output$FMSYstore)

  # Data-moderate stock assessment ------------------------------------------------

  jabba_input <- JABBA::build_jabba(
    catch = data.frame(Year = om_input$year, Catch = em_input$L.obs$fleet1),
    cpue = data.frame(Year = om_input$year, Survey = em_input$survey.obs$survey1),
    se = data.frame(Year = om_input$year, Survey = em_input$cv.survey$survey1),
    assessment = "MCP",
    scenario = "case0",
    model.type = "Pella_m",
    add.catch.CV = TRUE,
    # catch.cv = em_input$cv.L$fleet1,
    catch.cv = 0.1,
    catch.error = c("random", "under")[1],
    r.dist = c("lnorm", "range")[1],
    r.prior = c(4*om_output$msy$msy/B0, 0.8),
    # r.prior = c(0.5, 0.8),
    K.dist = c("lnorm", "range")[1],
    # K.prior = c(om_output$msy$Bmsy*2, 0.8),
    K.prior = c(max(em_input$L.obs$fleet1) *10, 0.8),
    projection = TRUE,
    pyrs = 5,
    catch.metric = "mt",
    BmsyK = om_output$msy$Bmsy/B0
  )

  jabba_output <- JABBA::fit_jabba(
    jbinput = jabba_input,
    save.jabba = TRUE,
    save.all = TRUE,
    output.dir = here::here("figure", "jabba_figure"),
    save.csvs = T
  )

  jabba_fmsy[i] <- jabba_output$estimates["Hmsy", "mu"]

}

fmsy_comparison <- cbind(om_fmsy, dbsra_fmsy, jabba_fmsy)
save(fmsy_comparison, file = here::here("data", "fmsy_comparison.RData"))
# jabba_figure_path <- here::here("figure", "jabba_figure")
# if (!dir.exists(jabba_figure_path)) dir.create(jabba_figure_path)
# JABBA::jabba_plots(jabba = jabba_output, output.dir = jabba_figure_path)
#
# plot(om_input$year,
#      om_output$biomass.mt,
#      xlab = "Year", ylab = "Biomass (mt)",
#      ylim = range(om_output$biomass.mt, jabba_output$timeseries[, , "B"]),
#      pch = 16
# )
#
# lines(om_input$year, jabba_output$timeseries[, "mu", "B"])
# lines(om_input$year, jabba_output$timeseries[, "lci", "B"], lty = 2)
# lines(om_input$year, jabba_output$timeseries[, "uci", "B"], lty = 2)
