#Exploratory Data Analysis Week 1
# Plot 4

#Loading packages, setting working directory, reading in data into a dataframe
library("data.table")
setwd("~/Desktop/PhD/20202021 Coursework/2021/Fall/Hopkings coursera course/Exploratory Data Analysis/R repository")
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
all_data_df <- data.table::fread(input = "household_power_consumption.txt"
                                 , na.strings="?"
)
#Naming and subsetting power consumption data
plot4_data <- subset(all_data_df, Date %in% c("1/2/2007","2/2/2007"))

# Making a POSIXct date capable of being graphed by time of day
plot4_data$Date <- as.Date(plot4_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot4_data$Date), plot4_data$Time)
plot4_data$Datetime <- as.POSIXct(datetime)

# Creating Master Plot 4
par(mfrow=c(2,2))

# Plot 4.1
plot(x = plot4_data$Datetime
     , y = plot4_data$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Plot 2
plot(plot4_data$Datetime, plot4_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(plot4_data$Datetime, plot4_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plot4_data$Datetime, plot4_data$Sub_metering_2,col="red")
lines(plot4_data$Datetime, plot4_data$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

# Plot 4
plot(x = plot4_data$Datetime
     , y = plot4_data$Global_reactive_power
     , type="l", xlab="datetime", ylab="global_reactive_power (kilowatts)")

#Copying plot to PNG file
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
