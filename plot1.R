library(datasets)
data <- read.table("household_power_consumption.txt", header= TRUE, sep= ";", stringsAsFactors = FALSE)
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
hist(as.numeric(subdata$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", breaks = 18) 
dev.copy(png, file = "plot1.png")
dev.off()