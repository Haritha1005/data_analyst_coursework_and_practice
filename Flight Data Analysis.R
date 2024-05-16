# Step 1: Install and load necessary packages
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github("tidyverse/readxl")
library(readxl)
library(plotly)

# Step 2: Read the dataset
flight_data <- read_excel("C:/Data Analytics - Master course Simplilearn/Course 5 - Data Analytics with R/1657873325_flightdelays.xlsx")


# Step 3: Understand the data
head(flight_data)  # View the first few rows of the dataset
str(flight_data)   # Structure of the dataset
summary(flight_data)  # Summary statistics of the dataset

# Step 4: Find out the null values
colSums(is.na(flight_data))  # Number of missing values in each column

# Step 5: Install and load the required packages
if (!requireNamespace("plotly", quietly = TRUE)) {
  install.packages("plotly")
}
if (!requireNamespace("magrittr", quietly = TRUE)) {
  install.packages("magrittr")
}
library(plotly)
library(magrittr)

# Step 6: Understand the summary of descriptive statistics
summary(flight_data)

# Step 7: Plot the histograms
for (var in c("schedtime", "carrier", "dest", "origin", "weather", "dayweek")) {
  plot_ly(flight_data, x = ~get(var), type = "histogram", nbinsx = 30) %>%
    layout(title = paste("Histogram of", var)) %>%
    print()
}

# Step 8: Plot the scatter plot
plot_ly(flight_data, x = ~schedtime, y = ~deptime, type = 'scatter', mode = 'markers', color = ~delay) %>%
  layout(title = "Scatter plot for flights based on scheduled and departure time",
         xaxis = list(title = "Scheduled Time"),
         yaxis = list(title = "Departure Time"))

# Step 9: Plot the box plot
plot_ly(flight_data, x = ~as.factor(daymonth), y = ~deptime, color = ~delay, type = "box") %>%
  layout(title = "Box plot for flight delays by day of the month")

# Step 10: Define the hours of departure
flight_data$deptime_char <- as.character(flight_data$deptime)
flight_data$hour_of_departure <- as.numeric(substr(flight_data$deptime_char, start=1, stop=nchar(flight_data$deptime_char)-2))

# Step 11: Create a categorical representation of data using a table
contingency_table <- table(flight_data$carrier, flight_data$delay)
contingency_table

# Step 12: Redefine the delay variables
flight_data$delay <- ifelse(flight_data$delay == "ontime", 0, 1)
