##This piece of code generated the forst plot which is a histogra of Global Active Power
library(datasets)
data <- read.table("household_power_consumption.txt", header= TRUE, sep= ";", stringsAsFactors = FALSE) ##reads the data from the file
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") ##subsets the data only for 1st and 2nd February
hist(as.numeric(subdata$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", breaks = 18) 
dev.copy(png, file = "plot1.png") ##copies the histogram to a png file
dev.off()
