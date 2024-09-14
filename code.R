# Ensure ggplot2 is installed and loaded for data visualization
if (!require(ggplot2)) install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

# Load the mtcars dataset
data("mtcars")
print(head(mtcars))
print(summary(mtcars))

# Descriptive statistics
stats_summary <- summary(mtcars)
print(stats_summary)
mean_mpg <- mean(mtcars$mpg)
median_mpg <- median(mtcars$mpg)
cat("Mean of MPG:", mean_mpg, "\n")
cat("Median of MPG:", median_mpg, "\n")

# Histogram of mpg
mpg_histogram <- ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram(bins = 10, fill = "blue", color = "black") + 
  ggtitle("Distribution of Miles Per Gallon") + 
  theme_minimal()
print(mpg_histogram)  # Explicitly call print to display the plot

# Scatter plot of mpg vs. displacement with regression line
mpg_disp_scatter <- ggplot(mtcars, aes(x = disp, y = mpg)) +
  geom_point() +
  geom_smooth(method = lm, col = "red") +
  labs(x = "Displacement", y = "Miles Per Gallon", title = "MPG vs. Displacement") +
  theme_light()
print(mpg_disp_scatter)  # Explicitly call print to display the plot

# Linear regression of mpg on displacement
fit <- lm(mpg ~ disp, data = mtcars)
print(summary(fit))

# Save the plots if needed
ggsave("mpg_histogram.png", plot = mpg_histogram, width = 10, height = 6)
ggsave("mpg_disp_scatter.png", plot = mpg_disp_scatter, width = 10, height = 6)
