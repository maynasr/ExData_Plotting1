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

file$Date <- as.Date(file$Date ,  format="%d/%m/%Y")
date_time <- paste(file$Date[1], file$Time[1])
x <- seq(as.POSIXct(date_time),by="min",length.out=2880)

## creating png files
#plot 3
dev.new()

x <- seq(as.POSIXct(date_time),by="min",length.out=2880)
png(file = "plot3.png", width = 480,height = 480, bg = "white")
plot(x, file$Sub_metering_1 , type = "n" , ylab = "Enery Sub metering",  xlab = " ")
points (x, file$Sub_metering_1,type = 'l', col = "Black")
points (x, file$Sub_metering_2,type = 'l', col = "red")
points (x, file$Sub_metering_3,type = 'l', col = "Blue")
legend( "topright",  pch = "________", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()