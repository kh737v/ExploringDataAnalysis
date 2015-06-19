##################################
## plot3.R
# Get the source data and library
source("GetSourceData.R") 
library(ggplot2) 

# 3.  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
# 24510 is Baltimore, MD fips 
NEI4BALTIMORE  <- NEI[NEI$fips=="24510", ] 

# Plotting
gp <- ggplot(NEI4BALTIMORE, aes(factor(year), Emissions, fill=type)) +
  geom_bar(stat="identity") + 
  theme_bw() + 
  guides(fill=FALSE) + 
  facet_grid(.~type,scales = "free",space="free") +   
  xlab("year") + 
  ylab(expression('Total PM2.5 Emissions (Tons)')) + 
  ggtitle('Emissions by the source types in Baltimore (MD) from 1999 to 2008') 
print(gp) 

# Saving the plot to a file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

