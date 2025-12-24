# Input Data
project_hectares <- 16000
avoided_base_value <- 7    # $/CO2 initial
removal_base_value <- 10   # $/CO2 initial
avoided_credits <- 18949.3
removal_credits <- 52110.7

# Credit Scenarios
years <- c(2025, 2026, 2027, 2028, 2029)
credit_types <- c("Avoided only", "Avoided only", "Avoided + removals", "Avoided only", "Avoided + removals")

# Sensitivity Analysis Ranges
avoided_range <- seq(7, 30, by = 1)  # $/CO2
removal_range <- seq(7, 60, by = 1)  # $/CO2

# Sensitivity Analysis Calculation
results <- expand.grid(Avoided_Value = avoided_range, Removal_Value = removal_range)
results$Total_Revenue <- 0

for (i in 1:nrow(results)) {
  avoided_value <- results$Avoided_Value[i]
  removal_value <- results$Removal_Value[i]
  
  # Calculate total revenue across the project period
  total_revenue <- 0
  for (year in 1:length(years)) {
    if (credit_types[year] == "Avoided only") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value)
    } else if (credit_types[year] == "Avoided + removals") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value + removal_credits * removal_value)
    }
  }
  
  results$Total_Revenue[i] <- total_revenue
}

# Display Results
library(ggplot2)
ggplot(results, aes(x = Avoided_Value, y = Removal_Value, fill = Total_Revenue)) +
  geom_tile() +
  scale_fill_gradient(name = "Total Revenue ($)", low = "lightblue", high = "darkblue") +
  labs(
    title = "Sensitivity Analysis of Annual Credit Value",
    x = "Avoided Credit Value ($/CO2)",
    y = "Removal Credit Value ($/CO2)"
  ) +
  theme_minimal()




################# 2


# Load Required Libraries
library(plotly)

# Input Data
project_hectares <- 16000
avoided_base_value <- 7    # $/CO2 initial
removal_base_value <- 10   # $/CO2 initial
avoided_credits <- 18949.3
removal_credits <- 52110.7

# Credit Scenarios
years <- c(2025, 2026, 2027, 2028, 2029)
credit_types <- c("Avoided only", "Avoided only", "Avoided + removals", "Avoided only", "Avoided + removals")

# Sensitivity Analysis Ranges
avoided_range <- seq(7, 30, by = 1)  # $/CO2
removal_range <- seq(7, 60, by = 1)  # $/CO2

# Sensitivity Analysis Calculation
results <- expand.grid(Avoided_Value = avoided_range, Removal_Value = removal_range)
results$Total_Revenue <- 0

for (i in 1:nrow(results)) {
  avoided_value <- results$Avoided_Value[i]
  removal_value <- results$Removal_Value[i]
  
  # Calculate total revenue across the project period
  total_revenue <- 0
  for (year in 1:length(years)) {
    if (credit_types[year] == "Avoided only") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value)
    } else if (credit_types[year] == "Avoided + removals") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value + removal_credits * removal_value)
    }
  }
  
  results$Total_Revenue[i] <- total_revenue
}

# Create Interactive Plot
fig <- plot_ly(
  data = results,
  x = ~Avoided_Value,
  y = ~Removal_Value,
  z = ~Total_Revenue,
  type = "heatmap",
  colors = colorRamp(c("lightblue", "darkblue"))
) %>%
  layout(
    title = "Sensitivity Analysis of Annual Credit Value",
    xaxis = list(title = "Avoided Credit Value ($/CO2)"),
    yaxis = list(title = "Removal Credit Value ($/CO2)"),
    colorbar = list(title = "Total Revenue ($)")
  ) %>%
  add_annotations(
    text = ~paste("Total Revenue: $", round(Total_Revenue, 2)),
    hoverinfo = "text"
  )

fig



####### 3 


# Load Required Libraries
library(plotly)

# Input Data
project_hectares <- 16000
avoided_base_value <- 7    # $/CO2 initial
removal_base_value <- 10   # $/CO2 initial
avoided_credits <- 18949.3
removal_credits <- 52110.7

# Credit Scenarios
years <- c(2025, 2026, 2027, 2028, 2029)
credit_types <- c("Avoided only", "Avoided only", "Avoided + removals", "Avoided only", "Avoided + removals")

# Sensitivity Analysis Ranges
avoided_range <- seq(7, 30, by = 1)  # $/CO2
removal_range <- seq(7, 60, by = 1)  # $/CO2

# Sensitivity Analysis Calculation
results <- expand.grid(Avoided_Value = avoided_range, Removal_Value = removal_range)
results$Total_Revenue <- 0

for (i in 1:nrow(results)) {
  avoided_value <- results$Avoided_Value[i]
  removal_value <- results$Removal_Value[i]
  
  # Calculate total revenue across the project period
  total_revenue <- 0
  for (year in 1:length(years)) {
    if (credit_types[year] == "Avoided only") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value)
    } else if (credit_types[year] == "Avoided + removals") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value + removal_credits * removal_value)
    }
  }
  
  results$Total_Revenue[i] <- total_revenue
}

# Create Interactive Plot
fig <- plot_ly(
  data = results,
  x = ~Avoided_Value,
  y = ~Removal_Value,
  z = ~Total_Revenue,
  type = "heatmap",
  colors = colorRamp(c("lightblue", "darkblue"))
) %>%
  layout(
    title = "Sensitivity Analysis of Annual Credit Value",
    xaxis = list(title = "Avoided Credit Value ($/CO2)"),
    yaxis = list(title = "Removal Credit Value ($/CO2)"),
    colorbar = list(title = "Total Revenue ($)")
  ) %>%
  style(hoverinfo = "x+y+z")  # Show x, y, and revenue estimate on hover

fig

# Save the plot as an interactive HTML file
htmlwidgets::saveWidget(
  widget = fig,                   # The plotly figure object
  file = "sensitivity_analysis.html",  # The output file name
  selfcontained = TRUE            # Save as a self-contained HTML file
)


############### 4 with new benefits ############

# Load Required Libraries
library(plotly)

# Input Data
project_hectares <- 16000
avoided_base_value <- 7    # $/CO2 initial
removal_base_value <- 10   # $/CO2 initial
avoided_credits <- 18949.3
removal_credits <- 52110.7
fixed_cost <- 1484625.80   # Cost for five years

# Credit Scenarios
years <- c(2025, 2026, 2027, 2028, 2029)
credit_types <- c("Avoided only", "Avoided only", "Avoided + removals", "Avoided only", "Avoided + removals")

# Sensitivity Analysis Ranges
avoided_range <- seq(7, 30, by = 1)  # $/CO2
removal_range <- seq(7, 60, by = 1)  # $/CO2

# Sensitivity Analysis Calculation
results <- expand.grid(Avoided_Value = avoided_range, Removal_Value = removal_range)
results$Net_Revenue <- 0

for (i in 1:nrow(results)) {
  avoided_value <- results$Avoided_Value[i]
  removal_value <- results$Removal_Value[i]
  
  # Calculate total revenue across the project period
  total_revenue <- 0
  for (year in 1:length(years)) {
    if (credit_types[year] == "Avoided only") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value)
    } else if (credit_types[year] == "Avoided + removals") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value + removal_credits * removal_value)
    }
  }
  
  # Subtract fixed cost from the total revenue
  results$Net_Revenue[i] <- total_revenue - fixed_cost
}

# Create Interactive Plot
fig <- plot_ly(
  data = results,
  x = ~Avoided_Value,
  y = ~Removal_Value,
  z = ~Net_Revenue,
  type = "heatmap",
  colors = colorRamp(c("lightblue", "darkblue"))
) %>%
  layout(
    title = "Sensitivity Analysis of Net Revenue",
    xaxis = list(title = "Avoided Credit Value ($)"),
    yaxis = list(title = "Removal Credit Value ($)"),
    colorbar = list(title = "Net Revenue ($)")
  ) %>%
  style(hoverinfo = "x+y+z")  # Show x, y, and revenue estimate on hover

# Display the plot
fig

# Save the plot as an interactive HTML file
htmlwidgets::saveWidget(
  widget = fig,                   # The plotly figure object
  file = "Corelife-Net_revenue.html",  # The output file name
  selfcontained = TRUE            # Save as a self-contained HTML file
)


############# 5 Profit to farmers ##############

# Load Required Libraries
library(plotly)

# Input Data
project_hectares <- 16000
avoided_base_value <- 7    # $/CO2 initial
removal_base_value <- 10   # $/CO2 initial
avoided_credits <- 18949.3
removal_credits <- 52110.7
fixed_cost <- 1484625.80   # Cost for five years
exchange_rate <- 86.21     # Conversion rate: $1 = ₹82.50
total_farmers <- 13000     # Total farmers

# Credit Scenarios
years <- c(2025, 2026, 2027, 2028, 2029)
credit_types <- c("Avoided only", "Avoided only", "Avoided + removals", "Avoided only", "Avoided + removals")

# Sensitivity Analysis Ranges
avoided_range <- seq(7, 30, by = 1)  # $/CO2
removal_range <- seq(7, 60, by = 1)  # $/CO2

# Sensitivity Analysis Calculation
results <- expand.grid(Avoided_Value = avoided_range, Removal_Value = removal_range)
results$Benefit_Per_Farmer <- 0  # Store the benefit per farmer

for (i in 1:nrow(results)) {
  avoided_value <- results$Avoided_Value[i]
  removal_value <- results$Removal_Value[i]
  
  # Calculate total revenue across the project period
  total_revenue <- 0
  for (year in 1:length(years)) {
    if (credit_types[year] == "Avoided only") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value)
    } else if (credit_types[year] == "Avoided + removals") {
      total_revenue <- total_revenue + (avoided_credits * avoided_value + removal_credits * removal_value)
    }
  }
  
  # Subtract fixed cost, convert to INR, and calculate per farmer benefit
  net_revenue <- (total_revenue - fixed_cost) * exchange_rate
  results$Benefit_Per_Farmer[i] <- net_revenue / total_farmers
}

# Create Interactive Plot
fig <- plot_ly(
  data = results,
  x = ~Avoided_Value,
  y = ~Removal_Value,
  z = ~Benefit_Per_Farmer,
  type = "heatmap",
  colors = colorRamp(c("lightgreen", "darkgreen"))
) %>%
  layout(
    title = "Sensitivity Analysis of Net Benefit Per Farmer (₹)",
    xaxis = list(title = "Avoided Credit Value ($)"),
    yaxis = list(title = "Removal Credit Value ($)"),
    colorbar = list(title = "Benefit Per Farmer (₹)")
  ) %>%
  style(hoverinfo = "x+y+z")  # Show x, y, and benefit per farmer on hover

# Display the plot
fig

# Save the plot as an interactive HTML file
htmlwidgets::saveWidget(
  widget = fig,                          # The plotly figure object
  file = "Corelife-benefit_per_farmer.html",  # The output file name
  selfcontained = TRUE                   # Save as a self-contained HTML file
)
