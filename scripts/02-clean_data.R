#### Preamble ####
# Purpose: Clean the "Inaction We Trust" data of Study 2 by Adrien Fillon et al. based on gender
# Author: Hari Lee Robledo, Sky Suh and Francesca Ye
# Date: 10 February 2024
# Pre-requisites: Access to "01-study_2_raw_data.csv" downloaded from "01-download_data.R"


### Workspace Setup ###
library(tidyverse)
library(photobiology)
library(readr)

#### Clean Data ####
# Select and save only the "preference", "competence" and "gender" columns
data_gender <- 
  read.csv("~/Preference-and-Perception-of-Decision-Making/inputs/data/01-study_2_raw_data.csv", sep = ";" )
data_gender <- 
  data_gender[, c("preference","competence", "gender")]

# Convert columns to numeric (assuming "preference" is numeric)
data_gender$preference <- as.numeric(as.character(data_gender$preference))
data_gender$competence <- as.numeric(as.character(data_gender$competence))

# Skip rows with missing values
data_gender <- na.omit(data_gender)

# Skip rows with a gender value of 3
data_gender <- data_gender[data_gender$gender != 3,]

# Save cleaned gender data
write_csv(
  x = data_gender,
  file = "~/Preference-and-Perception-of-Decision-Making/outputs/data/00-cleaned_study_2_data.csv"
)

# Create data set with just Gender 1 (men)
data_male <- data_gender[data_gender$gender == 1, ]

# Save data set
write_csv(
  x = data_male,
  file = "~/Preference-and-Perception-of-Decision-Making/outputs/data/01-cleaned_study_2_men_data.csv"
)

# Create data set for just Gender 2 (women)
data_female <- data_gender[data_gender$gender == 2, ]

# Save data set
write_csv(
  x = data_female,
  file = "~/Preference-and-Perception-of-Decision-Making/outputs/data/02-cleaned_study_2_women_data.csv"
)
