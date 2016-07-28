# Please ensure the file household_power_consumption.txt is in your working directory
power_consumption <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";")
power_consumption <- power_consumption[(power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007" ), ]
# convert the date and time variables to the DateTime Class  
date_time <- paste(power_consumption$Date,power_consumption$Time)
date_time <- strptime(date_time,"%d/%m/%Y %H:%M:%S")
# we will need 2 rows and 2 columns for plotting
par(mfrow=c(2,2))
# Plot 1
plot(date_time,power_consumption$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
# Plot 2
plot(date_time,power_consumption$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
# Plot 3
plot(date_time,power_consumption$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(date_time,power_consumption$Sub_metering_2,col = "red")
lines(date_time,power_consumption$Sub_metering_3,col = "blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty = "n")
# Plot 4
plot(date_time,power_consumption$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
# Copy to a png file
dev.copy(png,file="plot4.png",width = 480,height = 480)
dev.off()