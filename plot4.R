##
## Exploratory Data Analysis - assignment 2
##     plot4.R
## 


## Load required library
library(ggplot2)

## Launch grephic device - plot4.png
png(filename = "plot4.png", width = 720, height = 480)

## Read the data from rds file into data frame
NEI <- readRDS("ExploratoryData/summarySCC_PM25.rds")
SCC <- readRDS("ExploratoryData/Source_Classification_Code.rds")

## Merge 2 data frame, NEI and SCC by SCC
mergedData <- merge(NEI, SCC, by.x="SCC", by.y="SCC", all=FALSE)

## Extract only Coal related source
coalData <- subset(mergedData, grepl("coal", mergedData$Short.Name, ignore.case=TRUE))
  
## aggregate PM2.5 emissions based on year
coalDataByYear <- aggregate(Emissions ~ year, data = coalData, sum)

## plot the data with line chart and annotate the plot
## barplot(coalDataByYear$Emissions, names.arg = coalDataByYear$year, col = "blue", main = "Total Coal Related PM2.5 Emission Per Year", xlab = "Year", ylab = "Total PM2.5 Emissions (tons)")
ggplot(coalDataByYear, aes(factor(year), y=Emissions)) +
       geom_bar(stat="identity", fill="blue") +
       labs(x="Year", y="Total PM2.5 Emissions (tons)", title="Total Coal Related PM2.5 Emission Per Year")

## explicitly close the graphic device using dev.off()
dev.off()
