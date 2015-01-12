data <- read.table('../PA1/household_power_consumption.txt', sep=';', header = TRUE, stringsAsFactors = FALSE)
data$Date2 <- as.Date(data$Date, '%d/%m/%Y')
data <- data[(data$Date2>='2007-02-01') & (data$Date2 <= '2007-02-02'),]
time_feature = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png(file='plot2.png')
par(mfrow = c(1,1))
with(data, plot(time_feature, as.numeric(Global_active_power), main=NULL, type = 'l', xlab='', ylab='Global Active Power (kilowatts)'))
#title(main='Global Active Power')
dev.off()

