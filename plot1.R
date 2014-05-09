filename <- 'household_power_consumption.txt'
library(data.table)
dt <- read.csv(filename, na.strings='?',sep=';')
dt$datetime <- strptime(paste(dt$Date, dt$Time), '%d/%m/%Y %H:%M:%S')
dt2days <- subset(dt, as.Date(datetime) >= as.Date('2007-02-01') & as.Date(datetime) <= as.Date('2007-02-02'))
par(bg='white')
with(dt2days, 
{
    hist(Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)', border='white')
}
)
dev.copy(png,file='plot1.png',w=480,h=480)
dev.off() # file device
