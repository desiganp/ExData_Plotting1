# Please ensure the file household_power_consumption.txt is in your working directory
# The zip file can be downloaded here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
power_consumption <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";")
power_consumption <- power_consumption[(power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007" ), ]
# plot the histogram and save the result to png
hist(power_consumption$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.copy(png,file="plot1.png",width = 480,height = 480)
dev.off()
