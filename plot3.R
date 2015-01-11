#plot3.R

# This file does the following
# 1. download data from UCI Machine Learning Repository
# 2. read the data into R
# 3. Subset Metereing Variables
# 4. plot the data

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

#Step 3: Subset Metering Variables
globalActivePower <- as.numeric(Power.Consumption$Global_active_power)
subMetering1 <- as.numeric(Power.Consumption$Sub_metering_1)
subMetering2 <- as.numeric(Power.Consumption$Sub_metering_2)
subMetering3 <- as.numeric(Power.Consumption$Sub_metering_3)

#Step 4: Plot the Data

png( "plot3.png",  width=480, height=480 )
plot(datetime,
     subMetering1,
     type = "l",
     xlab = "",
     ylab = "Energy Submetering"
)
lines(datetime,
      subMetering2,
      type = "l",
      col = "red"
)
lines(datetime,
      subMetering3,
      type = "l",
      col = "blue"
)

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       lwd=2.5, 
       col=c("black", "red", "blue"))
dev.off()
