filename <- 'household_power_consumption.txt'
library(data.table)
dt <- read.csv(filename, na.strings='?',sep=';')
dt$datetime <- strptime(paste(dt$Date, dt$Time), '%d/%m/%Y %H:%M:%S')
dt2days <- subset(dt, as.Date(datetime) >= as.Date('2007-02-01') & as.Date(datetime) <= as.Date('2007-02-02'))
par(mfrow=c(2,2))
par(bg='white')
with(dt2days, 
    {
    plot(datetime, Global_active_power,type='l',xlab='',ylab='Global Active Power');
    plot(datetime, Voltage,type='l');
    plot(datetime, Sub_metering_1,type='l',xlab='',ylab='Energy sub metering',col='black');
    points(datetime, Sub_metering_2,type='l',col='red');
    points(datetime, Sub_metering_3,type='l',col='blue');
    legend(bty='n',lwd=1,"topright",legend=c('Sub_metering_1 ','Sub_metering_2 ','Sub_metering_3 '),col=c('black','red','blue'));
    plot(datetime, Global_reactive_power,type='l');
    }
)
dev.copy(png,file='plot4.png',w=480,h=480)
dev.off() # file device
