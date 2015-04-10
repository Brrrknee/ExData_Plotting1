## plot2.R
## Global Active Power
## cache the focus data 
## this allows all 4 graph routines to use one read
## cycle of the large data set
if(!exists("makeCacheDF", mode="function")) source("cacheDF.R")
## cacheDF.R reads the power data, fixes dates/times, then gets
## the Feb 1-2 2007 data, returned into the 'pwrData' data frame
png(file = "plot2.png",width = 480, height = 480, units = "px")
par("mar" = c(4,4,2,1))
plot(pwrData$DateTime, pwrData$Global_active_power,
     col="black",
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()