#Exploratory Data Analysis Week 1
# Plot 1

#Setting working directory, reading, naming and subsetting power consumption data
setwd("~/Desktop/PhD/20202021 Coursework/2021/Fall/Hopkings coursera course/Exploratory Data Analysis/R repository")
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot1_data <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))
plot1_data$Date <- as.Date(plot1_data$Date, optional = F, format="%d/%m/%Y")

#Calling the basic plot function
hist(plot1_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Copying plot to PNG file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
