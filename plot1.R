setwd("C:/Users/mnasr/Documents/Explanatory_R")

# reading file from source
file <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?" )
# removing NA's
file  <- na.omit(file)
write.csv(file , file="House_hold_consumption.csv")

file <- read.csv("House_hold_consumption.csv")

file$Date <- as.Date(file$Date ,  format="%d/%m/%Y")
#subsetting for required dates
file <- file[file$Date>=as.Date("2007-02-01") & file$Date <= as.Date("2007-02-02"),]

## creating png files
png(file = "plot1.png", width = 480,height = 480, bg = "white")

hist(file$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
dev.off()
