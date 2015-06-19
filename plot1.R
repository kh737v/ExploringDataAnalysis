##################################
## plot1.R
## Get the source data
source("GetSourceData.R") 

# 1.  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.
aggregatedByYear <- aggregate(Emissions ~ year, NEI, sum) 

# Plotting
barplot(height=(aggregatedByYear$Emissions)/10^6, 
        names.arg=aggregatedByYear$year, 
        xlab="years", 
        ylab=expression('Total PM2.5 emission (Tons)'),
        main=expression('Emissions in USA from 1999 to 2008')) 

# Saving the plot to a file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
