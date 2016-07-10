#==================================================================================================
# File:         plot2.R
# Description:  Script generates a line graph of global active power from 2/1/2007-2/2/2007.
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
png("plot2.png", width = 480, height = 480)

#--------------------------------------------------------------------------------------------------
# Generate line graph and close graphics device.
#--------------------------------------------------------------------------------------------------
gap <- as.numeric(as.character(household$Global_active_power))
datetime <- as.POSIXct(paste(household$Date, household$Time), format = "%Y-%m-%d %H:%M:%S")

par(mar = c(5,5,3,2))
plot(
        x = datetime, 
        y = gap, 
        type = "l", 
        xlab = "", 
        ylab = "Global Active Power (kilowatts)"
)

dev.off()
