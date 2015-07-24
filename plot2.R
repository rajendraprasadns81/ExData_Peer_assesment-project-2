# prepare data
source("./prepare_data.R")
data <- prepare_data()
NEI <- data$NEI
SCC <- data$SCC

# Subset data

baltimore_NEI <- subset(NEI, NEI$fips == "24510")

# plot2
with(baltimore_NEI, {
  
  png(filename = "plot2.png")  
  
  y <- baltimore_NEI$Emissions
  x <- baltimore_NEI$year
  plot_data <- tapply(y, x, FUN = sum)
  barplot(plot_data, main = expression("Emissions of PM"[2.5] ~ " in Baltimore"), ylab = expression("Total PM"[2.5] ~ "emission (tons)"), xlab = "Year")
  lines(plot_data * 0.8, col = "green", lwd = 4)
  points(plot_data * 0.8, col = "green", lwd = 8)
  
  dev.off()
  
})