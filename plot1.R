## load data
rawdata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)

## convert rawdata$Date character to Date
rawdata$Date = as.Date(rawdata$Date, format="%d/%m/%Y")

## filter data by date
data<-rawdata[(rawdata$Date>="2007-02-01" & rawdata$Date<="2007-02-02"),]

## convert Global_active_power to numeric
data$Global_active_power = as.numeric(data$Global_active_power)

## plot hist
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active power (kilowatts)")

## copy to png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()