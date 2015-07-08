# Title : This is the second Plots of Course Project 1.
## Read data from local file loacted in the Work Directory folder 
## 
data <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",colClasses=c("character", "character", rep("numeric",7)))

## subset data based on requested dates ("01/02/2007" and "02/02/2007")
subdata <- subset(data, as.Date(Date,'%d/%m/%Y') == as.Date("01/02/2007",'%d/%m/%Y') | as.Date(Date,'%d/%m/%Y') == as.Date("02/02/2007",'%d/%m/%Y'))

## combin Date and Time into a new field named 'DateTime'
subdata$DateTime <- paste(subdata$Date, subdata$Time)

## Convert DateTime from Character to Date/Time Class
subdata$DateTime <- as.POSIXlt(subdata$DateTime,format="%d/%m/%Y %H:%M:%S")

## Start of Plot2
## Start by opening device file with width and height of 480
png("plot2.png", width = 480, height = 480) 

## Execute plotting with all labels
plot(x=(subdata$DateTime),y=subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## close device
dev.off()