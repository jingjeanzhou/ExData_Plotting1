data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep=";")
names(data) <- sapply(read.table("household_power_consumption.txt", sep = ";", nrow = 1), as.character)
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
png('plot4.png')
par(mfcol = c(2,2))
with(data, {plot(DateTime, Global_active_power, type = "l", xlab = "daytime", ylab = "Global Active Power" )
            with(data, points(DateTime, Global_active_power, type = "l"))
            
            plot(DateTime, Sub_metering_1, type = "l", xlab = "daytime", ylab = "Energy sub metering" )
            with(data, points(DateTime, Sub_metering_2, type = "l", col = "red"))
            with(data, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
            legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty= "n")          
            
            plot(DateTime, Voltage, type = "l", xlab = "daytime", ylab = "Voltage (volts)")
            
            plot(DateTime, Global_reactive_power, type = "l", xlab = "daytime", ylab = "Global Reactive Power" )
})
dev.off()