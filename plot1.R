## Code for plot 1
# asume that the data file is in the same folder

# read the data from file
# using the header given in file for colum names
# set the classes so the file will load faster
dataOrg <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", rep("numeric",7)))

## i make a copy so i can play with the data and dont have to read it again if i mess something up. 
## Reading the data took a long time at my pc (5min) normaly i would remove/overwrite the dataOrg to save memory
data <- dataOrg

## combine date and time to one filed
data$Date <- paste(data$Date, data$Time, sep = " ")
## remove time column since it is in date now
data <- subset(data, select = -c(2) )

## set Date in date format
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")

## select only the correct dates 2007-02-01 and 2007-02-02
data <- subset(data, Date >= as.POSIXlt("2007-02-01") & Date < as.POSIXlt("2007-02-03"))

## (OPTIONAL) use the following lines to see if data apears to be correct
#show first few rows of data
head(data)
#show last line
tail(data)
# show a summary of data
summary(data$Global_active_power)

## Make the desired plot and save it to a PNG file
#save as png
png(file = "plot1.png")
## here it is a histogram collored red the nr of breaks is unknown so we start with default
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Gloabl Active Power (killowatts)")
dev.off()