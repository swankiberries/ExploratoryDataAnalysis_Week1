#==================================================================================================
# File:         plot3.R
# Description:  Script generates a line graph of energy sub metering from 2/1/2007-2/2/2007.
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
png("plot3.png", width = 480, height = 480)

#--------------------------------------------------------------------------------------------------
# Generate line graph and close graphics device.
#--------------------------------------------------------------------------------------------------
sub_metering_1 <- as.numeric(as.character(household$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(household$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(household$Sub_metering_3))
datetime <- as.POSIXct(paste(household$Date, household$Time), format = "%Y-%m-%d %H:%M:%S")

par(mar = c(5,5,3,2))
plot(
        x = datetime, 
        y = sub_metering_1, 
        type = "l", 
        xlab = "", 
        ylab = "Energy sub metering",
        col = "black"
)
lines(
        x = datetime, 
        y = sub_metering_2, 
        col = "red"
)
lines(
        x = datetime, 
        y = sub_metering_3, 
        col = "blue"
)
legend(
        "topright",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col = c("black", "red", "blue"), 
        lty = c(1,1,1)
)

dev.off()
