filename <- 'household_power_consumption.txt'
library(data.table)
dt <- read.csv(filename, na.strings='?',sep=';')
dt$datetime <- strptime(paste(dt$Date, dt$Time), '%d/%m/%Y %H:%M:%S')
dt2days <- subset(dt, as.Date(datetime) >= as.Date('2007-02-01') & as.Date(datetime) <= as.Date('2007-02-02'))
par(bg='white')
with(dt2days, 
{
    plot(datetime, Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
}
)
dev.copy(png,file='plot2.png',w=480,h=480)
dev.off() # file device
