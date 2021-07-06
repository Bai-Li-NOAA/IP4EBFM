devtools::load_all()
library(rmarkdown)
library(here)


# Create bibliography .Rmd -----------------------------------------------------

my_bibfile <- here::here("vignettes", "01_litreview", "bibliography.bib")
my_outfold   <- here::here("vignettes", "01_litreview")
my_outfile <- "01_003_Bibliography.Rmd"


bibtex2rmd(bibfile = my_bibfile,
           outfold = my_outfold,
           outfile = my_outfile,
           abstract = TRUE,
           overwrite = TRUE)


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
