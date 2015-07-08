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

## Start of Plot3
## Start by opening device file with width and height of 480
png("plot3.png", width = 480, height = 480) 

## Execute plotting with all labels, use lines to add the other two measures and finally add legend
plot(x=(subdata$DateTime),y=subdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(x=(subdata$DateTime),y=subdata$Sub_metering_2,col="red")
lines(x=(subdata$DateTime),y=subdata$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2)

## close device
dev.off()