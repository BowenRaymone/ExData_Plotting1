# run the file
power_consumption <- read.table("./household_power_consumption.txt",header = TRUE,stringsAsFactors=FALSE,sep=";")
sub_power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

# remove the total data set to clean some memory
rm("power_consumption")

# convert the date time using strptime 
datetime <- strptime(paste(sub_power_consumption$Date, sub_power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# plot of Global_active_power into png
png("plot4.png", width=800, height=800)
par(mfrow = c(2, 2)) 
# plot Global_active_power
plot(datetime, as.numeric(sub_power_consumption$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)

# plot Voltage
plot(datetime, as.numeric(sub_power_consumption$Voltage), type="l", xlab="datetime", ylab="Voltage")

# plot energy
plot(datetime, as.numeric(sub_power_consumption$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(sub_power_consumption$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(sub_power_consumption$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# plot Global_reactive_power
plot(datetime, as.numeric(sub_power_consumption$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

