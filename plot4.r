## Read table
setwd("~/R/Assignment4")
household <- read.csv(file="household_power_consumption.txt",sep=";",na.strings="?")
house_subset<-subset(household, household$Date=="2/2/2007"|household$Date=="1/2/2007")
SetTime <-strptime(paste(house_subset$Date, house_subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
house_subset<-cbind(house_subset,SetTime)

## Open file
png(file = "plot4.png", width=480, height=480)

## Produce graph
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(house_subset$SetTime, house_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(house_subset$SetTime, house_subset$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(house_subset$SetTime, house_subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(house_subset$SetTime, house_subset$Sub_metering_2, type="l", col="red")
lines(house_subset$SetTime, house_subset$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(house_subset$SetTime, house_subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Close file
dev.off()