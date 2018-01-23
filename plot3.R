#Your working directory needs to contain the file 'household_power_consumption.txt' to work
data <- read.csv("household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data$datetime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.POSIXct(strptime(data$Date, "%d/%m/%Y"))
data <- subset(data,(data$Date >= (as.POSIXct(as.Date("2007-02-01"))))
               & (data$Date <= (as.POSIXct(as.Date("2007-02-02")))))


with(data,plot(datetime,Sub_metering_1, type ="l",xlab = "", ylab = "Energy Sub Metering"))
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,lwd =2,col=c("black","red","blue"))
dev.copy(png,"plot3.png")
dev.off()
