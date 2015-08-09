#Simply place the data in the working directory and run. PNG's will save there.
#read in data for the time period we are concerned with 1/2/2007 - 2/2/2007
data <- "household_power_consumption.txt"
readdata <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
febDates <- readdata[readdata$Date %in% c("1/2/2007","2/2/2007") , ]

#format the dates to read as dates in the correct format
formatDates <- strptime(paste(febDates$Date, febDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# read in global active power as numeric
gAP <- as.numeric(febDates$Global_active_power)
#create plot to correct dimensions and save as PNG in working directory
png("plot2.png", width=480, height=480)
#create plot with line type and the associated labels
plot(formatDates, gAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
