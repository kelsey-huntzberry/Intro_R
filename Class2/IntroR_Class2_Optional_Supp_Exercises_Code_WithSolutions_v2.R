# Intro R: Optional supplemental practice code for Class 2

# Citation: Data from:
## Kaiser Family Foundation, Health Insurance Data: https://www.kff.org/other/state-indicator/nonelderly-up-to-100-fpl/?currentTimeframe=0&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D
## Kaiser Family Founcation, Demographic Data: https://www.kff.org/state-category/demographics-and-the-economy/

# Set working directory
setwd("~/Documents/R_Class_Meetup/Class2/Results")

# Adding in vectors that you will be working with
# These are vectors showing the percent of people on medicaid
states <- c("North Dakota", "Nebraska", "Kansas", "South Dakota", 
            "Missouri", "Wisconsin", "Minnesota", "Indiana", "Iowa", 
            "Illinois", "Ohio", "Michigan" )
ins.values <- c(0.11, 0.13, 0.14, 0.14, 0.16, 0.18, 0.19, 0.20, 
                0.20, 0.22, 0.23, 0.25, 0.08, 0.09, 0.10, 0.10,
                0.11, 0.09, 0.08, 0.11, 0.08, 0.11, 0.11, 0.12)

# Create a matrix with the ins.values values and name it ins.mat
# Make sure there is two columns
# You want the values to fill up the entire column and move onto second column
# Set the row names as the states vector above
# Set the first column as perc.medicaid and the second column as fpl.lt.100
ins.mat <- matrix(ins.values, ncol = 2, byrow = FALSE,
                  dimnames = list(states, c("perc.medicaid", "fpl.lt.100")))

# Multiply entire matrix by 100 so percents will be in whole numbers
# Set new matrix to ins.whole
ins.whole <- ins.mat*100

# Convert ins.whole to a data frame called ins.df
ins.df <- data.frame(ins.whole)

# Run the following code. This will turn the states labels into a column
# Call the new variable to be named states
ins.df$states <- rownames(ins.df)

# Change ins.df$states to a factor variable
# Overwrite old variable
ins.df$states <- as.factor(ins.df$states)

# The data frame is already sorted by perc.medicaid
# Use indexing to subset ins.df$perc.medicaid to the last 5 values (largest percentages)
# HINT: When you use indexing on just one variable as written above it will automatically 
## be converted to a vector. It will then perform like any other vector
# Name that new vector perc.medicaid.high

perc.medicaid.high <- ins.df$perc.medicaid[6:10]

# Then do the same thing for the first 5 values of perc.medicaid variable
# Call that vector perc.medicaid.low
perc.medicaid.low <- ins.df$perc.medicaid[5]

# Print the mean of the perc.medicaid.high values
# Print the mean of the perc.medicaid.low values
mean(perc.medicaid.high)
mean(perc.medicaid.low)