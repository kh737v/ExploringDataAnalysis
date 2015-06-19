##################################
## plot4.R
## Get the source data and library
source("GetSourceData.R") 
library(ggplot2) 

# 4.  Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
# Get subset data with Short.Name (SCC) Coal 
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

# Plotting
gp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity") + 
  xlab("year") + 
  ylab(expression('Total PM2.5 Emissions (Tons)')) + 
  ggtitle('Emissions from coal sources in USA from 1999 to 2008') 
print(gp)

# Saving the plot to a file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

