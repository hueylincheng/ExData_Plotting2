##
## Exploratory Data Analysis - assignment 2
##     plot6.R
## 


## Load required library
library(ggplot2)

## Launch grephic device - plot6.png
png(filename = "plot6.png", width = 540, height = 480)

## Read the data from rds file into data frame
NEI <- readRDS("ExploratoryData/summarySCC_PM25.rds")
SCC <- readRDS("ExploratoryData/Source_Classification_Code.rds")

## Extract only Baltimore and Los Angeles vehicle Data
motorBWILAXData <- subset(NEI, (NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD")

## aggregate PM2.5 emissions based on year
motorDataByYearByCity <- aggregate(Emissions ~ year+fips, data = motorBWILAXData, sum)

## modify the facet by converting fips to the city name
fips2city <- function(var, value) {
   value <- as.character(value)
   if (var=="fips") {
       value[value=="24510"] <- "Baltimore City"
       value[value=="06037"] <- "Los Angeles County"
   }
   return(value)
}

## plot the data with bar chart and annotate the plot
ggplot(motorDataByYearByCity, aes(x=factor(year), y=Emissions)) + 
  geom_bar(stat="identity", fill="blue") +
  facet_grid(fips~., labeller=fips2city) +
  ggtitle("Annual PM2.5 Emissions From Motor Source in Baltimore and Los Angeles\n From 1999 To 2008") +
  labs(x="Year", y="Total PM2.5 Emissions (tons)") 

## explicitly close the graphic device using dev.off()
dev.off()
