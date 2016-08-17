# Script created by Monica Brisnehan for Coursera.org
## Data Science Specialization by Johns Hopkins University

## This script creates a plot of dataFrame powerTarget
## Created using download_unzip.R

## Plot 3: Multivariate plot of Submetering

## This script assumes the data file is located in the current working directory

## Read entire file into data.frame (2,075,260 observations)
powerAll <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings=c("NA", "-", "?"), stringsAsFactors=F)

## Subset to target dates
powerTarget <- subset(powerAll, powerAll$Date == "1/2/2007" | powerAll$Date == "2/2/2007")

## Create new POSIXlt date column
powerTarget$date <- paste(powerTarget$Date, powerTarget$Time)
powerTarget$date <- strptime(powerTarget$date, "%d/%m/%Y %H:%M:%S")

## Create multivariate time series plot 
plot3 <- function() {
  with(powerTarget, plot(date,Sub_metering_1, xlab = "", ylab="Energy sub metering", type="l"))
  with(powerTarget, lines(date, Sub_metering_2, col = "red"))
  with(powerTarget, lines(date, Sub_metering_3, col = "blue"))
  legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1)
}

## Open PNG device, create plot saved to device, close device
png(
  "plot3.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

plot3()
dev.off()
