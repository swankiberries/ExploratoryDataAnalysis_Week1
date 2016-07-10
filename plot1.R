#==================================================================================================
# File:         plot1.R
# Description:  Script generates histogram of global active power in kilowatts.
#==================================================================================================

#--------------------------------------------------------------------------------------------------
# Read data. Source file must be in working directory.
# Subset for data between Dates 2007-02-01 to 2007-02-02.
#--------------------------------------------------------------------------------------------------
file <- "household_power_consumption.txt"
household <- read.table(file, header = TRUE, sep = ";")
household$Date <- as.Date(household$Date, "%d/%m/%Y")
household <- subset(household, household$Date >= "2007-02-01")
household <- subset(household, household$Date <= "2007-02-02")

#--------------------------------------------------------------------------------------------------
# Open PNG graphics device.
#--------------------------------------------------------------------------------------------------
png("plot1.png", width = 480, height = 480)

#--------------------------------------------------------------------------------------------------
# Generate histogram and close graphics device.
#--------------------------------------------------------------------------------------------------
gap <- as.numeric(as.character(household$Global_active_power))
par(mar = c(5,5,3,2))
hist(gap, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
     )

dev.off()
