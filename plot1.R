# Exploratory Data Analysis Project 1 : plot 1

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

# Plot 1 - Generate the distribution for the Global Actove Power Consumption
hist(pcextract$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# As the plot is initially aimed at being displayed on the screen, I copy it to a PNG file with appropriate size
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off() # Shut down the device
