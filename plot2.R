#Loading the library
library(chron)

#Loading the data frame
df <- read.table('household_power_consumption.txt', header = FALSE, skip = 66637, nrows = 2880, sep = ";", na.strings = "?",col.names = read.table('household_power_consumption.txt', header = FALSE, nrows = 1, sep = ";"))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- chron(times = df$Time)

#Ploting and saving
png("plot2.png", width = 480, height = 480)
datetime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
plot(datetime, df$Global_active_power, type = 'l', lty = 1, ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()