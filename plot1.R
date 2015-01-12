data <- read.table('household_power_consumption.txt', sep=';', header = TRUE)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data <- data[(data$Date>='2007-02-01') & (data$Date <= '2007-02-02'),]
png(file='plot1.png')
par(mfrow = c(1,1))
with(data, hist(as.numeric(Global_active_power), main='Global Active Power', col='red', xlab='Global Active Power (kilowatts)', ylab='Frequency'))
#title(main='Global Active Power')
dev.off()

