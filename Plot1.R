## R memory consumption:
## 2,075,259 rows * 9 columns * 8 bytes/column = 149418648 bytes
##                                             = 149418648 bytes/2^20 bytes/MB
##                                             = 142 MB

## The package pryr needs to be installed to execute the function object_size


## Plot 1

library(pryr)

setwd("C:/Coursera/Exploratory Data Analysis/Project1")

## stringsAsFactors = FALSE tells R to keep character variables as they are rather than convert to factors
dt<-read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)

## Get size of object dt. Can be compared to calculation at the top of this script
object_size(dt)

## Trtansform character ? to NA
dt[dt=="?"] = NA

## Converts column 'Date' in the data source to a R date format  
dt<-within(dt, DateConverted <- as.Date(dt$Date, format="%d/%m/%Y"))

## Data frame dt_subset only includes rows with DateConverted=2007-02-01 or DateConverted=2007-02-02
dt_subset<-subset(dt, DateConverted=="2007-02-01" | DateConverted=="2007-02-02")

str(dt_subset)

## Extract column Global_active_power from dt_subset as a numeric
GAP<-as.numeric(dt_subset$Global_active_power)

## Opens the PNG graphic device, plots GAP in a histogram and closes the graphic device
png("plot1.png", width=480, height=480) 
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
