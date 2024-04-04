#' Read in EwE output data and make figures
#'
#' @description It reads in the output data from Ecopath with Ecosim (EwE) and making figures for each dataset. The timestep of the output data needs to be year. The rows of the data matrix represents years and the columns of the data represents functional groups. It creates figures and save the figures where EwE output csv files are located. The potential data include: biomass, catch, consumption biomass, feeding time, mortality, trophic level, and average weight (or production to comsumption) over years.
#'
#' @param file_path a character string shows path to the working folder where EwE output csv files are located.
#' @param file_names a vector of csv file names.
#' @param skip_nrows integer: the number of lines of the data file to skip before reading data.
#' @param colname_1 column name of the first column. Default name is Year. The other option is FM (fishing mortality) for reading output from FMSY analysis.
#' @param functional_groups a character string describes the column of the data matrix, which is functional groups in EwE case.
#' @param plot logical: if `TRUE` then make figures for all output data files.
#' @param figure_titles a character vector of strings describes the names of each figure.
#' @param figure_colors a vector of colors.
#' @export

read_ewe_output <- function(file_path,
                            file_names,
                            skip_nrows = 8,
                            colname_1 = "Year",
                            functional_groups,
                            plot = FALSE,
                            figure_titles = NULL,
                            figure_colors = rainbow(12)) {
  data <- vector(mode = "list", length = length(file_names))

  for (file_id in 1:length(file_names)) {
    temp <- scan(file.path(file_path, file_names[file_id]), what = "", sep = "\n")
    data[[file_id]] <- temp[-c(1:skip_nrows)]
    data[[file_id]] <- read.table(
      text = as.character(data[[file_id]]),
      sep = ",",
      col.names = c(colname_1, functional_groups)
    )
  }

  if (plot == TRUE) {
    graphics.off()
    windows()
    pdf(file = file.path(file_path, "ewe_all_figures.pdf"), onefile = T)

    for (figure_id in 1:length(file_names)) {
      par(mar = c(5.1, 4.1, 4.1, 10), xpd = TRUE)

      plot(NULL,
        xlab = colname_1,
        ylab = figure_titles[figure_id],
        xlim = range(data[[figure_id]][, 1]),
        ylim = range(data[[figure_id]][, 2:ncol(data[[figure_id]])])
      )

      for (group_id in 1:length(functional_groups)) {
        lines(data[[figure_id]]$Year, data[[figure_id]][, 1 + group_id],
          col = figure_colors[group_id],
          pch = group_id,
          lty = group_id,
          type = "o",
          cex = 0.7
        )
      }

      legend("topright",
        inset = c(-0.45, 0),
        legend = functional_groups,
        col = figure_colors,
        lty = 1:length(functional_groups),
        pch = 1:length(functional_groups),
        title = "Functional Groups",
        cex = 0.7
      )
    }
    dev.off()
    graphics.off()
  }

  return(data)
}

#' Read in EwE fishing effort data and make figures
#'
#' @description It reads in the output data from Ecopath with Ecosim (EwE) and
#' making figures for each dataset. The timestep of the output data needs to be
#' month. The rows of the data matrix represents month and the columns of the
#' data represents fleets. It creates figures and save the figures where EwE
#' output csv files are located. The potential data include: fishing effort
#' over years.
#'
#' @param file_path a character string shows path to the working folder where EwE output csv files are located.
#' @param file_names a vector of csv file names.
#' @param skip_nrows integer: the number of lines of the data file to skip before reading data.
#' @param colname_1 column name of the first column. Default name is Month.
#' @param fleets a character string describes the column of the data matrix, which is fleets in EwE case.
#' @param years a vector of years.
#' @export

read_ewe_effort <- function(file_path,
                            file_names,
                            skip_nrows = 8,
                            colname_1 = "month",
                            fleets,
                            years) {
  data <- vector(mode = "list", length = length(file_names))

  for (file_id in 1:length(file_names)) {
    temp <- scan(file.path(file_path, file_names[file_id]), what = "", sep = "\n")
    data[[file_id]] <- temp[-c(1:skip_nrows)]

    data[[file_id]] <- read.table(
      text = as.character(data[[file_id]]),
      sep = ",",
      col.names = c(colname_1, fleets, "NA")
    )

    data[[file_id]] <- data[[file_id]][-nrow(data[[file_id]]), -ncol(data[[file_id]])]

    data[[file_id]]$month <- rep(1:12, times = length(years))
    data[[file_id]]$year <- rep(years, each = 12)
  }

  return(data)
}

#' Read in EwE MSY reference points and make figures
#'
#' @description It reads in the MSY reference points (i.e. MSY, FMSY, BMSY) from Ecopath with Ecosim (EwE) and making figures for yield over fishing mortality. It only works with Atlantic menhaden for now.
#'
#' @param file_path a character string shows path to the working folder where EwE output csv files are located.
#' @param file_names a vector of csv file names.
#' @param functional_groups a character string describes the column of the data matrix, which is functional groups in EwE case.
#' @param key_functional_group a character string describes the key functional group.
#' @param reference_points_scenario a character string describes the reference points scenario: compensation or staionary.
#' @param ages age classes of the functional groups.
#' @param plot logical: if `TRUE` then make figures for all output data files.
#' @export
read_ewe_reference_points <- function(file_path,
                                      file_names,
                                      functional_groups,
                                      key_functional_group,
                                      ages,
                                      reference_points_scenario,
                                      plot) {

  msy_fleet <- read_ewe_output(
    file_path = file_path,
    file_names = file_names,
    skip_nrows = 12,
    colname_1 = "FM",
    plot = FALSE,
    figure_titles = NULL,
    functional_groups = functional_groups,
    figure_colors = NULL
  )

  catch_sum <- apply(msy_fleet[[1]][, paste0(key_functional_group, ages)], 1, sum)
  MSY <- max(catch_sum) * 1000000
  FMSY <- msy_fleet[[1]]$FM[which.max(catch_sum)]
  biomass_sum <- apply(msy_fleet[[2]][, paste0(key_functional_group, ages)], 1, sum) * 1000000
  BMSY <- biomass_sum[which.max(catch_sum)]
  MSY_data <- list(MSY = MSY, FMSY = FMSY, BMSY = BMSY)

  if (plot == TRUE) {
    pdf(file = file.path(file_path, paste0(reference_points_scenario, "_yield_over_F.pdf")), onefile = T)
    plot(msy_fleet[[1]]$FM, catch_sum,
         xlab = "F", ylab = "Yield",
         pch = 16, type="o")
    abline(h = MSY, lty = 2)
    abline(v = FMSY, lty = 3)
    dev.off()
  }

  return(MSY_data)
}
