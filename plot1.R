library("sqldf")
library("tcltk")

png(file = "plot1.png", width = 480, height = 480, units = "px") #Open PNG device; create 'plot1.png' in my working directory
# create plot 1 and send to PNG file
edata <- read.csv.sql("household_power_consumption.txt", sep=";", sql = "select * from file where Date in ('1/2/2007' , '2/2/2007')", colClasses = rep("character", 9))
# read file and load only the required date range. NOTE: original dataset had been downloaded and copied to the working directory
edata[,3:9] <- lapply(edata[,3:9], as.numeric) # convert columns 3 to 9 to numeric values
hist(edata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() # close PNG file device
