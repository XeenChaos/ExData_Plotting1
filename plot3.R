# Exploratory Data Analysis Project 1 : plot 3

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

# PLot 3 - Genererate the evolution of the measures per day taken from the measuring devices 1, 2 and 3
plot(pcextract$Sub_metering_1 ~ pcextract$DateTime, type = "l", xlab = "", ylab = "Energy sub metering")
# As I have to show multiple measures (1 per measuring device), I have to add a line on the graph for Sub_metering 2
lines(pcextract$Sub_metering_2 ~ pcextract$DateTime, col = "red")
# As I have to show multiple measures (1 per measuring device), I have to add a line on the graph for Sub_metering 3
lines(pcextract$Sub_metering_3~ pcextract$DateTime, col = "blue")
# The legend is requested to be placed on the top right corner of the graph
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# As the plot is initially aimed at being displayed on the screen, I copy it to a PNG file with appropriate size
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off() # Shut down the device
