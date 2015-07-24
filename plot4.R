library(plyr)
library(ggplot2)

# prepare data
source("./prepare_data.R")

data <- prepare_data()
NEI <- data$NEI
SCC <- data$SCC

# Subset data
coal_scc_1 <- SCC[SCC$EI.Sector == "Fuel Comb - Electric Generation - Coal", 1]
coal_scc_2 <- SCC[SCC$EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal", 1]
coal_scc_3 <- SCC[SCC$EI.Sector == "Fuel Comb - Comm/Institutional - Coal", 1]

NEI_coal_scc_1 <- subset(NEI, SCC %in% coal_scc_1)
NEI_coal_scc_2 <- subset(NEI, SCC %in% coal_scc_2)
NEI_coal_scc_3 <- subset(NEI, SCC %in% coal_scc_3)

NEI_coal_scc <- rbind(NEI_coal_scc_1, NEI_coal_scc_2, NEI_coal_scc_3)

# plot4
with(NEI_coal_scc, {

  png(filename = "plot4.png")  
  
  plot_data <- ddply(NEI_coal_scc, .(year), numcolwise(sum))
  
  plot <- ggplot(plot_data) + aes(x = factor(year), y = Emissions, group = 1) + geom_point(size = 4) + geom_line() + labs(title = expression('Emissions of PM'[2.5] ~ ' in the United States from coal combustion-related sources'), x = "Year", y = expression("Total PM"[2.5] ~ "emission (tons)")) + theme(plot.title = element_text(size = 10))
  
  print(plot)
  
  dev.off()

})
