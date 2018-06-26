##Exploratory Data Analysis Wk 1 Assignment
##Created 6/25/2018
##========================================================================================

#Read in all data for project-----------------------------------------------------------
power_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Subset & Clean Dataset
power_data1 <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))
power_data1$Date <- as.Date(power_data1$Date, "%d/%m/%Y")
power_data1$Global_active_power <- as.numeric(as.character(power_data1$Global_active_power))
power_data1$Sub_metering_1 <- as.numeric(as.character(power_data1$Sub_metering_1))
power_data1$Sub_metering_2 <- as.numeric(as.character(power_data1$Sub_metering_2))
power_data1$Sub_metering_3 <- as.numeric(as.character(power_data1$Sub_metering_3))
power_data1$Voltage <- as.numeric(as.character(power_data1$Voltage))
power_data1$Global_reactive_power <- as.numeric(as.character(power_data1$Global_reactive_power))

#Convert time
datetime <- paste(as.Date(power_data1$Date), power_data1$Time)
power_data1$datetime <- as.POSIXct(datetime)


#Create Plots
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mfcol = c(2,2))

plot(power_data1$Global_active_power ~ power_data1$datetime,
     ylab = "Global Active Power (kilowatts)",
     type = "l",
     xlab = "")

plot(power_data1$Sub_metering_1 ~ power_data1$datetime,
     ylab = "Energy sub metering",
     type = "l",
     xlab = "")

legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 2)

lines(power_data1$Sub_metering_2 ~ power_data1$datetime, col = "red")
lines(power_data1$Sub_metering_3 ~ power_data1$datetime, col = "blue")

plot(power_data1$Voltage ~ power_data1$datetime,
     ylab = "Voltage",
     type = "l",
     xlab = "datetime")


plot(power_data1$Global_reactive_power ~ power_data1$datetime,
     ylab = "Global_reactive_power",
     type = "l",
     xlab = "datetime")

dev.off()