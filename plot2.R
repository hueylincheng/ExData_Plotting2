##
## Exploratory Data Analysis - assignment 2
##     plot2.R
## 


## Launch grephic device - plot2.png
png(filename = "plot2.png", width = 480, height = 480)

## Read the data from rds file into data frame
NEI <- readRDS("ExploratoryData/summarySCC_PM25.rds")
SCC <- readRDS("ExploratoryData/Source_Classification_Code.rds")

## Get data only from Baltimore City (fips == "24510")
BaltimoreData <- subset(NEI, NEI$fips == "24510")
## aggregate PM2.5 emissions based on year
BaltimoreTotalByYear <- aggregate(Emissions ~ year, data = BaltimoreData, sum)

## plot the data with bar chart and annotate the plot
barplot(BaltimoreTotalByYear$Emissions, names.arg = BaltimoreTotalByYear$year, col = "blue", main = "Total PM2.5 Emissions in Baltimore City, MD Per Year", xlab = "Year", ylab = "Total PM2.5 Emissions (tons)")

## explicitly close the graphic device using dev.off()
dev.off()
