### GetSourceData.R - Download and read the source data
# First, download the source zip file from
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# Then save and unzip to the local data directory associated with the work directory
# It should have these files summarySCC_PM25.rds and Source_Classification_Code.rds

# This R script will check if the data object (data.frame) exists or not, if not, 
# it will do readDS() and assign to the data.frame NEI and SCC.
# and this script will be called for the following ploting tasks.

if(!exists("NEI")){ 
  NEI <- readRDS("data/summarySCC_PM25.rds") 
} 
if(!exists("SCC")){ 
  SCC <- readRDS("data/Source_Classification_Code.rds") 
} 
