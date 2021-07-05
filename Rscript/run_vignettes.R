
library(rmarkdown)
library(here)

rmd_file <- list.files(here::here("Vignettes", "01_litreview"), pattern=".Rmd")

for (i in seq_along(rmd_file)){
  render(input = here::here("Vignettes", "01_litreview", rmd_file[i]), c("html_document", "word_document"))
}



pkgdown::build_site()
