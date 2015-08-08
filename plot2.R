## This piece of code generated the second plot of global active power over the period of time
library(datasets)
data <- read.table("household_power_consumption.txt", header= TRUE, sep= ";", stringsAsFactors = FALSE, na.strings = "?") ## Reads the data from the file
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") ## Subsetting the data for the two days
subdata[,1] <- as.Date(subdata[,1], format='%d/%m/%Y') ## Modify the format of the date for easier plotting
plot(strptime(paste(subdata$Date,subdata$Time),format = '%Y-%m-%d %H:%M:%S'),subdata$Global_active_power, type = 'l', xlab="", ylab = "Global Active Power (Kilowatts)") ## Generate the plot
dev.copy(png, file = "plot2.png")
dev.off()
