## load data
rawdata<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=F)

## convert rawdata$Date character to Date
rawdata$Date = as.Date(rawdata$Date, format="%d/%m/%Y")

## filter data by date
data<-rawdata[(rawdata$Date>="2007-02-01" & rawdata$Date<="2007-02-02"),]

## merge date and time
data$dt = paste(data$Date, data$Time)
data$dt = strptime(data$dt, format="%F %T")

## convert Sub_metering_1~3 to numeric
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

## plot Sub_metering_1 line
plot(data$dt, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")

## plot Sub_metering_2 line
points(data$dt, data$Sub_metering_2,col='red', type="l")

## plot Sub_metering_3 line
points(data$dt, data$Sub_metering_3,col='blue', type="l")

## add legned
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## copy to png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()