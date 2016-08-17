## Script created by Monica Brisnehan for Coursera.org
## Data Science Specialization by Johns Hopkins University

## This script creates a plot of dataFrame powerTarget
## Created using download_unzip.R

## Plot 4: Four plots in one chart

## This script assumes the data file is located in the current working directory

## Read entire file into data.frame (2,075,260 observations)
powerAll <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings=c("NA", "-", "?"), stringsAsFactors=F)

## Subset to target dates
powerTarget <- subset(powerAll, powerAll$Date == "1/2/2007" | powerAll$Date == "2/2/2007")

## Create new POSIXlt date column
powerTarget$date <- paste(powerTarget$Date, powerTarget$Time)
powerTarget$date <- strptime(powerTarget$date, "%d/%m/%Y %H:%M:%S")

## Create four different plots for matrix
plota <- function() {
  with(powerTarget, plot(date,Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type="l"))
}

plotb <- function(){
  with(powerTarget, plot(date, Voltage, xlab = "datetime", ylab="Voltage", type="l"))
}

plotc <- function() {
  with(powerTarget, plot(date,Sub_metering_1, xlab = "", ylab="Energy sub metering", type="l"))
  with(powerTarget, lines(date, Sub_metering_2, col = "red"))
  with(powerTarget, lines(date, Sub_metering_3, col = "blue"))
  legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1:2, cex=0.8)
}

plotd <- function() {
  with(powerTarget, plot(date, Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type="l"))
}

## Open PNG device, create matrix,create plots saved to device, close device
png(
  "plot4.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

par(mfrow=c(2,2))
plota()
plotb()
plotc()
plotd()
dev.off()
