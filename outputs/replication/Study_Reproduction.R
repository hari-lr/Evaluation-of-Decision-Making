#### Preamble ####
# Purpose: Reproduce the Bar graphs of Study 1, Study1b and Study 2 from the "Inaction We Trust" data set collected and analyzed by Adrien Fillon et al. (2023)
# Author: Hari Lee Robledo, Sky Suh and Francesca Ye
# Date: 10 February 2024
# Pre-requisites: Download: 
                           - inactionwetrust_study1.csv
                           - inactionwetrust_study1b.csv
                           - inactionwetrust_study2.csv
                           
# Code referenced from: https://osf.io/kzf3x

```{r setup, include=FALSE}

#### Workspace setup ####
knitr::opts_chunk$set(warning = FALSE, message = FALSE) 

list.of.packages <- c("report", "dplyr", "psych", "ggplot2", "tidyverse", "corrr", "corrplot", "PerformanceAnalytics", "Hmisc", "ggstatsplot", "jtools", "metan", "ggstatsplot", "ggthemes", "apaTables","insight", "parameters")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[
  ,"Package"])]
if(length(new.packages)) install.packages(new.packages, dependencies = TRUE)
invisible(lapply(list.of.packages, library, character.only = TRUE))

# setting formatting options
options(scipen=999, digits =3)

```

# Study 1a

```{r study1, echo=FALSE}

data1 <- read.csv("inactionwetrust_study1.csv", na.strings=c("","NA"))

# data cleaning
## remove variable descriptions + practice data
data1 <- data1[-c(1:1),]
data1 <-  data1 [, c("preference", "competence", "norms", "Q55", "check1",
                     "check2", "check3", "sex", "Age")] 
# rename and summarize descriptives
data1$preference <- as.numeric(data1$preference)
data1$competence <- as.numeric(data1$competence)
data1$normative <- as.numeric(data1$norms)
data1<-rename(data1, regret = Q55)
data1$regret <- as.numeric(data1$regret)
data1$age<- as.numeric(data1$Age)

summary1 <- data1 %>%
    select(preference, competence, normative, regret, sex, age) %>% 
  psych::describe(quant=c(.25,.75)) %>% as_tibble(rownames="rowname")
knitr::kable(summary1, digits=2, caption = "Summary study 1a", align = "c")
tablegender1<-table(data1$sex)
knitr::kable(tablegender1, digits=2, caption = "Summary gender", align = "c")


dplot1 <- data1 %>% select(preference, competence, normative, regret)%>%
  rename(Preference = preference, Competence = competence, Norms = normative, Regret = regret)%>%
  gather()
dplot1$key<-factor(dplot1$key, levels = c("Preference","Competence", "Norms", "Regret"))

dplot1  %>% ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free", )+ geom_bar(binwidth = 1)+theme_apa()+
  labs(x = "", y = "")+ scale_x_discrete(limits = c(-5,0, 5))+ ylim(0, 200)

Sa1preferenceplot <- ggstatsplot::gghistostats(
  data = data1, # data from which variable is to be taken
  x = preference, # numeric variable
  xlab = "Preference", # x-axis label
  # title = "Preference", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
Sa1preferenceplot

Sa1competenceplot <- ggstatsplot::gghistostats(
  data = data1, # data from which variable is to be taken
  x = competence, # numeric variable
  xlab = "Competence", # x-axis label
  # title = "Competence", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
Sa1competenceplot

Sa1normativeplot <- ggstatsplot::gghistostats(
  data = data1, # data from which variable is to be taken
  x = normative, # numeric variable
  xlab = "Norms", # x-axis label
  # title = "Norms", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
Sa1normativeplot

Sa1regretplot <- ggstatsplot::gghistostats(
  data = data1, # data from which variable is to be taken
  x = regret, # numeric variable
  xlab = "Regret", # x-axis label
  # title = "Preference", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"

)
Sa1regretplot

# two in one
library(ggpubr)
ggarrange(Sa1preferenceplot, Sa1competenceplot, Sa1normativeplot, Sa1regretplot, common.legend = TRUE)

```


# Study 1b

```{r study 1b, echo=FALSE}

data1b <- read.csv("inactionwetrust_study1b.csv")

# data cleaning
data1b <- data1b[-c(1:2),]

## remove variable descriptions + practice data
data1b <-  data1b [, c("preference", "competence", "normative","Q55",
                       "check_1", "check_2", "check_3", "gender", "age")]
# descriptives
data1b$preference <- as.numeric(data1b$preference)
data1b$competence <- as.numeric(data1b$competence)
data1b$normative <- as.numeric(data1b$normative)
data1b<-rename(data1b, regret = Q55)
data1b$regret <- as.numeric(data1b$regret)
data1b$age<-as.numeric(data1b$age)

summary1b <- data1b %>%
    select(preference, competence, normative, regret, gender, age) %>% 
  psych::describe(quant=c(.25,.75)) %>% as_tibble(rownames="rowname")
knitr::kable(summary1b, digits=2, caption = "Summary descriptives", align = "c")
tablegender<-table(data1b$gender)
knitr::kable(tablegender, digits=2, caption = "Summary gender", align = "c")


dplot1b <- data1b %>% select(preference, competence, normative, regret)%>%
  rename(Preference = preference, Competence = competence, Norms = normative, Regret = regret)%>%
  gather()
dplot1b$key<-factor(dplot1b$key, levels = c("Preference","Competence", "Norms", "Regret"))
dplot1b  %>% ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free")+ geom_bar(binwidth = 1)+theme_apa()+
  labs(x = "", y = "")+ scale_x_discrete(limits = c(-5,0, 5))+ ylim(0, 200)


S1bpreferenceplot <- ggstatsplot::gghistostats(
  data = data1b, # data from which variable is to be taken
  x = preference, # numeric variable
  xlab = "Preference", # x-axis label
  # title = "Preference", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S1bpreferenceplot

S1bcompetenceplot <- ggstatsplot::gghistostats(
  data = data1b, # data from which variable is to be taken
  x = competence, # numeric variable
  xlab = "Competence", # x-axis label
  # title = "Competence", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S1bcompetenceplot

S1bnormativeplot <- ggstatsplot::gghistostats(
  data = data1b, # data from which variable is to be taken
  x = normative, # numeric variable
  xlab = "Norms", # x-axis label
  # title = "Norms", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S1bnormativeplot

S1bregretplot <- ggstatsplot::gghistostats(
  data = data1b, # data from which variable is to be taken
  x = regret, # numeric variable
  xlab = "Regret", # x-axis label
  # title = "Preference", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S1bregretplot

# two in one
library(ggpubr)
ggarrange(S1bpreferenceplot, S1bcompetenceplot, S1bnormativeplot, S1bregretplot, common.legend = TRUE)

```

# Study 2

```{r study 2, echo=FALSE}

data2 <- read.csv("inactionwetrust_study2.csv",sep = ";" )
# data cleaning
# data2 <- data2[-c(1:2),]
## remove variable descriptions + practice data
data2 <-  data2 [, c("expect", "preference", "competence", "descriptive.norms", "Injunctive", "regret", "joy", "check", "gender", "age", "condition")]
data2 <- mutate_all(data2, function(x) as.numeric(as.character(x)))

```


```{r descriptives2}

S2Control <- data2 %>% filter (condition == 1)

summary2 <- S2Control %>%
    select(preference, competence, descriptive.norms, Injunctive, regret, joy, age, gender) %>% 
  psych::describe(quant=c(.25,.75)) %>% as_tibble(rownames="rowname")
knitr::kable(summary2, digits=2, caption = "Summary descriptives", align = "c")
tablegender2<-table(S2Control$gender)
knitr::kable(tablegender2, digits=2, caption = "Summary gender", align = "c")

dplot2 <- S2Control %>% 
  select(preference, competence, descriptive.norms, Injunctive, regret, joy) %>%
  rename(Preference = preference, Competence = competence,
         "Descriptive norms" = descriptive.norms,
         "Injunctive norms" = Injunctive, Regret = regret, Joy = joy)%>%
  gather()
dplot2$key<-factor(dplot2$key, levels = c("Preference","Competence",
                                          "Descriptive norms", "Injunctive norms",
                                          "Regret", "Joy"))

dplot2 %>% ggplot(aes(value)) + 
  facet_wrap(~ key, scales = "free")+ geom_bar(binwidth = 1)+theme_apa()+
  labs(x = "", y = "")+ scale_x_discrete(limits = c(-5,0,5))+ ylim(0, 250) 


S2preferenceplot <- ggstatsplot::gghistostats(
  data = S2Control, # data from which variable is to be taken
  x = preference, # numeric variable
  xlab = "Preference", # x-axis label
  # title = "Preference", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S2preferenceplot

S2competenceplot <- ggstatsplot::gghistostats(
  data = S2Control, # data from which variable is to be taken
  x = competence, # numeric variable
  xlab = "Competence", # x-axis label
  # title = "Competence", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S2competenceplot

S2desnormativeplot <- ggstatsplot::gghistostats(
  data = S2Control, # data from which variable is to be taken
  x = descriptive.norms, # numeric variable
  xlab = "Descriptive norms", # x-axis label
  # title = "Norms", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S2desnormativeplot

S2injnormativeplot <- ggstatsplot::gghistostats(
  data = S2Control, # data from which variable is to be taken
  x = Injunctive, # numeric variable
  xlab = "Injunctive norms", # x-axis label
  # title = "Norms", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S2injnormativeplot

S2regretplot <- ggstatsplot::gghistostats(
  data = S2Control, # data from which variable is to be taken
  x = regret, # numeric variable
  xlab = "Regret", # x-axis label
  # title = "Preference", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S2regretplot

S2joyplot <- ggstatsplot::gghistostats(
  data = S2Control, # data from which variable is to be taken
  x = joy, # numeric variable
  xlab = "Joy", # x-axis label
  # title = "Preference", # title for the plot
  #ggtheme = ggthemes::theme_tufte(), # changing default theme
  test.value = 0, # test value
  #caption = "Data courtesy of: SAPA project (https://sapa-project.org)"
)
S2joyplot

# six in one
library(ggpubr)
ggarrange(S2preferenceplot, S2competenceplot, S2desnormativeplot, S2injnormativeplot, S2regretplot, S2joyplot, ncol = 2, nrow	= 3, common.legend = TRUE)

```

