Power.Consumption <- read.table( source.file, header = TRUE, sep = ';', na.strings = '?' )
Power.Consumption <- Power.Consumption[Power.Consumption$Date %in% c("1/2/2007","2/2/2007") ,] 
#str(subSetData)
    
globalActivePower <- as.numeric(Power.Consumption$Global_active_power)
png( 'plot1.png',  width=480, height=480 )
hist( Power.Consumption$Global_active_power,
        +       col = "red",
        +       main = "Global Active Power",
        +       xlab = "Global Active Power (kilowatts)"
        + )
dev.off()

