## read in file
power <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
## create a new column to hold the correct date time
power$dateTime <- strptime(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
##subset the data to show only 01/02/2007 and 02/02/2007
subset <- subset(power, power$dateTime < "2007-02-03" & power$dateTime >= "2007-02-01" )

## create the destination device
png(file="plot1.png")

## plot the histogram to the device, setting the color to red as well as the labels and headers
hist(subset$Global_active_power, col = "red", main="Global Active Power", xlab= "Global Active Power (kilowatts)", ylab="Frequency")

dev.off()