## plot4.R
## 2x2 set of 4 plots
## cache the focus data 
## this allows all 4 graph routines to use one read
## cycle of the large data set
if(!exists("makeCacheDF", mode="function")) source("cacheDF.R")
## cacheDF.R reads the power data, fixes dates/times, then gets
## the Feb 1-2 2007 data, returned into the 'pwrData' data frame
png(file = "plot4.png",width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))
## UL: source("plot2.R") if not for dev.off!
par("mar" = c(4,4,2,1))
plot(pwrData$DateTime, pwrData$Global_active_power,
     col="black",
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
## LL: source("plot3.R") if not for dev.off!
par("mar" = c(4,4,2,1))

plot(pwrData$DateTime,
     pwrData$Sub_metering_1,
     col = "black",
     xlab="",
     ylab="Energy sub metering",
     type="n")

lines(pwrData$DateTime,
      pwrData$Sub_metering_1,
      col = "black")
lines(pwrData$DateTime,
      pwrData$Sub_metering_2,
      col = "red")
lines(pwrData$DateTime,
      pwrData$Sub_metering_3,
      col = "blue")

legend("topright", 
       col = c("black", 
               "red", 
               "blue"), 
       lty=par("lty"),
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"))
## UR: voltage
par("mar" = c(4,4,2,1))
plot(pwrData$DateTime, pwrData$Voltage,
     col="black",
     type="l",
     xlab="datetime",
     ylab="Voltage")
## LR: reactive
par("mar" = c(4,4,2,1))
plot(pwrData$DateTime, pwrData$Global_reactive_power,
     col="black",
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()