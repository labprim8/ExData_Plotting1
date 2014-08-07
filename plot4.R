## read in file
power <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
## create a new column to hold the correct date time
power$dateTime <- strptime(paste(power$dateTime), format="%d/%m/%Y %H:%M:%S")
##subset the data to show only 01/02/2007 and 02/02/2007
subset <- subset(power, power$dateTime < "2007-02-03" & power$dateTime >= "2007-02-01" )

## create the destination device
png(file="plot4.png")

## set the plot area to a 2x2 grid and reduce the text size to 85% of default
par(mfrow=c(2,2), cex=0.85)

## create plot1 in the top left
plot(subset$dateTime, subset$Global_active_power, type = "n", ylab="Global Active Power", xlab="")
lines(subset$dateTime, subset$Global_active_power)

## create plot2 in the top right
plot(subset$dateTime, subset$Voltage, type = "n", ylab="Voltage", xlab="datetime")
lines(subset$dateTime, subset$Voltage)

## create plot3 in the bottom left
plot(subset$dateTime, subset$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
lines(subset$dateTime, subset$Sub_metering_1)
lines(subset$dateTime, subset$Sub_metering_2, col="red")
lines(subset$dateTime, subset$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), bty="n")

## create plot4 in the bottom right
plot(subset$dateTime, subset$Global_reactive_power, type = "n", ylab="Global_reactive_power", xlab="datetime")
lines(subset$dateTime, subset$Global_reactive_power)

dev.off()