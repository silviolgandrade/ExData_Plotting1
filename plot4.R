# Use this folder in my harddrive as workspace. Adjust for your preferences.
setwd("D:/jhds/jhds_04/ExData_Plotting1")

# First, seek for a subsetting dataframe with the valid period of analisys.
# If there are no file yet, download data and prepare subsetting dataframe saving as SelectedDays.txt
# OBS.: When used method="curl" I receive error msg "nonzero exit status".
if (!file.exists("SelectedDays.txt")) {
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
  unzip("household_power_consumption.zip")

  # loading data
  FullData <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.string = '?', colClasses = c(rep('character', 2), rep('numeric', 7)))
  
  # subset
  FullData$Date <- as.Date(FullData$Date,format = "%d/%m/%Y")
  SelectedDays <- FullData[FullData$Date <= "2007-02-02" & FullData$Date >= "2007-02-01",]
  write.table(SelectedDays, "SelectedDays.txt", row.name=FALSE)
}

SelectedDays <- read.table("SelectedDays.txt", sep = ' ', header = TRUE, na.string = '?', colClasses = c(rep('character', 2), rep('numeric', 7)))

# Merge a Date+Time column
datetime <- paste(as.Date(SelectedDays$Date), SelectedDays$Time)
SelectedDays$Datetime <- as.POSIXct(datetime)
rm(datetime)

# Plot 4
png(filename="plot4.png", width = 480, height = 480, bg = "white")
par(mfrow=c(2,2))

with(SelectedDays, { 
  plot(Datetime, Global_active_power, type="l", ylab="Global Active Power (KWa)", xlab="")
  plot(Datetime, Voltage, type="l", ylab="Voltage (V)", xlab="")
  plot(Datetime, Global_reactive_power, type="l", ylab="Global reactive power (KWa)", xlab="")
  plot(Datetime, Sub_metering_1, type="l", ylab="Energy sub metering (W/h)", xlab="", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
  lines(Datetime, Sub_metering_2, col="red", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
  lines(Datetime, Sub_metering_3, col="blue", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
  legend("topright", c("Sub metering 1","Sub metering 2","Sub metering 3"), lty=1,  col=c("black","red","blue"), bty="n")
})
dev.off()