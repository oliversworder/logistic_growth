#Script to estimate the model parameters using a linear approximation

install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment3.csv")
growth_data


#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<3000) %>% mutate(N_log = log(N))
#natural log (e) of the data in the model

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
#this first linear model shows the linearisation of the log of the first 
#exponential bit of the model; the intercept therefore is log(N0), 
#the gradient is r

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
#this second model is the linear model of the top of the model when it's at 
#carrying capacity; the intercept is k
