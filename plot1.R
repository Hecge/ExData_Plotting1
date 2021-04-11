#Loading the library
library(chron)

#Loading the data frame
df <- read.table('household_power_consumption.txt', header = FALSE, skip = 66637, nrows = 2880, sep = ";", na.strings = "?",col.names = read.table('household_power_consumption.txt', header = FALSE, nrows = 1, sep = ";"))
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- chron(times = df$Time)

#Ploting and saving
png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()