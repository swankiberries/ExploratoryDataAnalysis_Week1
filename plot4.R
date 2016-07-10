#==================================================================================================
# File:         plot4.R
# Description:  Script generates four graphs for Global Active Power, Voltage, Energy Sub Metering,
#               and Global Reactive Power from 2/1/2007-2/2/2007.
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
# Open PNG graphics device and set up graphics parameters
#--------------------------------------------------------------------------------------------------
png("plot4.png", width = 480, height = 480)
par(mar = c(5,5,3,2))
par(mfrow = c(2,2))

#--------------------------------------------------------------------------------------------------
# Generate Global Active Power line graph
#--------------------------------------------------------------------------------------------------
gap <- as.numeric(as.character(household$Global_active_power))
datetime <- as.POSIXct(paste(household$Date, household$Time), format = "%Y-%m-%d %H:%M:%S")

plot(
        x = datetime, 
        y = gap, 
        type = "l", 
        xlab = "", 
        ylab = "Global Active Power (kilowatts)"
)

#--------------------------------------------------------------------------------------------------
# Generate Voltage line graph
#--------------------------------------------------------------------------------------------------
v <- as.numeric(as.character(household$Voltage))

plot(
        x = datetime, 
        y = v, 
        type = "l", 
        xlab = "datetime", 
        ylab = "Voltage"
)

#--------------------------------------------------------------------------------------------------
# Generate Energy Sub Metering line graph
#--------------------------------------------------------------------------------------------------
sub_metering_1 <- as.numeric(as.character(household$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(household$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(household$Sub_metering_3))

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

#--------------------------------------------------------------------------------------------------
# Generate Global Reactive Power histogram
#--------------------------------------------------------------------------------------------------
grp <- as.numeric(as.character(household$Global_reactive_power))
plot(
        x = datetime, 
        y = grp, 
        type = "l",
        xlab = "datetime", 
        ylab = "Global_reactive_power"
)

dev.off()
