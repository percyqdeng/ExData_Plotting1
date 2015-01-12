data <- read.table('../PA1/household_power_consumption.txt', sep=';', header = TRUE, stringsAsFactors = FALSE)
data$Date2 <- as.Date(data$Date, '%d/%m/%Y')
data <- data[(data$Date2>='2007-02-01') & (data$Date2 <= '2007-02-02'),]
time_feature = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png(file='plot4.png')
par(mfrow = c(2,2))
with(data, plot(time_feature, as.numeric(Global_active_power), main=NULL, type = 'l', xlab='', ylab='Global Active Power (kilowatts)'))
with(data, plot(time_feature, as.numeric(Voltage), main=NULL, type = 'l', xlab='', ylab='Voltage'))

with(data, plot(time_feature, Sub_metering_1, main=NULL, type = 'l', col='black', xlab='', ylab='Energy sub metering'))
with(data, points(time_feature, Sub_metering_2, main=NULL, type = 'l', col='red'))
with(data, points(time_feature, Sub_metering_3, main=NULL, type = 'l', col='blue'))
legend('topright', col=c('black', 'red', 'blue'), lty=1, legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

with(data, plot(time_feature, Global_reactive_power, main=NULL, type = 'l', xlab='', ylab='Global_reactive_power'))
dev.off()


