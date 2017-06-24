# Data Science Specialization: Exploratory Data Analysis
# Course Project 1: Plot1
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
  Consumption_Req$globalactivepower <- as.numeric(Consumption_Req$globalactivepower)

#plotting & saving as Plot1.png
  png(file = "Plot1.png")
  hist(Consumption_Req$globalactivepower, col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")  
  dev.off()