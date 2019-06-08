# Introduction to R, in class code for Class 3

# Set working directory
setwd("~/Documents/R_Class_Meetup/Class3/Results")

# Read in opioid data
opioid.df <- read.csv("~/Documents/R_Class_Meetup/Class3/Data/county_prescribing_rates_data.csv", stringsAsFactors = F)

# Showing frequency of values within the rural.metro variable
table(opioid.df$rural.metro)

# Showing frequency of values within the rural.metro and prescribe.level variables
table(opioid.df$rural.metro, opioid.df$prescribe.level)

# Showing first 6 rows of opioid.df
head(opioid.df)
# Then the last 6 rows
tail(opioid.df)

# Listing the unique values in the year variable
unique(opioid.df$year)

# Find the length (number of values) in th year variable
length(opioid.df$year)

# Finding the number of unique values in the year variable
length(unique(opioid.df$year))

# Find the number of rows and columns in the opioid.df
nrow(opioid.df)
ncol(opioid.df)

# Find the median of the prescribe.rate column
med.prescribe <- median(opioid.df$prescribing.rate)
med.prescribe

# Subset to only those values above the median prescribing rate into a data set with indexing
high.prescribing <- opioid.df[opioid.df$prescribing.rate > med.prescribe, ]
nrow(high.prescribing)

# Put those values from Texas counties into a data set
texas.prescribe <- opioid.df[opioid.df$state == "Texas", ]
nrow(texas.prescribe)

# Subset to just the first 4 columns
prescribe.sm <- opioid.df[ , 1:4]
ncol(prescribe.sm)

# Subset to the first 50 rows
first.50 <- opioid.df[1:50, ]
nrow(first.50)

# Find and print Travis County values
opioid.df[opioid.df$county == "Travis", 4]

# Read in example data for factors
state.df <- read.csv("~/Documents/R_Class_Meetup/Class3/Data/factor_demonstration_data.csv", stringsAsFactors = F)

# Creating a factor variable with state column, placing full state name as the labe
# NOTE: This is an unordered factor, that is the default with this function
state.df$states <- factor(state.df$states, 
                          levels = c("AL", "AK", "DE", "TX"),
                          labels = c("Alabama", "Alaska", "Delaware", "Texas"))

# Creating a factor variable with temp.group column
# NOTE: I created this factor as an ordered factor with ordered = TRUE
state.df$temp.group <- factor(state.df$temp.group,
                              levels = c("Low", "Medium", "High"),
                              ordered = TRUE)

# Notice when you compare values in the temp.group column, you get a value because its ordered
state.df[1,3] > state.df[3,3]

# You will get an error with this code because the states variable is NOT ordered 
## so the values cannot be compared
state.df[1,1] > state.df[3,1]





