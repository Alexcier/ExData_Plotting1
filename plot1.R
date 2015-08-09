#Simply place the data in the working directory and run. PNG's will save there.
#read in data for the time period we are concerned with 1/2/2007 - 2/2/2007
data <- "household_power_consumption.txt"
readdata <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
febDates <- readdata[readdata$Date %in% c("1/2/2007","2/2/2007") , ]

# read in global active power as numeric
gAP <- as.numeric(febDates$Global_active_power)
#create plot to correct dimensions and save as PNG in working directory
png("plot1.png", width=480, height=480)
#create histogram
hist(gAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
