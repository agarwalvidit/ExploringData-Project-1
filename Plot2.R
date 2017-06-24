# Data Science Specialization: Exploratory Data Analysis
# Course Project 1: Plot2
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

#plotting & saving as Plot2.png
png(file = "Plot2.png")
with(Consumption_Req, plot(globalactivepower ~ datetime , type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = ""))
dev.off()

