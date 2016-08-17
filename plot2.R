## Script created by Monica Brisnehan for Coursera.org
## Data Science Specialization by Johns Hopkins University

## This script creates a plot of dataFrame powerTarget
## Created using download_unzip.R

## Plot 2: Time series of Global_active_power

## This script assumes the data file is located in the current working directory

## Read entire file into data.frame (2,075,260 observations)
powerAll <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings=c("NA", "-", "?"), stringsAsFactors=F)

## Subset to target dates
powerTarget <- subset(powerAll, powerAll$Date == "1/2/2007" | powerAll$Date == "2/2/2007")

## Create new POSIXlt date column
powerTarget$date <- paste(powerTarget$Date, powerTarget$Time)
powerTarget$date <- strptime(powerTarget$date, "%d/%m/%Y %H:%M:%S")


## Create time series plot 
plot2 <- function() {
  with(powerTarget, plot(date,Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type="l"))
}

## Open PNG device, create plot saved to device, close device
png(
  "plot2.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

plot2()
dev.off()
