par(mar=c(5,4,4,4))
data=read.table(file="household_power_consumption.txt", header=T, sep=";") 


data$DateTime = as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

box = subset(data,Date== "1/2/2007" | Date=="2/2/2007")
plot(box$DateTime, as.double(as.character(box$Sub_metering_1)),type="n", ylab="Energy sub metering",xlab="")
lines(box$DateTime, as.double(as.character(box$Sub_metering_1)),col="black")
lines(box$DateTime, as.double(as.character(box$Sub_metering_2)),col="red")
lines(box$DateTime, as.double(as.character(box$Sub_metering_3)),col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.6)
#plot(as.double(as.character(power_dates$Global_active_power)),wday, type="l",main="Global Active Power", ylab="Global Active Power(kilowatts)",xlab="")
dev.copy(png,file="plot3.png")
png(filename="plot3.png", width=480, height=480, units="px")
dev.off