##
## Exploratory Data Analysis - assignment 2
##     plot3.R
## 

## Load required library
library(ggplot2)

## Launch grephic device - plot3.png
png(filename = "plot3.png", width = 720, height = 480)

## Read the data from rds file into data frame
NEI <- readRDS("ExploratoryData/summarySCC_PM25.rds")
SCC <- readRDS("ExploratoryData/Source_Classification_Code.rds")

## Get data only from Baltimore City (fips == "24510")
BaltimoreData <- subset(NEI, NEI$fips == "24510")

## aggregate PM2.5 emissions based on year
BaltimoreTotalByYearByType <- aggregate(Emissions ~ year+type, data = BaltimoreData, sum)

## plot the data with line chart and annotate the plot
ggplot(BaltimoreTotalByYearByType, aes(x=year, y=Emissions, color=type)) + 
                geom_line() +
                ggtitle("Total PM2.5 Emissions By type in Baltimore City, MD, Between 1999 and 2008") +
                labs(x="Year", y="Total PM2.5 Emissions (tons)")
            
## explicitly close the graphic device using dev.off()
dev.off()
