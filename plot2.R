readData <- function(file) {
  data <- read.csv("household_power_consumption.txt", sep=";");
  data$date2 <- as.Date(as.character(data$Date), "%d/%m/%Y");
  sdata <- subset(data, date2 == as.Date("2007-02-01") | date2 == as.Date("2007-02-02"));
  sdata;
}

png(filename = "plot2.png", width = 480, height = 480, units = "px");
sdata <- readData("household_power_consumption.txt");

dayCol <- as.POSIXct(paste(sdata$date2, sdata$Time), format="%Y-%m-%d %H:%M:%S");
plot(dayCol, as.numeric(as.character(sdata$Global_active_power)),  ylab="Global Active Power(kilowatts)", type='l', xlab="")
dev.off()