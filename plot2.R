# run the file
power_consumption <- read.table("./household_power_consumption.txt",header = TRUE,stringsAsFactors=FALSE,sep=";")
sub_power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

# remove the total data set to clean some memory
rm("power_consumption")

# convert the date time using strptime 
datetime <- strptime(paste(sub_power_consumption$Date, sub_power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# plot of Global_active_power into png
png("plot2.png", width=800, height=800)
plot(datetime,as.numeric(sub_power_consumption$Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()