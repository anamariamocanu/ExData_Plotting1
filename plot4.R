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

##set the Voltage as numeric for the plot to work
Voltage <-as.numeric(subData$Voltage)

##set the sub_meterings as numeric for the plot to work
SubMetering1<-as.numeric(subData$Sub_metering_1)
SubMetering2<-as.numeric(subData$Sub_metering_2)
SubMetering3<-as.numeric(subData$Sub_metering_3)

##set the global reactive power as numeric for the plot to work
Global_Reactive <-as.numeric(subData$Global_reactive_power)

##Open PNG file device
png("plot4.png", width=480, height=480)

##Define the multiple base plots
par(mfrow = c(2, 2))

with(subData, {
     plot(datetime, Global_Active, type="l", xlab="", ylab="Global Active Power",cex=0.2) 
     plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
     plot(datetime, SubMetering1, type="l", xlab="", ylab="Energy sub metering")
     lines(datetime, SubMetering2, col = "red")
     lines(datetime, SubMetering3, col = "blue")
     legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty="n")
     plot(datetime, Global_Reactive, type="l", xlab="datetime", ylab="Global_reactive_power")
})

##close the PNG file device
dev.off()
