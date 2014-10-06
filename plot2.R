## load data
rawdata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)

## convert rawdata$Date character to Date
rawdata$Date = as.Date(rawdata$Date, format="%d/%m/%Y")

## filter data by date
data<-rawdata[(rawdata$Date>="2007-02-01" & rawdata$Date<="2007-02-02"),]

## merge date and time
data$dt = paste(data$Date, data$Time)
data$dt = strptime(data$dt, format="%F %T")

## convert Global_active_power to numeric
data$Global_active_power = as.numeric(data$Global_active_power)

## plot line
plot(data$dt, data$Global_active_power, type="l", xlab="", ylab="Global Active power (kilowatts)")

## copy to png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()