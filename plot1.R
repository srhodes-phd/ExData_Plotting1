# Exploratory Data Analysis
# Project 1

require(data.table)


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
sub <- subset(power, Date == "2/1/2007" | Date == "2/2/2007")

str(sub)

hist(sub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")









# Data cleaning
