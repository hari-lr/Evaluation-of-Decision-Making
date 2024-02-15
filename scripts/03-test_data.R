#### Preamble ####
# Purpose: Test the cleaned Study 2 Raw Data
# Authors: Hari Lee Robledo, Sky Suh and Francesca Ye
# Date: 10 February 2024
# Pre-requisites: none

### Workspace Setup ###
library(tidyverse)
library(dplyr)

#### Test cleaned data ####

# check if there are  452 rows in the cleaned data_gender data set 
# Code referenced from: https://chat.openai.com/
if (nrow(data_gender) == 452) {
  print("The number of TOTAL participants in data_gender is 452.")
} else {
  print("The number of TOTAL participants in data_gender is not 452.")
}

# Male
if (nrow(data_male) == 137) {
  print("The number of male participants in data_gender is 137.")
} else {
  print("The number of male participants in data_gender is not 137.")
}

# Female
if (nrow(data_female) == 308) {
  print("The number of female participants in data_gender is 308.")
} else {
  print("The number of female participants in data_gender is not 308.")
}

# Other
data_other <- data_gender[data_gender$gender == 3, ]

if (nrow(data_other) == 7) {
  print("The number of other participants in data_gender is 7.")
} else {
  print("The number of rows other participants in data_gender is not 7.")
}

# check that preference and competence scores are between -5 and 5
data_gender$preference |> min() == -5
data_gender$preference |> max() == 5

data_gender$competence |> min() == -5
data_gender$competence |> max() == 5

# check that the sum of the frequency count (participant counts) in the  graphs equals 138 for male and 308 for female. 
# Code referenced from: https://chat.openai.com/
# Extract data from the ggplot object
test_preference_male <- ggplot_build(histogram_male_preference)$data[[1]]
test_preference_female <- ggplot_build(histogram_female_preference)$data[[1]]

# Check if the sum of the frequency (participant count) in the male graphs equals 205
# Male
if (sum(test_preference_male$count) == 137) {
  print("The sum of male participant count in Preference graph is 137.")
} else {
  print("The sum of male participant count in Preference graph is not 138.")
}

# Female
if (sum(test_preference_female$count) == 308) {
  print("The sum of female participant count in Preference graph is 308.")
} else {
  print("The sum of female participant count in Preference graph is not 308.")
}

