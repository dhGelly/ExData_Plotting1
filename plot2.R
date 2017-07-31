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
# global active power ~ days (thursday-saturday)

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(datetime, subdata$Global_active_power,  xlab="", ylab="Global Active Power (kilowatts)", type ="n")
lines(datetime, subdata$Global_active_power)

dev.off()
