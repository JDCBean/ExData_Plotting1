# Set working directory to read in raw text file
setwd("C:/Users/asus/Documents/Coursera.org - Data Science - 4. Exploratory Data Analysis/household_power_consumption")
getwd() # Confirm the directory where the data resides

# Read in text file (semi-colon delimited)
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
str(data)

# Convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
str(data)

# Subset to include on 2/1/2007 and 2/2/2007 data
data <- subset(data,subset = (Date >= "2007-02-01" & Date <="2007-02-02"))
dim(data)



# Reset working directory to project folder for Github push
setwd("C:/Users/asus/Documents/Coursera.org - Data Science - 4. Exploratory Data Analysis/household_power_consumption/ExData_Plotting1")
getwd()

# Convert dates to include variable with date-time
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
par(mar=c(4,4,4,4), oma=c(.5,.5,.5,.5), mfrow=c(1,1))
plot(data$datetime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

