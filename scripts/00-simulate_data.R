```{r}
#### Preamble ####
# Purpose: Preference for and perception of action and inaction agents
# Author: Hari Lee Robledo, Sky Suh and Francesca Ye
# Date: 10 February 2024
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)
library(ggplot2)

#### Simulate Preference and Perception Data with 6 variables ####

set.seed(400)

simulated_pref_perc_data <-
  tibble(
  "Participant" = 1:460,
  "Preference" = sample(
    x = c(-5:5),
    size = 460,
    replace = TRUE
  ), 
  "Competence" = sample(
    x = c(-5:5),
    size = 460,
    replace = TRUE
  ), 
  "Descriptive" = sample(
    x = c(-5:5),
    size = 460,
    replace = TRUE
  ), 
  "Injunctive" = sample(
    x = c(-5:5),
    size = 460,
    replace = TRUE
  ), 
  "Regret" = sample(
    x = c(-5:5),
    size = 460,
    replace = TRUE
  ), 
  "Joy" = sample(
    x = c(-5:5),
    size = 460,
    replace = TRUE
  )
)
simulated_pref_perc_data


#### Graph score per building ####

preference_graph <- ggplot(simulated_pref_perc_data, aes(x = Preference)) +
  geom_histogram(binwidth = 1, fill = "gray", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Preference",
       x = "Preference",
       y = "Pariticipant Count") +
  theme_minimal()
preference_graph

competence_graph <- ggplot(simulated_pref_perc_data, aes(x = Competence)) +
  geom_histogram(binwidth = 1, fill = "gray", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Competence Perception",
       x = "Competence",
       y = "Pariticipant Count") +
  theme_minimal()
competence_graph

descriptive_graph <- ggplot(simulated_pref_perc_data, aes(x = Descriptive)) +
  geom_histogram(binwidth = 1, fill = "gray", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Decriptive Norms Perception",
       x = "Dexriptive Norms",
       y = "Pariticipant Count") +
  theme_minimal()
descriptive_graph

injunctive_graph <- ggplot(simulated_pref_perc_data, aes(x = Injunctive)) +
  geom_histogram(binwidth = 1, fill = "gray", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Injunctive Norms Perception",
       x = "Injunctive Norms",
       y = "Pariticipant Count") +
  theme_minimal()
injunctive_graph

regret_graph <- ggplot(simulated_pref_perc_data, aes(x = Regret)) +
  geom_histogram(binwidth = 1, fill = "gray", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Regret",
       x = "Regret",
       y = "Pariticipant Count") +
  theme_minimal()
regret_graph

joy_graph <- ggplot(simulated_pref_perc_data, aes(x = Joy)) +
  geom_histogram(binwidth = 1, fill = "gray", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Joy",
       x = "Joy",
       y = "Pariticipant Count") +
  theme_minimal()
joy_graph


#### Test simulated data ####

# check that participants equal 460
length(unique(simulated_pref_perc_data$Participant)) == 460

# check that preference and perception scores are between -5 and 5
simulated_pref_perc_data$Preference |> min() == -5
simulated_pref_perc_data$Preference |> max() == 5

# check that the sum of the frequency count (participant counts) in the graphs equals 460. 
#Code referenced from: https://chat.openai.com/

# Extract data from the ggplot object
preference_data <- ggplot_build(preference_graph)$data[[1]]

# Check if the sum of the frequency (participant count) equals 460
if (sum(preference_data$count) == 460) {
  print("The sum of participant count in Preference graph equals 460.")
} else {
  print("The sum of participant count in Preference graph does not equal 460.")
}

```
