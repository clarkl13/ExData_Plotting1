##Exploratory Data Analysis Wk 1 Assignment
##Created 6/25/2018
##========================================================================================

#Read in all data for project-----------------------------------------------------------
power_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

#Subset & Clean Dataset
power_data1 <- subset(power_data, Date %in% c("1/2/2007", "2/2/2007"))
power_data1$Date <- as.Date(power_data1$Date, "%d/%m/%Y")
power_data1$Global_active_power <- as.numeric(as.character(power_data1$Global_active_power))

#Create Hist. & Export Plot as PNG
png("plot1.png", width = 480, height = 480)

plot1 <- hist(power_data1$Global_active_power, 
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)",
             col = "Red")
dev.off()


