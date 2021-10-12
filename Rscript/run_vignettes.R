# devtools::load_all()
library(IFA4EBFM)
library(rmarkdown)
library(here)

require(RefManageR)
require(dplyr)
require(stringr)
require(anytime)
require(bibtex) # remotes::install_github("ROpenSci/bibtex")



# Create bibliography .Rmd -----------------------------------------------------

my_bibfile <- here::here("vignettes", "01_litreview", "EcologicalForecasting.bib")
my_outfold   <- here::here("vignettes", "01_litreview")
my_outfile <- "01_001_Bibliography.Rmd"
section_title <- "Ecological Forecasting"

bibtex2rmd(bibfile = my_bibfile,
           outfold = my_outfold,
           outfile = my_outfile,
           abstract = TRUE,
           overwrite = TRUE,
           section_title = section_title)

bib_path <- here::here("vignettes", "01_litreview")
bib_files <- c("Meteorology.bib",
               "Energy.bib",
               "Agriculture.bib",
               "Others.bib")


section_titles <- c("Meteorology Forecasting  ",
                    "Energy Forecasting  ",
                    "Commodity Production Forecasting  ",
                    "Others  "
                    )

for (i in seq_along(section_titles)){
  bibtex2rmd(bibfile = file.path(bib_path, bib_files[i]),
             outfold = my_outfold,
             outfile = my_outfile,
             abstract = TRUE,
             overwrite = FALSE,
             section_title = section_titles[i])
}




my_outfile <- "01_001_Bibliography_noabstract.Rmd"
bibtex2rmd(bibfile = my_bibfile,
           outfold = my_outfold,
           outfile = my_outfile,
           abstract = FALSE,
           overwrite = TRUE,
           section_title = section_title)


# Update package documentation ----------------------------------------------------

devtools::document()

# Render .Rmd files -------------------------------------------------------

rmd_file <- list.files(here::here("Vignettes", "01_litreview"), pattern=".Rmd")

for (i in seq_along(rmd_file)){
  rmarkdown::render(input = here::here("Vignettes", "01_litreview", rmd_file[i]), c("html_document", "word_document"))
}

# Update pkgdown YAML file and build the website ------------------------------------------------
pkgdown::template_navbar()

pkgdown::build_site()
