# Exploratory Data Analysis
# Project 1


# create a folder for this course if it does not exist already 
if (!file.exists("DS4")) {
      dir.create("DS4")
}

# Download and unzip, the zipped file if the txt file  is not already in the folder
# Must use mode="wb" because the zipped file is in binary

if (!file.exists("./DS4/household_power_consumption.txt")) {
      fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileURL, destfile = "./DS4/power.zip", mode="wb")
      unzip("./DS4/power.zip", exdir="./DS4")
}

# Read in the dataset
header <- read.table("household_power_consumption.txt", sep=";", nrows=1)
power <- read.table("household_power_consumption.txt", sep=";", na.strings = c("?"), skip=1)
colnames(power) <- unlist(header)

# Create the subset of data for the plots
sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

# Format the date and time fields
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y") 
timetemp <- paste(sub$Date, sub$Time)
sub$TimeCh <- strptime(timetemp, format = "%Y-%m-%d %H:%M:%S") 


png(file = "./ExData_Plotting1/plot4.png")
par(mfrow = c(2,2))
with(sub, {
      plot(TimeCh,Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
      plot(TimeCh,Voltage,type = "l", xlab = "datetime", ylab = "Voltage")
      with(sub, plot(TimeCh, Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab = ""))
      with(sub, points(TimeCh, Sub_metering_1, type="l", col= "black"))
      with(sub, points(TimeCh, Sub_metering_2, type="l", col= "red"))
      with(sub, points(TimeCh, Sub_metering_3, type="l", col= "blue"))
      legend("topright", pch = "__", bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
      plot(TimeCh,Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global Reactive Power")
})
dev.off()

