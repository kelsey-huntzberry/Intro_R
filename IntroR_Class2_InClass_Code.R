# Introduction to R: Class 2 in Class Code

# Below is an example of how to create a basic matrix from a vector
# Create vector
fruit.prices <- c(0.35, 0.42, 0.55, 0.30, 0.40, 0.60)
# Turn vector into a matrix
fruit.matrix.basic <- matrix(fruit.prices, byrow = FALSE, nrow = 3) 
# Print matrix
fruit.matrix.basic

# Below shows how to create a matrix and add labels
fruit.matrix <- matrix(fruit.prices, byrow = FALSE, nrow = 3, 
                       dimnames = list(c(1,2,3), c("apples", "oranges"))) 
# Print new matrix with labels
fruit.matrix

# Below showing how to make a data frame with a matrix
## Notice that the two chunks of code create the same output, 
# In R you can combined and nest functions within one another
# Create vector
rainfall.vect <- c("Austin", 1, "San Antonio", 0.7, "Houston", 0.5, "Dallas", 0)
# Turn a vector into a matrix with 2 columns and labels
rainfall.matrix <- matrix(rainfall.vect, byrow = TRUE, ncol = 2,
                          dimnames = list(c(1,2,3,4), c("city", "rainfall")))
# Turn matrix into a data frame
rainfall.df <- data.frame(rainfall.matrix)
# Prints result
rainfall.df

# Produces the same output as the chunk above just with nested functions & fewer steps
# Creates matrix and nests that code inside the data.frame() function
rainfall.df <- data.frame(matrix(rainfall.vect, byrow = TRUE, ncol = 2,
                                 dimnames = list(c(1,2,3,4), c("city", "rainfall"))))
# Prints resulting rainfall data frame
rainfall.df
# What data structure is rainfall.df?
class(rainfall.df)
# What data structure is the city variable within rainfall.df?
class(rainfall.df$city)
# Change rainfall$city to a character variable and show the difference in enviroment
rainfall.df$city <- as.character(rainfall.df$city)

# Create a vector of cities and states
city.state <- c("Austin", "Philadelphia", "Charleston", "San Francisco", 
                "Texas", "Pennsylvania", "South Carolina", "California")
# Create a matrix with the cities and states
location.df <- data.frame(matrix(city.state, ncol = 2, byrow = F,
                          dimnames = list(c(1,2,3,4), c("city", "state"))))

# Change city to character variable and show the difference in enviroment
location.df$city <- as.character(location.df$city)

# Show how a factor variable will change to stored value not actual value
# when using as.numeric
#rainfall.df$rainfall <- as.numeric(rainfall.df$rainfall)

# Show how changing it to a character first solves this problem
rainfall.df$rainfall <- as.numeric(as.character(rainfall.df$rainfall))
# Changing city variable to a character variable
rainfall.df$city <- as.character(rainfall.df$city)

# Indexing with a vector examples below
states <- c("Alabama", "Texas", "Arkansas", "New Jersey")
# Pulling one value
states[2]
states[4]
# Pulling more than one value
states[2:4]
states[1:2]

# Indexing based on value
# Print fruit.prices
fruit.prices
# Create logical vector pulling all values greater than or equal to 0.40
bool <- fruit.prices >= 0.40
# Print resulting logical vector
bool
# Use logical vector to index and subset fruit.prices
fruit.prices[bool]

# Indexing using data frames example below
# Print rainfall.df
rainfall.df
# Pulling one data point
rainfall.df[3,2]
# Pulling multiple data points
rainfall.df[2:4, 1:2]
# Pulling a whole row
rainfall.df[ ,2]
# Pulling a whole column
rainfall.df[3, ]

# Create a logical vector based on rainfall value
bool.df <- rainfall.df$rainfall > 0.5
# Print resulting logical vector
bool.df
# Subset data frame to rows with rainfall greater than 0.5
rainfall.sm <- rainfall.df[bool.df, ]
# Print result
rainfall.sm
