library("sqldf")
library("tcltk")
library(lubridate)

edata <- read.csv.sql("household_power_consumption.txt", sep=";", sql = "select * from file where Date in ('1/2/2007' , '2/2/2007')", colClasses = rep("character", 9))
# read file and load only the required date range
edata[,3:9] <- lapply(edata[,3:9], as.numeric) # convert columns 3 to 9 to numeric values

edata$date_time = dmy_hms(paste(edata$Date, edata$Time)) # combine date and time

png(file = "plot2.png", width = 480, height = 480, units = "px") # Open PNG device to create plot2.png
plot(Global_active_power ~ date_time, data = edata, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off() # close PNG file device