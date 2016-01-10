
## Plot 2

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

datetime <- strptime(paste(dt_subset$Date, dt_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(dt_subset$Global_active_power)

## Opens the PNG graphic device, plots GAP in a scatterplot and closes the graphic device
png("plot2.png", width=480, height=480) 
plot(datetime, GAP, type = "l", xlab="",  ylab="Global Active Power (kilowatts)")
dev.off()