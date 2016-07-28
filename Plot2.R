# Please ensure the file household_power_consumption.txt is in your working directory
power_consumption <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";")
power_consumption <- power_consumption[(power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007" ), ]
# convert the date and time variables to the DateTime Class  
date_time <- paste(power_consumption$Date,power_consumption$Time)
date_time <- strptime(date_time,"%d/%m/%Y %H:%M:%S")
# plot the Global Active Power
plot(date_time,power_consumption$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")
dev.copy(png,file="plot2.png",width = 480,height = 480)
dev.off()