## Read table
setwd("~/R/Assignment4")
household <- read.csv(file="household_power_consumption.txt",sep=";",na.strings="?")
house_subset<-subset(household, household$Date=="2/2/2007"|household$Date=="1/2/2007")
SetTime <-strptime(paste(house_subset$Date, house_subset$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
house_subset<-cbind(house_subset,SetTime)

## Open file
png(file = "plot2.png", width=480, height=480)

## Produce graph
with(house_subset,plot(SetTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

## Close file
dev.off()