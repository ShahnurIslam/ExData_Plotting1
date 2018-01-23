#Your working directory needs to contain the file 'household_power_consumption.txt' to work
data <- read.csv("household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data$datetime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.POSIXct(strptime(data$Date, "%d/%m/%Y"))
data <- subset(data,(data$Date >= (as.POSIXct(as.Date("2007-02-01"))))
               & (data$Date <= (as.POSIXct(as.Date("2007-02-02")))))
with(data,hist(Global_active_power, 
               col = "red",
               xlab = "Global Active Power(kilowatts)",
               main = "Global Active Power"))
dev.copy(png,"plot1.png")
dev.off()     
