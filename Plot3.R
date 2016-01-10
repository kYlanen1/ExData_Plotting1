## Plot 3

## Set language to English
Sys.setlocale("LC_TIME","English")

setwd("C:/Coursera/Exploratory Data Analysis/Project1")

## stringsAsFactors = FALSE tells R to keep character variables as they are rather than convert to factors
dt<-read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)

## Trtansform character ? to NA
dt[dt=="?"] = NA

## Converts column 'Date' in the data source to a R date format  
dt<-within(dt, DateConverted <- as.Date(dt$Date, format="%d/%m/%Y"))

## Data frame dt_subset only includes rows with DateConverted=2007-02-01 or DateConverted=2007-02-02
dt_subset<-subset(dt, DateConverted=="2007-02-01" | DateConverted=="2007-02-02")

## Get the values for the 'x-axes'
datetime <- strptime(paste(dt_subset$Date, dt_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Get data for the 3 sub meterings
Sub_metering_1<-as.numeric(dt_subset$Sub_metering_1)
Sub_metering_2<-as.numeric(dt_subset$Sub_metering_2)
Sub_metering_3<-as.numeric(dt_subset$Sub_metering_3)

## Opens the PNG graphic device, plots submetering 1,2 and 3 as scatterplots and closes the graphic device
## Note that Sub_metering_1 is using function plot and Sub_metering_2 and Sub_metering_3 are annotations (lines) to the plot
png("plot3.png", width=480, height=480) 
plot(datetime, Sub_metering_1, type = "l", xlab="",  ylab="Energy sub metering")
lines(datetime, Sub_metering_2, type = "l", col="red")
lines(datetime, Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()