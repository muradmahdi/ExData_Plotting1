# Title : This is the first Plots of Course Project 1.
## Read data from local file loacted in the Work Directory folder 
## 
data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character", "character", rep("numeric",7)))

## subset data based on requested dates ("01/02/2007" and "02/02/2007")
subdata <- subset(data, as.Date(Date,'%d/%m/%Y') == as.Date("01/02/2007",'%d/%m/%Y') | as.Date(Date,'%d/%m/%Y') == as.Date("02/02/2007",'%d/%m/%Y'))

## combin Date and Time into a new field named 'DateTime'
subdata$DateTime <- paste(subdata$Date, subdata$Time)

## Convert DateTime from Character to Date/Time Class
subdata$DateTime <- as.POSIXlt(subdata$DateTime,format="%d/%m/%Y %H:%M:%S")

## Start of Plot1
## Start by opening device file with width and height of 480
png("plot1.png", width = 480, height = 480) 

## Execute plotting with all labels
hist(subdata$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red")

## close device
dev.off()