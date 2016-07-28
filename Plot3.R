# Please ensure the file household_power_consumption.txt is in your working directory
# The zip file can be downloaded here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
power_consumption <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";")
power_consumption <- power_consumption[(power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007" ), ]
# convert the date and time variables to the DateTime Class  
date_time <- paste(power_consumption$Date,power_consumption$Time)
date_time <- strptime(date_time,"%d/%m/%Y %H:%M:%S")
# Plot the 3 submeter readings on one plot witht he appropriate legend
plot(date_time,power_consumption$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(date_time,power_consumption$Sub_metering_2,col = "red")
lines(date_time,power_consumption$Sub_metering_3,col = "blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.copy(png,file="plot3.png",width = 480,height = 480)
dev.off()
