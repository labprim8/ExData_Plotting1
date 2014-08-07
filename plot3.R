## read in file
power <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
## create a new column to hold the correct date time
power$dateTime <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
##subset the data to show only 01/02/2007 and 02/02/2007
subset <- subset(power, power$dateTime < "2007-02-03" & power$dateTime >= "2007-02-01" )

## create the destination device
png(file="plot3.png")

## create the empty plot
plot(subset$dateTime, subset$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")

## plot the 3 series data using a different color of each
lines(subset$dateTime, subset$Sub_metering_1)
lines(subset$dateTime, subset$Sub_metering_2, col="red")
lines(subset$dateTime, subset$Sub_metering_3, col="blue")

## add the legend to the top right
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

dev.off()