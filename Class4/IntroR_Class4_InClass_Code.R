# Class 4, In Class Demonstration and Instruction Code

# Citation: The data below was retrieved from gapminder and merged into one data set
# Link for the source: https://www.gapminder.org/data/

# Read in example data for factors
state.df <- read.csv("~/Documents/R_Class_Meetup/Class4/Data/factor_demonstration_data.csv", stringsAsFactors = F)

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

# You can use the is.na() function to locate the missing values
# This will print TRUE when a missing or NA value exists and FALSE when there is no missing value
is.na(state.df$temperature)

# Below replaces the NA value in temperature with a blank value
state.df$temperature[is.na(state.df$temperature)] <- ""

# Read in world data
world.df <- unique(read.csv("~/Documents/R_Class_Meetup/Class4/Data/world_data_merged.csv", stringsAsFactors = F))

# Below I am showing how to change values within a column
# Currently Virgin Islands has (U.S.) after the name, I am going to change this value
world.df$country[world.df$country == "Virgin Islands (U.S.)"] <- "U.S. Virgin Islands"

# I purposefully made a typo in the povery.lt.dollar.quarter.percent.2010
# I left out the t in poverty
# This is the 17th variable in the data frame
# Knowing that we can change the column name to poverty.lt.dollar.quarter.percent.2010
colnames(world.df)[17] <- "poverty.lt.dollar.quarter.percent.2010"

# We will replace all the column names in the state.df data frame
colnames(state.df) <- c("state", "temperature", "temperature.group")

# Finding median of human.develop.index.2011 variable and setting it to median.hdi
# Remember to remove missing values or your median will return as NA!
median.hdi <- median(world.df$human.develop.index.2011, na.rm = TRUE)

# Now I am using an if/else statement to set values above the median to "High"
# and values below the median as "Low"
world.df$hdi.level <- ifelse(world.df$human.develop.index.2011 > median.hdi, 
                             "High", "Low")

# You can also nest ifelse() statements inside one another
# Pulling the 33rd and 66th percentiles so I can split the HDI group into 3 equal high, medium, and low groups
perc.hdi <- quantile(world.df$human.develop.index.2011, probs = c(0.333, 0.666), na.rm = T)

# Using a nested ifelse() statement to create 3 high, medium, low groups with the percentile values
world.df$hdi.level3 <- ifelse(world.df$human.develop.index.2011 < perc.hdi[1], "Low",
                              ifelse((world.df$human.develop.index.2011 >= perc.hdi[1] &
                                       world.df$human.develop.index.2011 <= perc.hdi[2]), "Middle", "High"))

#### Demonstrating 4 types of joins ####
# Reading in data to demonstrate joins, this is
median.age.df <- read.csv("~/Documents/R_Class_Meetup/Class4/Data/median_age_wProjections.csv", stringsAsFactors = F)

# Below is an inner join
# This keeps only those rows that have matches in both data sets
inner.join.ex <- merge(world.df, median.age.df, by = "country")
nrow(world.df)
nrow(median.age.df)
nrow(inner.join.ex)

# Below is an example of a left join
# This will keep the number of rows constant from the first data frame listed if there are no duplicate values
# NOTE: If you see the number of rows increase, THERE ARE DUPLICATES
left.join.ex <- merge(world.df, median.age.df, by = "country", all.x = TRUE)
nrow(world.df)
nrow(median.age.df)
nrow(left.join.ex)

# Below is an example of a right join
# This will keep the number of rows constant from the second data frame listed if there are no duplicate values
# NOTE: If you see the number of rows increase, THERE ARE DUPLICATES
right.join.ex <- merge(world.df, median.age.df, by = "country", all.y = TRUE)
nrow(world.df)
nrow(median.age.df)
nrow(right.join.ex)

# Below is an example of a full join
# This will keep all rows in the merged data set whether they match or not
full.join.ex <- merge(world.df, median.age.df, by = "country", all = TRUE)
nrow(world.df)
nrow(median.age.df)
nrow(full.join.ex)

# Setting up vectors to demonstrate row and column binding
female.names <- c("Erin", "Alexa", "Joyce", "Lauren")
female.accuracy <- c(0.9, 0.6, 0.74, 0.8)

male.names <- c("Mike", "Aaron", "Ted", "Adam")
male.accuracy <- c(0.55, 0.95, 0.8, 0.6)

# If I want to create a male and female data frame with names and accuracy
## I use cbind() and data.frame() to create the the data frame
female.data <- data.frame(cbind(female.names, female.accuracy))
# I can do the same for male data
male.data <- data.frame(cbind(male.names, male.accuracy))

# Now if I name the columns the same I can append the two data frames 
## into an accuracy data frame for both genders
names.data <- c("names", "accuracy")
colnames(female.data) <- names.data
colnames(male.data) <- names.data

# Now I can use rbind() to bind rows
accuracy.data <- rbind(female.data, male.data)

# Now print accuracy.data to see the end result
accuracy.data
