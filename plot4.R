data <- read.delim('household_power_consumption.txt', sep=';', na.string='?', stringsAsFactors=FALSE)
data$DateTime <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
sub_data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

par(mfrow=c(2,2))

# graph 1

plot(sub_data$DateTime, sub_data$Global_active_power, xlab='', ylab='Global Active Power', type='n')
lines(sub_data$DateTime, sub_data$Global_active_power)

# graph 2

plot(sub_data$DateTime, sub_data$Voltage, xlab='datetime', ylab='Voltage', type='n')
lines(sub_data$DateTime, sub_data$Voltage)

# graph 3

plot(sub_data$DateTime, sub_data$Sub_metering_1, xlab='', ylab='Energy sub meetering', type='n')
lines(sub_data$DateTime, sub_data$Sub_metering_1)
lines(sub_data$DateTime, sub_data$Sub_metering_2, col='red')
lines(sub_data$DateTime, sub_data$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black','red','blue'), bty='n')

# graph 4

plot(sub_data$DateTime, sub_data$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='n')
lines(sub_data$DateTime, sub_data$Global_reactive_power)

png('plot4.png', width=480, height=480)
plot(sub_data$DateTime, sub_data$Global_active_power, xlab='', ylab='Global Active Power', type='n')
lines(sub_data$DateTime, sub_data$Global_active_power)
plot(sub_data$DateTime, sub_data$Voltage, xlab='datetime', ylab='Voltage', type='n')
lines(sub_data$DateTime, sub_data$Voltage)
plot(sub_data$DateTime, sub_data$Sub_metering_1, xlab='', ylab='Energy sub meetering', type='n')
lines(sub_data$DateTime, sub_data$Sub_metering_1)
lines(sub_data$DateTime, sub_data$Sub_metering_2, col='red')
lines(sub_data$DateTime, sub_data$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black','red','blue'), bty='n')
plot(sub_data$DateTime, sub_data$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='n')
lines(sub_data$DateTime, sub_data$Global_reactive_power)
dev.off()