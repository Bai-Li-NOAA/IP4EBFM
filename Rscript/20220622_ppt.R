
# This R script produces figures for 20220622 presentation

devtools::load_all()
required_pkg <- c(
  "devtools", "here", "reshape",
  "ggplot2", "reshape2",
  "RColorBrewer", "scales", "fmsb",
  "PBSadmb", "ggpubr"
)

pkg_to_install <- required_pkg[!(required_pkg %in%
                                   installed.packages()[, "Package"])]
if (length(pkg_to_install)) install.packages(pkg_to_install)

invisible(lapply(required_pkg, library, character.only = TRUE))

remotes::install_github("giocomai/ganttrify")

# Environmental drivers ---------------------------------------------------
scenario_filename <- "_lowCV"
terminal_year <- 2017
fishery_CV_input <- 0.05
survey_CV_input <- 0.1
add_environmental_effects <- TRUE
add_fleet_dynamics <- FALSE

source(here::here("Rscript", "simulationOM3.R")) # OM reference points
figure_path <- here::here("figure", "20230622_presentation")
# file_path <- here::here("data", "ewe", "7ages_newsim_om3", "ewe7ages_ecosim_om3", "ecosim_forcing_pdsi_egg_amo1")
file_path <- here::here("data", "ewe", "7ages_ecosim_om", "ecosim_forcing_pdsi_egg_amo1")

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
ages <- 0:6
age_name <- paste0("AtlanticMenhaden", ages)

start_year <- 1985
projection_nyear <- 5
model_year <- start_year:terminal_year
projection_year <- (terminal_year+1):(terminal_year+projection_nyear)

biomass <- read_ewe_output(
  file_path = file_path,
  file_names = "biomass_monthly.csv",
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = functional_groups,
  figure_colors = NULL
)

time_id <- seq(1, nrow(biomass[[1]]), by = 12)[1:(length(model_year)+length(projection_year))]
biomass_ewe <- apply(biomass[[1]][, age_name], 1, sum) * 1000000

source(here::here("Rscript", "load_indices.R"))

year_id <- seq(1, nrow(amo_unsmooth_lag1), by = 12)

amo <- amo_unsmooth_lag1[year_id, ]
pdsi <- palmer_drought_severity_index[year_id, ]

figure_data <- data.frame(
  Year = model_year,
  amo = amo$raw_value,
  pdsi = pdsi$raw_value
)

p <- ggplot(figure_data, aes(x=Year, y=amo)) +

  geom_line( lty = 1, color="coral") +
  geom_line( aes(y=pdsi/10), lty = 2, color="blue") +

  scale_y_continuous(

    # Features of the first axis
    name = "Atlantic Multidecadal Oscillation \n with lag",

    # Add a second axis and specify its features
    sec.axis = sec_axis(~.*10, name="Palmer Drought Severity Index")
  ) +

  theme(
    axis.title.y = element_text(color = "coral", size=13),
    axis.title.y.right = element_text(color = "blue", size=13)
  ) +

  ggtitle("Environmental Drivers")

ggsave(file.path(figure_path, paste0("environmental_drivers.png")), p,
       width = 100, height = 80, units = "mm", dpi = 800)

# Fishing mortality patterns ----------------------------------------------
fishing_mortality <- read.csv(here::here(figure_path, "fishing_mortality.csv"))
fishing_mortality_melt <- reshape2::melt(fishing_mortality, id = "Year")

menhaden_f <- which(fishing_mortality_melt$variable %in% paste0("Group", 4:10))
p <- ggplot(fishing_mortality_melt[menhaden_f, ], aes(x = Year, y = value, color = variable)) +
  geom_line() +
  # facet_wrap(~variable, scales = "free_y") +
  labs(
    title = "",
    x = "Year",
    y = "Fishing Mortality"
  ) +
  theme_bw()
ggsave(file.path(figure_path, paste0("fishing_mortality.png")), p,
       width = 100, height = 80, units = "mm", dpi = 800)


# Simulated observation data ----------------------------------------------

project_path <- here::here()
ewe_output_path <- file.path(project_path, "data", "ewe", "7ages_newsim_om3",
                             "ewe7ages_ecosim_om3", "ecosim_forcing_pdsi_egg_amo1")
obs_data <- data.frame (
  Year = model_year,
  Catch = sa_data$fishery$obs_total_catch_biomass$fleet1
  # Survey1 = c(rep(NA, 5), sa_data$survey$obs_biomass_index$survey1),
  # Survey2 = sa_data$survey$obs_biomass_index$survey2
)
obs_data_melt <- reshape2::melt(obs_data, id = "Year")

catch_p <- ggplot(obs_data_melt, aes(x = Year, y = value)) +
  geom_line() +
  labs(
    title = "",
    x = "Year",
    y = "Catch Biomass (mt)"
  ) +
  theme_bw()
ggsave(file.path(figure_path, paste0("obs_catch.png")), catch_p,
        width = 80, height = 80, units = "mm", dpi = 800)

obs_caa_prop <- cbind(model_year, sa_data$fishery$obs_caa_prop$fleet1)
colnames(obs_caa_prop)[1] <- "Year"
obs_caa_prop_melt <- reshape2::melt(obs_caa_prop, id.vars = c("Year"))

year_id <- which(obs_caa_prop_melt$Year %in% seq(1985, 2012, by = 1))
# year_id <- which(obs_caa_prop_melt$Year %in% seq(1985, 2012, by = 4))
caa_p <- ggplot(data=obs_caa_prop_melt[year_id, ], aes(x=variable, fill=variable, y=value)) +
  geom_bar(position='dodge', stat='identity') +
  facet_wrap(~Year, ncol = 7) +
  labs(
    title = "",
    x = "Age",
    y = "Numbers-at-age"
  )+
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, vjust=0.5, size = 7))
ggsave(file.path(figure_path, paste0("obs_caa_prop.png")), caa_p)
ggsave(file.path(figure_path, paste0("obs_caa_prop.png")), caa_p,
        width = 350, height = 350, units = "mm", dpi = 800)

p <- ggpubr::ggarrange(catch_p, caa_p,
               ncol = 1, nrow = 2)

ggsave(file.path(figure_path, paste0("obs_catch_caa.png")), p,
        width = 150, height = 450, units = "mm", dpi = 800)

# Fishing mortality projections -----------------------------------------------

# Run data-rich assessment
# Year 2012 Assessment with low CV in data and without environmental link in the estimation model

figure_path <- here::here("figure", "20230622_presentation")

soi_figure <- ggplot(soi_data_melt[soi_data_melt$projection_year_id == projection_year[1], ], mapping = aes(x = year, y = value)) +
  geom_line() +
  geom_point(soi_data_melt[soi_data_melt$projection_year_id == projection_year[1] & soi_data_melt$year == max(model_year), ],
             mapping = aes(x = year, y = value), col = "red", cex=0.5)+
  facet_wrap(~variable, scales = "free_y", ncol = 2) +
  labs(
    x = "Year",
    y = "Status of Indicators"
  ) +
  theme_bw()+
  theme(axis.text.x = element_text(angle = 45))
ggsave(file.path(figure_path, paste0("status_of_indicators.png")), soi_figure,
       width = 100, height = 100, units = "mm", dpi = 800)

p <- ggplot() +
  geom_line(data = f_data, aes(x = year, y = value, ymax = 6)) +
  geom_line(col='blue') +
  geom_ribbon(aes(x = f_data$year, ymin = f_data$ci_lower, ymax = f_data$ci_upper), alpha = 0.1)+
  labs(
    x = "Year",
    y = "F"
  ) +
  geom_line(data = projection_f[-which(projection_f$variable == "om"), ], aes(x = projection_year_id, col=variable, y = value)) +
  geom_line(data = projection_f[which(projection_f$variable == "SS3"), ], aes(x = projection_year_id, col=variable, y = value * 0.8), lty = 2) +
  geom_line(data = projection_f[which(projection_f$variable == "SS3"), ], aes(x = projection_year_id, col=variable, y = value * 0.9), lty = 2) +
  geom_line(data = projection_f[which(projection_f$variable == "SS3"), ], aes(x = projection_year_id, col=variable, y = value * 1.1), lty = 2) +
  geom_line(data = projection_f[which(projection_f$variable == "SS3"), ], aes(x = projection_year_id, col=variable, y = value * 1.2), lty = 2) +
  theme(panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1], label= bquote(SS3~F[MSY])) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1]*0.8, label= bquote(F[MSY]~x~0.8)) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1]*0.9, label= bquote(F[MSY]~x~0.9)) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1]*1.1, label= bquote(F[MSY]~x~1.1)) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1]*1.2, label= bquote(F[MSY]~x~1.2)) +
  annotate("rect", xmin = min(projection_year)-1, xmax = max(projection_year)+1,
           ymin = projection_f$value[which(projection_f$variable == "SS3")][1]*0.75,
           ymax = projection_f$value[which(projection_f$variable == "SS3")][1]*1.25,
           alpha = .5,fill = "gray") +
  annotate("text", x=projection_year[3], y=projection_f$value[which(projection_f$variable == "SS3")][1]*1.3,
           label= "Default Approaches") +
  annotate("rect", xmin = min(projection_year)-1, xmax = max(projection_year)+1,
           ymax = projection_f$value[which(projection_f$variable == "SS3")][1]*0.47,
           ymin = 0,
           alpha = .1,fill = "blue") +
  annotate("text", x=projection_year[2], y= -0.1,
           label= "Interdisciplinary Approaches", col = "blue")+
  annotation_custom(grob = ggplotGrob(soi_figure), xmin = 1984, xmax = 2001, ymin = 2, ymax =6)


ggsave(file.path(figure_path, paste0("f_approaches.png")), p,
       width = 250, height = 150, units = "mm", dpi = 800)

p <- ggplot() +
  geom_line(data = f_data, aes(x = year, y = value)) +
  geom_line(col='blue') +
  geom_ribbon(aes(x = f_data$year, ymin = f_data$ci_lower, ymax = f_data$ci_upper), alpha = 0.1)+
  labs(
    x = "Year",
    y = "F"
  ) +
  geom_line(data = projection_f[-which(projection_f$variable == "om"), ], aes(x = projection_year_id, col=variable, y = value)) +
  geom_line(data = projection_f[which(projection_f$variable == "SS3"), ], aes(x = projection_year_id, col=variable, y = value * 0.8), lty = 2) +
  geom_line(data = projection_f[which(projection_f$variable == "SS3"), ], aes(x = projection_year_id, col=variable, y = value * 0.9), lty = 2) +
  geom_line(data = projection_f[which(projection_f$variable == "SS3"), ], aes(x = projection_year_id, col=variable, y = value * 1.1), lty = 2) +
  geom_line(data = projection_f[which(projection_f$variable == "SS3"), ], aes(x = projection_year_id, col=variable, y = value * 1.2), lty = 2) +
  theme(panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1], label= bquote(SS3~F[MSY])) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1]*0.8, label= bquote(F[MSY]~x~0.8)) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1]*0.9, label= bquote(F[MSY]~x~0.9)) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1]*1.1, label= bquote(F[MSY]~x~1.1)) +
  annotate("text", x=2009, y=projection_f$value[which(projection_f$variable == "SS3")][1]*1.2, label= bquote(F[MSY]~x~1.2)) +
  annotate("rect", xmin = min(projection_year)-1, xmax = max(projection_year)+1,
           ymin = projection_f$value[which(projection_f$variable == "SS3")][1]*0.75,
           ymax = projection_f$value[which(projection_f$variable == "SS3")][1]*1.25,
           alpha = .5,fill = "gray") +
  annotate("text", x=projection_year[2], y=projection_f$value[which(projection_f$variable == "SS3")][1]*1.3,
           label= "Default Approaches") +
  annotate("rect", xmin = min(projection_year)-1, xmax = max(projection_year)+1,
           ymax = projection_f$value[which(projection_f$variable == "SS3")][1]*0.47,
           ymin = 0,
           alpha = .1,fill = "blue") +
  annotate("text", x=projection_year[1]-2, y= -0.1,
           label= "Interdisciplinary Approaches", col = "blue")


ggsave(file.path(figure_path, paste0("f_approaches_only.png")), p,
       width = 150, height = 80, units = "mm", dpi = 800)


# Projected SB and catch --------------------------------------------------
time_id <- seq(1, nrow(biomass[[1]]), by = 12)[1:(length(model_year))]
sb_history <- ci_calculation(
  distribution = "normal",
  value = derived_quants[paste0("SSB_", model_year), "Value"],
  std = derived_quants[paste0("SSB_", model_year), "StdDev"],
  year = model_year,
  data_type = "SB (mt)",
  ewe_data = ssb_ewe[time_id]
)

sb_timeseries <- ggplot() +
  geom_line(data = sb_history, mapping = aes(x = year, y = value)) +
  geom_ribbon(mapping = aes(x = sb_history$year, ymin = sb_history$ci_lower, ymax = sb_history$ci_upper), alpha = 0.1)+
  labs(
    x = "",
    y = "SB (mt)"
  ) +
  geom_line(om_projection, mapping = aes(x = projection_year_id, y = ssb, color = variable)) +
  geom_point(om_projection, mapping = aes(x = projection_year_id, y = ssb, color = variable)) +
  annotate("rect", xmin = min(projection_year)-1, xmax = max(projection_year)+1,
           ymax = max(om_projection$ssb)*1.1,
           ymin = 0,
           alpha = .2,fill = "gray") +
  annotate("text", x=projection_year[3], y= max(om_projection$ssb)*1.2,
           label= "Projections") +
  theme_bw()

catch_history <- data.frame(
  Year = model_year,
  obs = ss3list$timeseries$`obs_cat:_1`[which(ss3list$timeseries$Yr %in% model_year)],
  exp = ss3list$timeseries$`dead(B):_1`[which(ss3list$timeseries$Yr %in% model_year)]
)

catch_timeseries <- ggplot() +
  geom_line(data = catch_history, mapping = aes(x = Year, y = exp)) +
  geom_point(data = catch_history, mapping = aes(x = Year, y = obs)) +
  labs(
    x = "",
    y = "Landings (mt)"
  ) +
  geom_line(om_projection, mapping = aes(x = projection_year_id, y = catch, color = variable)) +
  geom_point(om_projection, mapping = aes(x = projection_year_id, y = catch, color = variable)) +
  annotate("rect", xmin = min(projection_year)-1, xmax = max(projection_year)+1,
           ymax = max(om_projection$catch)*1.02,
           ymin = 0,
           alpha = .2,fill = "gray") +
  annotate("text", x=projection_year[3], y= max(om_projection$catch)*1.05,
           label= "Projections") +
  theme_bw()


p <- ggpubr::ggarrange(sb_timeseries,
                       catch_timeseries,
                       ncol = 2, nrow = 1)
ggsave(file.path(figure_path, paste0("sb_catch_projections.png")), p,
       width = 250, height = 100, units = "mm", dpi = 800)

write.csv(evaluation_table, file = file.path(figure_path, "evaluation_table.csv"))


# Timeline ----------------------------------------------------------------

timeline <- tibble::tibble(
  wp = c(rep("Project initialization phase", 3),
         rep("Design phase", 2),
         rep("Plan phase", 2),
         rep("Implementation phase", 2)),
  activity = c("Finalize white paper", "Invite collaborators", "Discuss project scope",
               "Review literatures", "Finalize experimental design",
               "Construct operating model", "Form small implementation teams",
               "Quantitative analyses", "Evaluation, discussion and writing"
               ),
  start_date = c(1, 4, 6, 8, 10, 14, 16, 18, 20),
  end_date = c(4, 5, 7, 10, 13, 16, 18, 30, 30))

png(filename=file.path(figure_path, "timeline.png"), width = 150, height = 100, units = "mm", res = 800)
ganttrify::ganttrify(project = timeline,
          project_start_date = "2021-01",
          month_breaks = 3,
          axis_text_align = "left",
          font_family = "Roboto Condensed")
dev.off()
