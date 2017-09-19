## Read table
setwd("~/R/Assignment4")
household <- read.csv(file="household_power_consumption.txt",sep=";",na.strings="?")
house_subset<-subset(household, household$Date=="2/2/2007"|household$Date=="1/2/2007")

## Open file
png(file = "plot1.png", width=480, height=480)

## Produce graph
hist(house_subset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

## Close file
dev.off()