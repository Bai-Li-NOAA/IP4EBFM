devtools::load_all()
library(rmarkdown)
library(here)


# Create bibliography .Rmd -----------------------------------------------------

my_bibfile <- here::here("vignettes", "01_litreview", "EcologicalForecasting.bib")
my_outfold   <- here::here("vignettes", "01_litreview")
my_outfile <- "01_003_Bibliography.Rmd"
section_title <- "Ecological Forecasting"

bibtex2rmd(bibfile = my_bibfile,
           outfold = my_outfold,
           outfile = my_outfile,
           abstract = TRUE,
           overwrite = TRUE,
           section_title = section_title)

section_titles <- c("Meteorology Forecasting  ",
                    "Health Forecasting  ",
                    "Financial Forecasting  ",
                    "Energy Forecasting  ",
                    "Political/Elections Forecasting and Sports Forecasting  ",
                    "Commodity Production Forecasting  ")

for (i in seq_along(section_titles)){
  bibtex2rmd(bibfile = NULL,
             outfold = my_outfold,
             outfile = my_outfile,
             abstract = FALSE,
             overwrite = FALSE,
             section_title = section_titles[i])
}




my_outfile <- "01_003_Bibliography_noabstract.Rmd"
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
