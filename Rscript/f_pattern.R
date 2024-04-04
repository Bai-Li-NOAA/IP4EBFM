project_path <- here::here()
working_dir <- file.path(project_path, "data", "ewe")
f <- read.csv(file.path(working_dir, "7ages", "updated_f.csv"))
row_id <- seq(1, nrow(f), by=12)
col_id <- grep("AtlanticMenhaden", colnames(f))
f_pattern <- "rollercoaster" # Options: rollercoaster (decrease first and then increase)

for (col in col_id){
  max_f <- max(f[row_id, col])
  min_f <- min(f[row_id, col])
  if (f_pattern == "increase") {
    update_f <- seq(min_f, max_f, length=length(row_id))*
      exp(rnorm(length(row_id), mean=0, sd=0.2))
  }

  if (f_pattern == "rollercoaster") {
    middle_year <- round(length(row_id)*2/3)
    update_f <- c(seq(min_f, max_f, length=middle_year),
                  seq(max_f, max_f/2, length=length(row_id)-middle_year))*
      exp(rnorm(length(row_id), mean=0, sd=0.2))
  }

  f[, col] <- rep(update_f, each = 12)
}
write.csv(f, file = file.path(working_dir, "7ages", "updated_f.csv"))

