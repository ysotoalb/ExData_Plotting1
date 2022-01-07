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
plot2_data <- subset(all_data_df, Date %in% c("1/2/2007","2/2/2007"))

# Making a POSIXct date capable of being graphed by time of day
plot2_data$Date <- as.Date(plot2_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot2_data$Date), plot2_data$Time)
plot2_data$Datetime <- as.POSIXct(datetime)

#Creating Plot 2
plot(x = plot2_data$Datetime
     , y = plot2_data$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Copying plot to PNG file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

