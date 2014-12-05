
readData <- function(file) {
  data <- read.csv("household_power_consumption.txt", sep=";");
  data$date2 <- as.Date(as.character(data$Date), "%d/%m/%Y");
  sdata <- subset(data, date2 == as.Date("2007-02-01") | date2 == as.Date("2007-02-02"));
  sdata;
}

png("plot1.png")
sdata <- readData("household_power_consumption.txt");
dataColumn <- as.numeric(as.character(sdata$Global_active_power));
hist(dataColumn, col="red", xlab="Global_active_power(kilowatts)", ylab="Frequency", main="Global Active Power")

dev.off()