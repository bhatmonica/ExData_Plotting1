# Plot1 R File
# Read the data
all_data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?",
                     check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Get dates in correct format
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

# Filter data for a given date range
select_data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Get datetime
datetime <- paste(as.Date(select_data$Date), select_data$Time)
select_data$Datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))
# Plot first graph
hist(select_data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

