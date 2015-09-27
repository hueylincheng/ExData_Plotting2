## Load required library
library(ggplot2)

## Launch grephic device - plot6.png
png(filename = "plot6.png", width = 600, height = 480)

## Read the data from rds file into data frame
NEI <- readRDS("ExploratoryData/summarySCC_PM25.rds")
SCC <- readRDS("ExploratoryData/Source_Classification_Code.rds")

## Extract only Baltimore and Los Angeles Data
BWILAXData <- subset(NEI, NEI$fips == "24510" | NEI$fips == "06037")

## Merge 2 data frame, NEI and SCC by SCC
mergedData <- merge(BWILAXData, SCC, by.x="SCC", by.y="SCC", all=FALSE)

## Extract only Motor related source
motorData <- subset(mergedData, grepl("motor", mergedData$Short.Name, ignore.case=TRUE))

## aggregate PM2.5 emissions based on year
motorDataByYearByCity <- aggregate(Emissions ~ year+fips, data = motorData, sum)

## plot the data with line chart and annotate the plot
ggplot(motorDataByYearByCity, aes(x=year, y=Emissions, color=fips)) + 
  geom_line() +
  ggtitle("Total PM2.5 Emissions From Motor Source in Baltimore and Los Angeles\n From 1999 To 2008") +
  labs(x="Year", y="Total PM2.5 Emissions (tons)") +
  scale_color_discrete("City", labels=c("Balitmore City", "Los Angeles County"), breaks=c("24510","06037"))

## explitcitly close the graphic device using dev.off()
dev.off()
