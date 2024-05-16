## Flight Delay Analysis

This document explores flight delay data and analyzes the impact of various factors on delays.

**Data Acquisition and Exploration**

```R
# Install required packages (if not already installed)
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github("tidyverse/readxl")
library(readxl)
library(dplyr)
library(plotly)

# Read the flight delay data
flight_data <- read_excel("C:/Data Analytics - Master course Simplilearn/Course 5 - Data Analytics with R/1657873325_flightdelays.xlsx")

# Check for missing values
summary(flight_data)

# Understand data structure
str(flight_data)
```

**Data Visualization**

**1. Histograms**

```R
# Loop to create histograms for various variables
vars <- c("schedtime", "carrier", "dest", "origin", "distance", "dayweek", "daymonth")

for (var in vars) {
  p <- plot_ly(flight_data, x = ~get(var), type = "histogram", nbinsx = 30) %>%
    layout(title = paste("Histogram of", var))
  print(p)
}
```

**2. Scatter Plot (Flights on Time vs. Delayed)**

```R
# Create scatter plot for scheduled vs departure time with color distinction
p <- plot_ly(data = flight_data, x = ~schedtime, y = ~deptime, type = 'scatter', mode = 'markers') %>%
  add_trace(x = ~schedtime, y = ~deptime, color = ~delay, mode = 'markers') %>%
  layout(title = "Scatter plot for flights based on scheduled and departure time",
         xaxis = list(title = "Scheduled Time"),
         yaxis = list(title = "Departure Time"))

print(p)
```

**3. Box Plot (Delay by Day of Month)**

```R
p <- plot_ly(flight_data, x = ~as.factor(daymonth), y = ~deptime, color = ~delay, type = "box") %>%
  layout(title = "Box plot for flight delays by day of the month")

print(p)
```

**4. Analyze Departures by Hour**

```R
# Extract hour of departure
flight_data$deptime_char <- as.character(flight_data$deptime)
flight_data$hour_of_departure <- as.numeric(substr(flight_data$deptime_char, start = 1, stop = nchar(flight_data$deptime_char) - 2))

# Explore departures by hour (consider histograms or boxplots)
```

**5. Categorical Data Analysis (Carrier vs. Delay)**

```R
# Contingency table for carrier vs. delay
contingency_table <- table(flight_data$carrier, flight_data$delay)

# Explore the contingency table (consider bar charts or visualizations)
```

**6. Delay Distribution**

```R
# Redefine delay variable (0: On-time, 1: Delayed)
flight_data$delay <- ifelse(flight_data$delay == "ontime", 0, 1)

# Calculate delay distribution and visualize with pie chart
delay_counts <- table(flight_data$delay)
plot_ly(labels = c("On Time", "Delayed"), values = delay_counts, type = 'pie') %>%
  layout(title = "Distribution of Flight Delays")
```

**7. Further Analysis of Flight Delays**

Here's the code for further analysis of the flight delays data, building upon the previous exploration:

**i) Weather and Delay Relationship**

**Option A: Visualization (Box Plot)**

```R
p <- plot_ly(flight_data, x = ~factor(weather), y = ~deptime, color = ~delay, type = "box") %>%
  layout(title = "Box plot for flight delays by weather condition",
         xaxis = list(title = "Weather Code"))
print(p)
```

**Option B: Statistical Test (Chi-Square Test)**

```R
# Create a contingency table
weather_delay_table <- table(flight_data$weather, flight_data$delay)

# Perform Chi-square test
chisq.test(weather_delay_table)
```

**ii) Delay Patterns by Carrier**

```R
# Group data by carrier
carrier_groups <- dplyr::group_by(flight_data, carrier)

# Analyze delay patterns (consider boxplots, histograms, or other visualizations)
# Example: Boxplot for delay by carrier
carrier_groups %>%
  summarise(mean_delay = mean(delay)) %>%
  ggplot(aes(x = carrier, y = mean_delay)) +
  geom_boxplot() +
  labs(title = "Average Delay by Carrier", x = "Carrier", y = "Average Delay")
```

**iii) Impact of Distance and Day of Week**

**Option A: Visualization (Scatter Plots)**

```R
p1 <- plot_ly(flight_data, x = ~distance, y = ~deptime, color = ~delay, mode = 'markers') %>%
  layout(title = "Scatter plot for delay vs. distance")
print(p1)

p2 <- plot_ly(flight_data, x = ~factor(dayweek), y = ~deptime, color = ~delay, type = "box") %>%
  layout(title = "Box plot for flight delays by day of the week",
         xaxis = list(title = "Day of Week"))
print(p2)
```

**Option B: Statistical Test (ANOVA)**

```R
# Test for difference in delay means by day of week
library(lmtest)
fit <- lm(delay ~ factor(dayweek), data = flight_data)
anova(fit)
```

**Remember to replace `FlightDelays.csv` with your actual data file path.** Explore the results of these analyses to understand how weather, carrier, distance, and day of the week influence flight delays. You can further customize the visualizations and statistical tests based on your specific interests.


**Conclusion**

This analysis provided insights into flight delays using visualizations. You can delve deeper to explore specific factors influencing delays and potentially build predictive models.

