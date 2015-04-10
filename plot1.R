## plot1.R
## Global Active Power
## cache the focus data 
## this allows all 4 graph routines to use one read
## cycle of the large data set

if(!exists("makeCacheDF", mode="function")) source("cacheDF.R")
## cacheDF.R reads the power data, fixes dates/times, then gets
## the Feb 1-2 2007 data, returned into the 'pwrData' data frame
png(file = "plot1.png",width = 480, height = 480, units = "px")
par("mar" = c(4,4,3,2))
hist(pwrData$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
