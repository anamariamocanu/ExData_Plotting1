##define the data file to import
dataFile <- "household_power_consumption.txt"

##read the entire text file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subset only the data in between the required dates
subData <-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##set the global active power as numeric for the histogram to work
Global_Active <-as.numeric(subData$Global_active_power)

##Open PNG file device
png("plot1.png", width=480, height=480)

##create the histogram
hist(Global_Active, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##close the PNG file device
dev.off()
