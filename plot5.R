##
## Exploratory Data Analysis - assignment 2
##     plot5.R
## 


## Load required library
library(ggplot2)

## Launch grephic device - plot5.png
png(filename = "plot5.png", width = 480, height = 480)

## Read the data from rds file into data frame
NEI <- readRDS("ExploratoryData/summarySCC_PM25.rds")
SCC <- readRDS("ExploratoryData/Source_Classification_Code.rds")

## Extract only Baltimore Vehicle Data
## Exam the data in NEI and SCC, The Vehicle data corresponding to all the observations with type = 'ON-ROAD'
motorBaltimoreData <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")

## aggregate PM2.5 emissions based on year
motorDataByYear <- aggregate(Emissions ~ year, data = motorBaltimoreData, sum)

## plot the data with line chart and annotate the plot
## barplot(motorDataByYear$Emissions, names.arg = motorDataByYear$year, col = "blue", main = "Total Coal Related PM2.5 Emission Per Year", xlab = "Year", ylab = "Total PM2.5 Emissions (tons)")
ggplot(motorDataByYear, aes(factor(year), y=Emissions)) +
  geom_bar(stat="identity", fill="blue") +
  labs(x="Year", y="Total PM2.5 Emissions (tons)", title="Annual Motor Related PM2.5 Emission in Baltimore City, MD\n From 1999 To 2008")

## explicitly close the graphic device using dev.off()
dev.off()
