library("sqldf")
library("tcltk")
library(lubridate)

edata <- read.csv.sql("household_power_consumption.txt", sep=";", sql = "select * from file where Date in ('1/2/2007' , '2/2/2007')", colClasses = rep("character", 9))
# read file and load only the required date range
edata[,3:9] <- lapply(edata[,3:9], as.numeric) # convert columns 3 to 9 to numeric values

edata$date_time = dmy_hms(paste(edata$Date, edata$Time)) # combine date and time

png(file = "plot3.png", width = 480, height = 480, units = "px")
with(edata, plot(Sub_metering_1 ~ date_time, data = edata, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
	with(subset(edata), lines(Sub_metering_2 ~ date_time, data = edata, type = "l", col = "red"))
	with(subset(edata), lines(Sub_metering_3 ~ date_time, data = edata, type = "l", col = "blue"))
	legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()