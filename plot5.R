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

# plot5
with(baltimore_onroad_NEI, {
  
  png(filename = "plot5.png")  
  
  plot_data <- ddply(baltimore_onroad_NEI, .(year), numcolwise(sum))
  
  plot <- ggplot(plot_data) + aes(x = factor(year), y = Emissions, group = 1) + geom_point(size = 4) + geom_line() + labs(title = expression('Emissions of PM'[2.5] ~ ' in Baltimore from motor vehicle sources'), x = "Year", y = expression("Total PM"[2.5] ~ "emission (tons)")) + theme(plot.title = element_text(size = 10))
  
  print(plot)
  
  dev.off()
  
})
