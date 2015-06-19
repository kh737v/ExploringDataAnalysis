##################################
## plot6.R
## Get the source data and library
source("GetSourceData.R") 
library(ggplot2) 

# 6.  Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Get subset data for fips 24510 and 06037 and vehicle in NEI 
# 24510 is Baltimore,MD fips and 06037 is for LA,CA
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]
vehiclesBaltimoreNEI$city <- "Baltimore City"
vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"
combine <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)

# Plotting
gp <- ggplot(combine, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(stat="identity") + 
  facet_grid(. ~ fips) +
  xlab("year") + 
  ylab(expression('Total PM2.5 Emissions (Tons)')) + 
  ggtitle('Emissions from motor vehicle in Baltimore City(MD) and Los Angeles(CA) from 1999 to 2008') 
print(gp) 

# Saving the plot to a file
dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()
