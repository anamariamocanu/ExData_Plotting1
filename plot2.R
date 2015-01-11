##define the data file to import
dataFile <- "household_power_consumption.txt"

##read the entire text file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subset only the data in between the required dates
subData <-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##converst the datetime into the desired format
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##set the global active power as numeric for the plot to work
Global_Active <-as.numeric(subData$Global_active_power)

##Open PNG file device
png("plot2.png", width=480, height=480)

##create the plot
plot(datetime, Global_Active, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##close the PNG file device
dev.off()
