# run the file
power_consumption <- read.table("./household_power_consumption.txt",header = TRUE,stringsAsFactors=FALSE,sep=";")
sub_power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

# remove the total data set to clean some memory
rm("power_consumption")

# histogram plot of Global_active_power into png
png("plot1.png", width=800, height=800)
hist(as.numeric(sub_power_consumption$Global_active_power),col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()