# Exploratory Data Analysis Project 1 : plot 4

# Read and extract the data : 
# Read the data from the dataset in the working directory
powerconsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the variable Date into the date format
powerconsumption$Date <- as.Date(powerconsumption$Date, format = "%d/%m/%Y")

# Subset the required values from 01/02/2007 to 02/02/2007 : 2 days analysis
pcextract <- subset(powerconsumption, Date >= "2007/2/1" & Date <= "2007/2/2")

# Create a new variable in the dataframe which will be formatted appropriately in order to have appropriate labels (necessary for next plots)
pcextract$DateTime <- strptime(paste(pcextract$Date, pcextract$Time), format = "%Y-%m-%d %H:%M:%S")
pcextract$DateTime <- as.POSIXct(pcextract$DateTime)

# Plot4 - Comprises 4 graphs being displayed at the same time on the graphics device
# It is necessary to configure the displaying configuration
par(mfrow = c(2, 2)) # I indicate here to display the graphs on 2 lines and 2 columns, rowwise.
# Plotting first graph
plot(pcextract$Global_active_power ~ pcextract$DateTime, type = "l", xlab = "", ylab = "Global Active Power")
# Plotting second graph
plot(pcextract$Voltage ~ pcextract$DateTime, type = "l", xlab = "datetime", ylab = "Voltage")
# Plotting third graph
plot(pcextract$Sub_metering_1 ~ pcextract$DateTime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(pcextract$Sub_metering_2 ~ pcextract$DateTime, col = "red")
lines(pcextract$Sub_metering_3~ pcextract$DateTime, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Plotting fourth graph
plot(pcextract$Global_reactive_power ~ pcextract$DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
# As the plot is initially aimed at being displayed on the screen, I copy it to a PNG file with appropriate size
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off() # Shut down the device