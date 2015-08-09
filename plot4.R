#Simply place the data in the working directory and run. PNG's will save there.
#read in data for the time period we are concerned with 1/2/2007 - 2/2/2007
data <- "household_power_consumption.txt"
readdata <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
febDates <- readdata[readdata$Date %in% c("1/2/2007","2/2/2007") , ]

#format the dates to read as dates in the correct format
formatDate <- strptime(paste(febDates$Date, febDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# read in global active power, voltage and submetering values as numeric
gAP <- as.numeric(febDates$Global_active_power)
gRP <- as.numeric(febDates$Global_reactive_power)
volt <- as.numeric(febDates$Voltage)
SM1 <- as.numeric(febDates$Sub_metering_1)
SM2 <- as.numeric(febDates$Sub_metering_2)
SM3 <- as.numeric(febDates$Sub_metering_3)

#create plot to correct dimensions and save as PNG in working directory
#then specify that there will be 4 graphs, inserting them on a column basis
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2)) 

#Plot 1
#create plot with line type and the associated labels
plot(formatDate, gAP, type="l", xlab="", ylab="Global Active Power", cex=0.2, lwd = 1.5 )

#Plot 2
#create plot with line type and the associated labels, then add in the additional lines from 
#the other submetering values
#finally add the legend
plot(formatDate, SM1, type="l", ylab="Energy Submetering")
lines(formatDate, SM2, type="l", col="red")
lines(formatDate, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lwd=1, col=c("black", "red", "blue"), bty="n")

#Plot 3
#create a plot of type line with associate labels
plot(formatDate, volt, type="l", xlab="datetime", ylab="Voltage")

#Plot 4
#create a plot of type line with associate labels
plot(formatDate, gRP, type="l", xlab="datetime", ylab="Global_reactive_power", lwd = 0.8)

dev.off()

