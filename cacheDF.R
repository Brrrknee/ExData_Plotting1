### util: Cache-ing DF


## `makeCacheDF`: This function creates a special "DF" object
## It holds a per-instance value (cached) 
## ----console:
## z<- makeCacheDF()   ## set a new object 'z' to this special DF object, returning a list of the 4 functions
## z$set(load in the source csv file) 
## z2 <- z$get()  ## set 'z2' to the original DF 
## z2  ## show the created DF!
## ----end console-------continue below

makeCacheDF <- function(cachePowerData = data.frame()) {
  set <- function() { ## csvFile to read
    if(!exists("uciPowerDataREAD")) {
      uciPowerDataREAD <- "Full Data file already read"
      cachePowerData <<- read.csv(file="household_power_consumption.txt", 
                                        header=TRUE, 
                                        sep =";", 
                                        na.strings=c("?"))
      pdt <- strptime(paste(cachePowerData$Date, 
                            cachePowerData$Time), 
                      "%e/%m/%Y %H:%M:%S",
                      tz = "GMT")
      cachePowerData <<- cbind(pdt, cachePowerData)
      rm(pdt)
      colnames(cachePowerData)[1] <<- "DateTime"
      cachePowerData$Time <<- NULL
      cachePowerData$Date <<- NULL
      cachePowerData <<- cachePowerData[
                  ((as.Date(cachePowerData$DateTime) >= as.Date("2007-02-01")) & 
                  (as.Date(cachePowerData$DateTime) <= as.Date("2007-02-02"))),]
    }
    cachePowerData
  }
  get <- function() cachePowerData
  list(set=set, get=get)
}
 
FebCache <- makeCacheDF()
FebCache$set()
pwrData <- FebCache$get()
