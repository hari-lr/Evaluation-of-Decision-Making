### Workspace Setup ###
```{r}
library(tidyverse)
library(ggplot2)
library(dplyr)
```

```{r}
#### Preamble ####
# Purpose: Clean the "Inaction We Trust" data of Study 2 by "Adrien Fillon" based on gender
# Author: Hari Lee Robledo, Sky Suh and Francesca Ye
# Date: 10 February 2024
# Pre-requisites: none
```

#### Clean Data ####
```{r}
# Select and save only the "preference", "competence" and "gender" columns
data_gender <- read.csv("study_2_raw_data.csv", sep = ";" )
data_gender <- data_gender[, c("preference","competence", "gender")]


# Convert columns to numeric (assuming "preference" is numeric)
data_gender$preference <- as.numeric(as.character(data_gender$preference))
data_gender$competence <- as.numeric(as.character(data_gender$competence))

# Drop rows with missing values
data_gender <- na.omit(data_gender)

data_gender
```

```{r}

## Preference Graphs by Gender

# Select Gender 1 (male)
data_male <- data_gender[data_gender$gender == 1, ]

# Preference Graph by Gender 1 (Male)

histogram_male <- ggplot(data_male, aes(x = preference)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  scale_y_continuous(limits = c(0,140), breaks = seq(0, 140, by = 10)) +
  labs(title = "Distribution of Preference (Gender = 1)",
       x = "Preference",
       y = "Frequency") +
  theme_minimal()

histogram_male

# Preference Graph by Gender 1 (Male)

data_female <- data_gender[data_gender$gender == 2, ]

# Create a histogram for the "preference" column with gender equal to 2
histogram_female <- ggplot(data_female, aes(x = preference)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  scale_y_continuous(limits = c(0,140), breaks = seq(0, 140, by = 10)) +
  labs(title = "Distribution of Preference (Gender = 2)",
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

```


```{r}
## Competence Graphs by Gender

# Select Gender 1 (male) and Competence
data_male <- data_gender[data_gender$gender == 1, ]

histogram_male_competence <- ggplot(data_male, aes(x = competence)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Competence (Gender = 1)",
       x = "Competence",
       y = "Frequency") +
  scale_y_continuous(limits = c(0, 180), breaks = seq(0, 180, by = 20)) +
  theme_minimal()

histogram_male_competence


# Select Gender 2 (female) and Competence
data_female <- data_gender[data_gender$gender == 2, ]

histogram_female_competence <- ggplot(data_female, aes(x = competence)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Competence (Gender = 2)",
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

```

