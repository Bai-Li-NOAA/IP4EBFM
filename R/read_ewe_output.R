#' Read in EwE output data and make figures
#'
#' @description It reads in the output data from Ecopath with Ecosim (EwE) and making figures for each dataset. The timestep of the output data needs to be year. The rows of the data matrix represents years and the columns of the data represents functional groups. It creates figures and save the figures where EwE output csv files are located. The potential data include: biomass, catch, consumption biomass, feeding time, mortality, trophic level, and average weight (or production to comsumption) over years.
#'
#' @param file_path a character string shows path to the working folder where EwE output csv files are located.
#' @param file_names a vector of csv file names.
#' @param skip_nrows interger: the number of lines of the data file to skip before reading data.
#' @param functional_groups a character string describes the column of the data matrix, which is functional groups in EwE case.
#' @param plot logical: if `TRUE` then make figures for all output data files.
#' @param figure_titles a character vector of strings describes the names of each figure.
#' @param figure_colors a vector of colors.
#' @export

read_ewe_output <- function(file_path,
                            file_names,
                            skip_nrows = 8,
                            functional_groups,
                            plot = FALSE,
                            figure_titles=NULL,
                            figure_colors = rainbow(12)) {
  data <- vector(mode = "list", length = length(file_names))

  for (file_id in 1:length(file_names)) {
    temp <- scan(file.path(file_path, file_names[file_id]), what = "", sep = "\n")
    data[[file_id]] <- temp[-c(1:skip_nrows)]
    data[[file_id]] <- read.table(
      text = as.character(data[[file_id]]),
      sep = ",",
      col.names = c("Year", functional_groups)
    )
  }

  if (plot == TRUE) {
    graphics.off()
    windows()
    pdf(file = file.path(file_path, "ewe_all_figures.pdf"), onefile = T)

    for (figure_id in 1:length(file_names)) {
      par(mar = c(5.1, 4.1, 4.1, 10), xpd = TRUE)

      plot(NULL,
        xlab = "Year",
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
          cex=0.7
        )
      }

      legend("topright",
        inset = c(-0.45, 0),
        legend = functional_groups,
        col = figure_colors,
        lty = 1:length(functional_groups),
        pch = 1:length(functional_groups),
        title = "Functional Groups",
        cex=0.7
      )
    }
    dev.off()
    graphics.off()
  }

  return(data)
}
