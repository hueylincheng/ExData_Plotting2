##
## Exploratory Data Analysis - assignment 2
##     plot1.R
## 

## Launch grephic device - plot1.png
png(filename = "plot1.png", width = 480, height = 480)

## Read the data from rds file into data frame
NEI <- readRDS("ExploratoryData/summarySCC_PM25.rds")
SCC <- readRDS("ExploratoryData/Source_Classification_Code.rds")

## aggregate PM2.5 emissions based on year
totalByYear <- aggregate(Emissions ~ year, data = NEI, sum)

## plot the data with bar chart and annotate the plot
barplot(totalByYear$Emissions, names.arg = totalByYear$year, col = "blue", main = "Total Emissions From PM2.5 Per Year", xlab = "Year", ylab = "Total PM2.5 Emissions (tons)")

## explicitly close the graphic device using dev.off()
dev.off()
