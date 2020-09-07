setwd("C:/Users/anton/Desktop")

data <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=2075259, check.names=F)
databind <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])

databind$Date <- as.Date(databind$Date,"%d/%m/%Y")
databind<-cbind(databind, "DateTime" = as.POSIXct(paste(databind$Date, databind$Time)))

hist(as.numeric(databind$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")
