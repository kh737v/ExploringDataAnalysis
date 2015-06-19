##################################
## plot5.R
## Get the source data and library
source("GetSourceData.R") 
library(ggplot2) 

# 5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
# Get subset data for vehicle and fips in NEI 
# 24510 is Baltimore,MD fips 
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]

# Plotting
gp <- ggplot(baltimoreVehiclesNEI, aes(factor(year), Emissions)) +
  geom_bar(stat="identity") + 
  xlab("year") + 
  ylab(expression('Total PM2.5 Emissions (Tons)')) + 
  ggtitle('Emissions from motor vehicle in Baltimore(MD) from 1999 to 2008') 
print(gp) 

# Saving the plot to a file
dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()
