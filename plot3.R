data <- read.table('../PA1/household_power_consumption.txt', sep=';', header = TRUE, stringsAsFactors = FALSE)
data$Date2 <- as.Date(data$Date, '%d/%m/%Y')
data <- data[(data$Date2>='2007-02-01') & (data$Date2 <= '2007-02-02'),]
time_feature = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png(file='plot3.png')
par(mfrow = c(1,1))

with(data, plot(time_feature, Sub_metering_1, main=NULL, type = 'l', col='black', xlab='', ylab='Energy sub metering'))
#par(new = TRUE)
with(data, points(time_feature, Sub_metering_2, main=NULL, type = 'l', col='red'))
#par(new = TRUE)
with(data, points(time_feature, Sub_metering_3, main=NULL, type = 'l', col='blue'))
#title(main='Global Active Power')
legend('topright', col=c('black', 'red', 'blue'), lty=1, legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))


dev.off()


