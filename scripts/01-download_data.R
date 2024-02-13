#### Preamble ####
# Purpose: Download Study 2 Raw Data from https://osf.io/a8e4d/
# Author: Hari Lee Robledo, Sky Suh and Francesca Ye
# Date: 10 February 2024
# Pre-requisites: none

#### Work space setup ####
library(readr)

# Get "inactionwetrust_study2.csv" from Center for Open Science
# Code referenced from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
study_2_raw_data <-
  read_csv(
    file =
      "https://osf.io/download/xyev5/",
    show_col_types = FALSE,
  )

# Save Study 2 Raw Data
write_csv(
  x = study_2_raw_data,
  file = "study_2_raw_data.csv"
)

