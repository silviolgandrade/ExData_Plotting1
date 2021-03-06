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

# Plot 1
png(filename="plot1.png", width = 480, height = 480, bg = "white")
hist(as.numeric(SelectedDays$Global_active_power),
     col='red',
     xlab='Global Active Power (KWa)',
     main='Plot1 - Global Active Power')
dev.off()

