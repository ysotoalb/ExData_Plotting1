#Exploratory Data Analysis Week 1
# Plot 2

#Loading packages, setting working directory, reading in data into a dataframe
library("data.table")
setwd("~/Desktop/PhD/20202021 Coursework/2021/Fall/Hopkings coursera course/Exploratory Data Analysis/R repository")
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
all_data_df <- data.table::fread(input = "household_power_consumption.txt"
                                 , na.strings="?"
)
#Naming and subsetting power consumption data
plot3_data <- subset(all_data_df, Date %in% c("1/2/2007","2/2/2007"))

# Making a POSIXct date capable of being graphed by time of day
plot3_data$Date <- as.Date(plot3_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot3_data$Date), plot3_data$Time)
plot3_data$Datetime <- as.POSIXct(datetime)

# Creating Plot 3
plot(plot3_data$Datetime, plot3_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plot3_data$Datetime, plot3_data$Sub_metering_2,col="red")
lines(plot3_data$Datetime, plot3_data$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

#Copying plot to PNG file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()


