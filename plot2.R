##################################
## plot2.R
# Get the source data
source("GetSourceData.R") 

# 2.  Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.
# 24510 is Baltimore, MD fips 
NEI4BALTIMORE  <- NEI[NEI$fips=="24510", ] 
aggregatedByYear <- aggregate(Emissions ~ year, NEI4BALTIMORE, sum) 

# Plotting
barplot(height=aggregatedByYear$Emissions, 
        names.arg=aggregatedByYear$year, 
        xlab="years", 
        ylab=expression('Total PM2.5 emission (Tons)'),
        main=expression('Emissions in Baltimore (MD) from 1999 to 2008')) 

# Saving the plot to a file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
