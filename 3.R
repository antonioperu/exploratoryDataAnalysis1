setwd("C:/Users/anton/Desktop")

data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=2075259, check.names=F)
databind <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])

databind$Date <- as.Date(databind$Date,"%d/%m/%Y")
databind<-cbind(databind, "DateTime" = as.POSIXct(paste(databind$Date, databind$Time)))

with(databind, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})

lines(databind$Sub_metering_2 ~ databind$DateTime, col = 'Red')
lines(databind$Sub_metering_3 ~ databind$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

