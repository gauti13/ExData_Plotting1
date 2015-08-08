## This piece of code generated the third plot
library(datasets)
data <- read.table("household_power_consumption.txt", header= TRUE, sep= ";", stringsAsFactors = FALSE, na.strings = "?") ## Read data from file
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") ## Subset the data for the two days
subdata[,1] <- as.Date(subdata[,1], format='%d/%m/%Y') ## Modify format of date for plotting
subdata$modified_date_time <- strptime(paste(subdata$Date,subdata$Time),format = '%Y-%m-%d %H:%M:%S') ## Add a new column called modified_date_time containing date and time as a single string
plot(c(subdata$modified_date_time,subdata$modified_date_time,subdata$modified_date_time), c(subdata$Sub_metering_1, subdata$Sub_metering_2, subdata$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(subdata$modified_date_time, subdata$Sub_metering_1, col="black") ## Generate plot for Sub metering 1
lines(subdata$modified_date_time, subdata$Sub_metering_2, col="red")## Generate plot for Sub metering 2
lines(subdata$modified_date_time, subdata$Sub_metering_3, col="blue")## Generate plot for Sub metering 1
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png")
dev.off()
