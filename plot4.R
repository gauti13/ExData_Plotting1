## This piece of code generates the fourth plot
library(datasets)
data <- read.table("household_power_consumption.txt", header= TRUE, sep= ";", stringsAsFactors = FALSE, na.strings = "?") ## Read data from the file
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") ## Subset the data for the two days
subdata[,1] <- as.Date(subdata[,1], format='%d/%m/%Y') ## Modify format of the date
subdata$modified_date_time <- strptime(paste(subdata$Date,subdata$Time),format = '%Y-%m-%d %H:%M:%S') ## Create a new column modified_date_time containing date and time
par(mfrow = c(2,2), mar = c(4,4,2,2)) ## Split entire plot into two rows and two columns
with(subdata, {
	plot(subdata$modified_date_time,subdata$Global_active_power, type = 'l', xlab="", ylab = "Global Active Power (Kilowatts)") ## Generates the first plot
	plot(subdata$modified_date_time,subdata$Voltage, type = 'l', xlab="datetime", ylab = "Voltage (Volts)") ## Generates the second plot
	plot(c(subdata$modified_date_time,subdata$modified_date_time,subdata$modified_date_time), c(subdata$Sub_metering_1, subdata$Sub_metering_2, subdata$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="") ## Generates the third plot
	lines(subdata$modified_date_time, subdata$Sub_metering_1, col="black")
	lines(subdata$modified_date_time, subdata$Sub_metering_2, col="red")
	lines(subdata$modified_date_time, subdata$Sub_metering_3, col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
	plot(subdata$modified_date_time,subdata$Global_reactive_power, type = 'l', xlab="datetime", ylab = "Global_rective_power") ## Generates the fourth plot
	})
dev.copy(png, file = "plot4.png")
dev.off()
