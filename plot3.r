## Read table
setwd("~/R/Assignment4")
household <- read.csv(file="household_power_consumption.txt",sep=";",na.strings="?")
house_subset<-subset(household, household$Date=="2/2/2007"|household$Date=="1/2/2007")
SetTime <-strptime(paste(house_subset$Date, house_subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
house_subset<-cbind(house_subset,SetTime)

## Open file
png(file = "plot3.png", width=480, height=480)

## Produce graph
with(house_subset,plot(SetTime,Sub_metering_1,type="l",xlab="",ylab="Global Active Power"))
with(house_subset,points(SetTime,Sub_metering_2,type="l",col="red"))
with(house_subset,points(SetTime,Sub_metering_3,type="l",col="blue"))
legend("topright", legend=c("Sub metering 1","Sub metering 2", "Sub metering 3"), col=c("black","red","blue"), lty="solid")

## Close file
dev.off()