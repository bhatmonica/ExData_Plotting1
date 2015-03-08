# Plot4 R File
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


# Plot fourth graph
par(mfrow=c(2, 2))
with(select_data,{
    plot(select_data$Datetime, select_data$Global_active_power, type='l',
         ylab="Global Active Power",  xlab="", col="Black")
    plot(select_data$Datetime, select_data$Voltage, type='l',
         ylab="Voltage", xlab="datetime", col="Black")
    plot(select_data$Datetime,Sub_metering_1, type='l', ylab="Energy sub metering", xlab="")
    lines(select_data$Datetime,Sub_metering_2, col="Red")
    lines(select_data$Datetime,Sub_metering_3, col="Blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(select_data$Datetime, select_data$Global_reactive_power, type='l',
         ylab="Global Reactive Power", xlab="datetime",  col="Black")
})

# Save to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
