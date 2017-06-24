# Data Science Specialization: Exploratory Data Analysis
# Course Project 1: Plot4
# Vidit Agarwal
################################################################################

#loading data
rm(list = ls())
filename <- "household_power_consumption.txt"
Consumption <- read.table(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# Cleaning variables names & subsetting to get required data
names(Consumption) <- gsub("_","",names(Consumption)) %>% tolower()
Consumption$date <- as.Date(Consumption$date, format = "%d/%m/%Y")
Consumption_Req <- subset(Consumption, date == "2007-02-01"| date ==  "2007-02-02")


# Setting Variable classes
Consumption_Req$globalactivepower <- as.numeric(Consumption_Req$globalactivepower)
Consumption_Req$datetime <- strptime(paste(Consumption_Req$date, Consumption_Req$time), "%Y-%m-%d %H:%M:%S")
Consumption_Req$datetime <- as.POSIXct(Consumption_Req$datetime)

#plotting & saving as Plot4.png
png(file = "Plot4.png")
par(mfrow = c(2,2)) # setting up plot array

with(Consumption_Req, plot(globalactivepower ~ datetime , type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = ""))

with(Consumption_Req, plot(voltage ~ datetime , type = "l", xlab = "datetime", ylab = "Voltage", main = ""))

with(Consumption_Req, plot(submetering1 ~ datetime , type = "l", xlab = "", ylab = "Energy sub metering", main = ""))  
with(Consumption_Req, lines(submetering2 ~ datetime,col = "red"))
with(Consumption_Req, lines(submetering3 ~ datetime,col = "blue"))
legend( "topright", lty = 1, col = c("black", "red", "blue"), legend = c("submetering1","submetering2", "submetering3"))

with(Consumption_Req, plot(globalreactivepower ~ datetime , type = "l", xlab = "datetime", ylab = "Global Reactive Power (kilowatts)", main = ""))

dev.off()

