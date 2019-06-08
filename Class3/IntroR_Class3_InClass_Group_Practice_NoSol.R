# Intro R: Optional supplemental practice code for Class 2

# Citation: Data from:
## Kaiser Family Foundation, Health Insurance Data: https://www.kff.org/other/state-indicator/nonelderly-up-to-100-fpl/?currentTimeframe=0&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D
## Kaiser Family Founcation, Demographic Data: https://www.kff.org/state-category/demographics-and-the-economy/

# Set working directory


# Read in data from Github called health_insurance_demographic_data.csv
# Name it health.demo

# Look at the first 6 rows in the health.demo data frame


# Print how many rows are in the health.demo data frame

# State is currently a factor variable. Change it to a character variable
# Overwrite old variable with new character variable

# Create a logical vector with the perc.uninsure that will mark TRUE if the
## uninsured percent is above 0.10 and FALSE if it is less than or equal to 0.10
# Name the logical vector bool.unins

# Use the table() function on the bool.unins variable to find out how many 
## values are above 0.10

# Subset the data using this logical vector to just those states with uninsured
## percents greater than 0.10, return all rows
# Name the data frame unins.gt.10

# Make sure your data has 18 rows by printing number of rows (18 states)


# Find the mean of the original data set (health.demo) of the fpl.100_199 variable
# Set this mean value to equal a variable called fpl.100.avg


# Using the unins.gt.10 data frame, create another boolean vector that returns
## TRUE for those states with fpl.100_199 greater than the mean and FALSE if
## is less than or equal to the mean
# Name this logical vector bool.fpl


# Use the table() function to see how many states are above and below the mean percent
## of the population below 100 FPL


# Use the indexing to subset the health.demo data frame to the first 6 columns
## (health insurance variables)


# Check to make sure there are 6 columns in the data frame


# Use the subset() function to subset the health.demo to those values with fpl.100_199
## greater than the mean (the variable you created fpl.100.avg)


# Check to make sure there are 29 rows in your new data frame


# Export the unins.gt.10 variable to your working directory

