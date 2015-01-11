#plot2.R

# This file does the following
# 1. download data from UCI Machine Learning Repository
# 2. read the data into R
# 3. plot the data

#Step 1: Download Data & Unzip File
setwd("~/Exploratory Data Analysis")
file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
file.dest <- 'power.consumption.zip'
download.file( file.url, file.dest )
source.file <- unzip( file.dest, list = TRUE )$Name
unzip( file.dest )

#Step 2: Read Data into R and Subset Data
Power.Consumption <- read.table( source.file, header = TRUE, sep = ";", na.strings = "?" )
Power.Consumption <- Power.Consumption[Power.Consumption$Date %in% c("1/2/2007","2/2/2007") ,] 
datetime <- strptime(paste(Power.Consumption$Date, Power.Consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Step 3: Plot the Data
globalActivePower <- as.numeric(Power.Consumption$Global_active_power)
png( "plot2.png",  width=480, height=480 )
plot(datetime, Power.Consumption$Global_active_power,
      type = "l", 
      xlab = "", 
      ylab = "Global Active Power (kilowatts)")
dev.off()
