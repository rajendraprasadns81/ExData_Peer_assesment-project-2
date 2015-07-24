library(plyr)
library(ggplot2)

# prepare data
source("./prepare_data.R")

data <- prepare_data()
NEI <- data$NEI
SCC <- data$SCC

# Subset data
onroad_scc <- SCC[SCC$Data.Category == "Onroad", 1]
onroad_NEI <- subset(NEI, SCC %in% onroad_scc)
baltimore_onroad_NEI <- subset(onroad_NEI, onroad_NEI$fips == "24510")
baltimore_onroad_NEI$city <- "Baltimore City"
los_angeles_onroad_NEI <- subset(onroad_NEI, onroad_NEI$fips == "06037")
los_angeles_onroad_NEI$city <- "Los Angeles County"

# plot6
with(c(baltimore_onroad_NEI ,los_angeles_onroad_NEI), {
  
  png(filename = "plot6.png")  
  
  combined_data <- rbind(baltimore_onroad_NEI, los_angeles_onroad_NEI)
  
  plot_data <- ddply(combined_data, .(year, city), numcolwise(sum))
  
  plot <- ggplot(plot_data) + aes(x = factor(year), y = Emissions, group = factor(city), colour = factor(city)) + geom_point(size = 4) + geom_line() + labs(title = expression('Emissions of PM'[2.5] ~ ' in Baltimore City and Los Angeles County from motor vehicle sources'), x = "Year", y = expression("Total PM"[2.5] ~ "emission (tons)"), colour = "City") + theme(plot.title = element_text(size = 8))
  
  print(plot)
  
  dev.off()
  
})
