library(plyr)
library(ggplot2)

# prepare data
source("./prepare_data.R")

data <- prepare_data()
NEI <- data$NEI
SCC <- data$SCC

# Subset data
baltimore_NEI <- subset(NEI, NEI$fips == "24510")

# plot3
with(baltimore_NEI, {

  png(filename = "plot3.png")  

  plot_data <- ddply(baltimore_NEI, .(year, type), numcolwise(sum))
  #plot_data <- transform(plot_data, type = factor(type))

  plot <- ggplot(plot_data) + aes(x = factor(year), y = Emissions, group = type, col = type) + geom_line() + geom_point() + labs(title = expression('Emissions of PM'[2.5] ~ ' in Baltimore'), x = "Year", y = expression("Total PM"[2.5] ~ "emission (tons)"), fill = "Year")

  print(plot)

  dev.off()

})