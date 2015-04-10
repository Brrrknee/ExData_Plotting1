## plot3.R
## sub metering
## cache the focus data 
## this allows all 4 graph routines to use one read
## cycle of the large data set
if(!exists("makeCacheDF", mode="function")) source("cacheDF.R")
## cacheDF.R reads the power data, fixes dates/times, then gets
## the Feb 1-2 2007 data, returned into the 'pwrData' data frame
png(file = "plot3.png",width = 480, height = 480, units = "px")
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
dev.off()
