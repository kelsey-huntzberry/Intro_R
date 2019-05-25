# Introduction to R Programming
# In-Class code for Class 1

# Set working directory so exported files will be dumped to this folder
setwd("~/Documents/R_Class_Meetup/Class1/Results")

# Read in county-level opioid prescribing data
# stringsAsFactors = F changes your string variables into character variables not factor variables
opioid.df <- read.csv("~/Documents/R_Class_Meetup/Class1/Data/state_prescribe_overdose_data.csv", stringsAsFactors = F)

# Find and print mean prescribing rate
mean(opioid.df$prescribing.rate)
mean(opioid.df$overdose.rate, na.rm = TRUE)

# Assign mean values to a variable
mean.prescribing <- mean(opioid.df$prescribing.rate)
mean.overdose <- mean(opioid.df$overdose.rate, na.rm = TRUE)

cor.test(opioid.df$prescribing.rate, opioid.df$overdose.rate, na.rm = TRUE)

# Install packages command, install psych package
# install.packages("psych")

# Load psych package
library(psych)

mean.prescribe.by.year <- describeBy(opioid.df$prescribing.rate, group = opioid.df$year, mat = TRUE)

mean.overdose.by.year <- describeBy(opioid.df$overdose.rate, group = opioid.df$year, mat = TRUE)

write.csv(mean.prescribe.by.year, "mean_prescribing_by_year.csv")
write.csv(mean.overdose.by.year, "mean_overdose_by_year.csv")

