#' Read bibtex to an Rmd file.
#'
#' @param bibfile .bib file path
#' @param outfold output folder for .Rmd
#' @param outfile character string naming a file, should end in \dQuote{.Rmd}.
#' @param abstract print abstract or not
#' @param overwrite overwite the .Rmd file or not
#'
#' @export

bibtex2rmd <- function(bibfile,
                       outfold,
                       outfile,
                       abstract = FALSE,
                       overwrite = FALSE,
                       section_title) {


  require(RefManageR)
  require(dplyr)
  require(stringr)
  require(anytime)

  filename <- outfile

  if (!file.exists(file.path(outfold, filename)) | overwrite) {

    # Code reference:
    # https://www.r-bloggers.com/2018/03/automatically-importing-publications-from-bibtex-to-a-hugo-academic-blog/
    fileConn <- file.path(outfold, filename)
    write("
---
title: 'Forecasting review bibliography'
output:
  word_document: default
  html_document: default
---

```{r, echo = FALSE}
knitr::opts_chunk$set(collapse = TRUE)
```
            ", fileConn)

  }

  fileConn <- file.path(outfold, filename)

  write(paste0(
    "## ",
    section_title
  ), fileConn, append = T)


  if (!is.null(bibfile)) {
    # Import the bibtex file and convert to data.frame
    mypubs <- ReadBib(bibfile, check = "warn", .Encoding = "UTF-8") %>%
      as.data.frame()

    for (i in 1:nrow(mypubs)) {
      x <- mypubs[i, ]

      # Authors. Comma separated list, e.g. `["Bob Smith", "David Jones"]`.
      author <- str_replace_all(x["author"], " and ", ", ")
      write(paste0(
        "- ",
        author,
        ". ",
        x[["year"]],
        ". ",
        "**",
        x[["title"]],
        "**",
        ". ",
        x[["journal"]],
        ". ",
        ifelse(!is.na(x[["volume"]]), paste0(x[["volume"]], ", "), ""),
        ifelse(!is.na(x[["number"]]), paste0("(", x[["number"]], "), "), ""),
        ifelse(!is.na(x[["pages"]]), paste0(x[["pages"]], ", "), ""),
        ifelse(!is.na(x[["doi"]]), paste0("https://doi.org/", x[["doi"]]), "")
      ),

      fileConn,
      append = T
      )

      write(paste0(" "), fileConn, append = T)

      # Abstract
      if (abstract) {
        write(paste0(x[["abstract"]]), fileConn, append = T)
      }

      write(paste0(" "), fileConn, append = T)
    }
  }
}
