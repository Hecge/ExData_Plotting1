#Loading the library
library(chron)

#Loading the data frame
df <- read.table('household_power_consumption.txt', header = FALSE, skip = 66637, nrows = 2880, sep = ";", na.strings = "?",col.names = read.table('household_power_consumption.txt', header = FALSE, nrows = 1, sep = ";"))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- chron(times = df$Time)

#Ploting and saving
png("plot4.png", width = 480, height = 480)

datetime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2))

#Subplot 1
plot(datetime, df$Global_active_power, type = 'l', lty = 1, ylab = "Global Active Power", xlab = "")
#Subplot 2
plot(datetime, df$Voltage, type = 'l', lty = 1, ylab = "Voltage", xlab = "datetime")
#Subplot 3
plot(datetime, df$Sub_metering_1, type = 'l', lty = 1, ylab = "Energy sub metering", xlab = "")
lines(datetime, df$Sub_metering_2, type = 'l', lty = 1, col = "red")
lines(datetime, df$Sub_metering_3, type = 'l', lty = 1, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, cex=0.8)
#Subplot 4
plot(datetime, df$Global_reactive_power, type = 'l', lty = 1, ylab = "Global_reactive_power", xlab = "datetime")

dev.off()