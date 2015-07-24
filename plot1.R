# prepare data
source("./prepare_data.R")
data <- prepare_data()
NEI <- data$NEI
SCC <- data$SCC

# plot1
with(NEI, {
  
  png(filename = "plot1.png")  

  y <- NEI$Emissions
  x <- NEI$year
  plot_data <- tapply(y, x, FUN = sum)
  
  barplot(plot_data, main = expression('Emissions of PM'[2.5] ~ ' in the United States'), ylab = expression('Total PM'[2.5] ~ 'emission (tons)'), xlab = "Year")
  
  lines(plot_data * 0.8, col = "green", lwd = 4)
  points(plot_data * 0.8, col = "green", lwd = 8)
  
  dev.off()

})
