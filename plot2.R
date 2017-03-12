#Read data
el_power_data <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", skip = 66637, nrows = 2880, stringsAsFactors = FALSE)

#Change date and time columns to date/time format
colnames(el_power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
el_power_data$datetime <- strptime(paste(el_power_data$Date, el_power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
el_power_data$Date2 <- as.Date(el_power_data$Date, "%d/%m/%Y")
el_power_data$Time2 <- strptime(el_power_data$Time, "%H:%M:%S")

#Plot 2
with(el_power_data, plot(datetime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()