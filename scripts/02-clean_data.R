```{r}
#### Preamble ####
# Purpose: Clean the "Inaction We Trust" data of Study 2 by "Adrien Fillon" based on gender
# Author: Hari Lee Robledo, Sky Suh and Francesca Ye
# Date: 10 February 2024
# Pre-requisites: none


### Workspace Setup ###
library(tidyverse)


#### Clean Data ####
# Select and save only the "preference", "competence" and "gender" columns
data_gender <- read.csv("study_2_raw_data.csv", sep = ";" )
data_gender <- data_gender[, c("preference","competence", "gender")]

# Convert columns to numeric (assuming "preference" is numeric)
data_gender$preference <- as.numeric(as.character(data_gender$preference))
data_gender$competence <- as.numeric(as.character(data_gender$competence))

# Skip rows with missing values
data_gender <- na.omit(data_gender)

data_gender

## Gender

# Select Gender 1 (male)
data_male <- data_gender[data_gender$gender == 1, ]

# Gender 2 (Female)
data_female <- data_gender[data_gender$gender == 2, ]


#### Save cleaned data ####

# Code referenced from:https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html

# save cleaned  data 
write_csv(
  x = data_gender,
  file = "data_gender.csv"
)

# save cleaned male data 
write_csv(
  x = data_male,
  file = "data_male.csv"
)

# save cleaned female data
write_csv(
  x = data_female,
  file = "data_female.csv"
)

```
