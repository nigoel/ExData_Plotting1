readData <- function(file) {
  data <- read.csv("household_power_consumption.txt", sep=";");
  data$date2 <- as.Date(as.character(data$Date), "%d/%m/%Y");
  sdata <- subset(data, date2 == as.Date("2007-02-01") | date2 == as.Date("2007-02-02"));
  sdata;
}

sdata <- readData("household_power_consumption.txt");
dayCol <- as.POSIXct(paste(sdata$date2, sdata$Time), format="%Y-%m-%d %H:%M:%S");


png(filename = "plot4.png", width = 480, height = 480, units = "px");
par(mfrow = c(2, 2));
# Top-left corner

dataColumn <- as.numeric(as.character(sdata$Global_active_power));
plot(dayCol, dataColumn, type = "l", xlab = "", ylab = "Global Active Power");

# Top-right corner
dataColumn <- as.numeric(as.character(sdata$Voltage));
plot(dayCol, dataColumn, type = "l", xlab = "", ylab = "Voltage");

# Bottom-left corner
dataColumn1 <- as.numeric(as.character(sdata$Sub_metering_1));
dataColumn2 <- as.numeric(as.character(sdata$Sub_metering_2));
dataColumn3 <- as.numeric(as.character(sdata$Sub_metering_3));
plot(dayCol, dataColumn1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(dayCol, dataColumn2, col = "red");
lines(dayCol, dataColumn3, col = "blue");

legend("topright",  bty = "n",  col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

# Bottom-right corner
dataColumn <- as.numeric(as.character(sdata$Global_reactive_power));
plot(dayCol, dataColumn, type = "l", col = "black",  xlab = "datetime", ylab = "Global_reactive_power")
dev.off()