## set mfrow
par(mfrow = c(2, 2))

## load data
rawdata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)

## convert rawdata$Date character to Date
rawdata$Date = as.Date(rawdata$Date, format="%d/%m/%Y")

## filter data by date
data<-rawdata[(rawdata$Date>="2007-02-01" & rawdata$Date<="2007-02-02"),]

## merge date and time
data$dt = paste(data$Date, data$Time)
data$dt = strptime(data$dt, format="%F %T")

## plot Global_active_power - date time line
data$Global_active_power = as.numeric(data$Global_active_power)
plot(data$dt, data$Global_active_power, type="l", xlab="", ylab="Global Active power")

## plot Voltage - date time line
data$Voltage = as.numeric(data$Voltage)
plot(data$dt, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

## plot Sub_metering_1~3 - date time line
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)
plot(data$dt, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
points(data$dt, data$Sub_metering_2,col='red', type="l")
points(data$dt, data$Sub_metering_3,col='blue', type="l")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot Global_reactive_power - date time line
data$Global_reactive_power = as.numeric(data$Global_reactive_power)
plot(data$dt, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## copy to png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()