# =========== Loading the data ==========================
# 1. We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# 2. convert the Date and Time variables to Date/Time classes in R using the 
# strptime()  and as.Date() functions.
# 3. missing values are coded as ?
# 4. the data file is in the same folder as this source code.

fulldata <- read.table(file="household_power_consumption.txt", header=TRUE,sep = ";", na.strings = "?")
subdata  <- fulldata[fulldata$Date=="1/2/2007"| fulldata$Date=="2/2/2007", ]

datetime <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S") # new vector

# =========== Making Plots ==========================
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# 4 graphs

png(filename = "plot4.png",
    width = 480, height = 480, units = "px")


par(mfcol=c(2,2))

plot(datetime, subdata$Global_active_power,  xlab="", ylab="Global Active Power (kilowatts)", type ="n")
lines(datetime, subdata$Global_active_power)

plot(datetime, subdata$Sub_metering_1, xlab="", ylab="Energy sub metering", type ="n" )
lines(datetime, subdata$Sub_metering_1, col="black")
lines(datetime, subdata$Sub_metering_2, col="red")
lines(datetime, subdata$Sub_metering_3, col="blue")

plot(datetime, subdata$Voltage, ylab="Voltage", type ="n")
lines(datetime, subdata$Voltage)

plot(datetime, subdata$Global_reactive_power, ylab="Global_reactive_power", type ="n")
lines(datetime, subdata$Global_reactive_power)

dev.off()
