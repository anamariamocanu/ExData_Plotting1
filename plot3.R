##define the data file to import
dataFile <- "household_power_consumption.txt"

##read the entire text file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subset only the data in between the required dates
subData <-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##converst the datetime into the desired format
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##set the sub_meterings as numeric for the plot to work
SubMetering1<-as.numeric(subData$Sub_metering_1)
SubMetering2<-as.numeric(subData$Sub_metering_2)
SubMetering3<-as.numeric(subData$Sub_metering_3)

##Open PNG file device
png("plot3.png", width=480, height=480)

##create the plot
plot(datetime, SubMetering1, type="l", xlab="", ylab="Energy sub metering")

##add the lines on the graph
lines(datetime, SubMetering2, col = "red")
lines(datetime, SubMetering3, col = "blue")

##Create the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##close the PNG file device
dev.off()
