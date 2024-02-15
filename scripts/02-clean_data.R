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

# Preference Graph by Gender 1 (Male)

histogram_male <- ggplot(data_male, aes(x = preference)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  scale_y_continuous(limits = c(0,140), breaks = seq(0, 140, by = 10)) +
  labs(title = "Distribution of Males by Preference",
       x = "Preference",
       y = "Frequency") +
  theme_minimal()

histogram_male

# Create data set for just Gender 2 (women)
data_female <- data_gender[data_gender$gender == 2, ]

# Save data set
write_csv(
  x = data_female,
  file = "~/Preference-and-Perception-of-Decision-Making/outputs/data/02-cleaned_study_2_women_data.csv"
)

# Create a histogram for the "preference" column with gender equal to 2
histogram_female <- ggplot(data_female, aes(x = preference)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  scale_y_continuous(limits = c(0,140), breaks = seq(0, 140, by = 10)) +
  labs(title = "Distribution of Females by Preference",
       x = "Preference",
       y = "Frequency") +
  theme_minimal()

histogram_female


#Compare Preference by Gender
#Code referenced from: https://chat.openai.com/
histogram_comparison_preference <- ggplot(data_gender, aes(x = preference)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Comparison of Preference Distribution by Gender",
       x = "Preference",
       y = "Frequency") +
  theme_minimal() +
  scale_y_continuous(limits = c(0, 180), breaks = seq(0, 180, by = 20)) +
  facet_wrap(~gender, scales = "free")


histogram_comparison_preference

## Competence Graphs by Gender

# Select Gender 1 (male) and Competence
data_male <- data_gender[data_gender$gender == 1, ]

histogram_male_competence <- ggplot(data_male, aes(x = competence)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Males by Competence ",
       x = "Competence",
       y = "Frequency") +
  scale_y_continuous(limits = c(0, 180), breaks = seq(0, 180, by = 20)) +
  theme_minimal()

histogram_male_competence


# Select Gender 2 (female) and Competence
data_female <- data_gender[data_gender$gender == 2, ]

histogram_female_competence <- ggplot(data_female, aes(x = competence)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Females by Competence",
       x = "Competence",
       y = "Frequency") +
  scale_y_continuous(limits = c(0, 180), breaks = seq(0, 180, by = 20)) +
  theme_minimal()

histogram_female_competence


#Compare Competence by Gender
#Code referenced from: https://chat.openai.com/
histogram_comparison_competence <- ggplot(data_gender, aes(x = competence)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Comparison of Competence Distribution by Gender",
       x = "Preference",
       y = "Frequency") +
  theme_minimal() +
  scale_y_continuous(limits = c(0, 180), breaks = seq(0, 180, by = 20)) +
  facet_wrap(~gender, scales = "free")

histogram_comparison_competence
