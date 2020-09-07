setwd("C:/Users/anton/Desktop")

data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=2075259, check.names=F)
databind <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])

databind$Date <- as.Date(databind$Date,"%d/%m/%Y")
databind<-cbind(databind, "DateTime" = as.POSIXct(paste(databind$Date, databind$Time)))

par(mfrow=c(2,2))
plot(databind$Global_active_power ~ databind$DateTime, type="l")
plot(databind$Voltage ~ databind$DateTime, type="l")

with(databind, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(databind$Sub_metering_2 ~ databind$DateTime, col = 'Red')
lines(databind$Sub_metering_3 ~ databind$DateTime, col = 'Blue')

plot(databind$Global_reactive_power ~ databind$DateTime, type="l")
