## -----------------CODE TO PLOT (plot4.png)---------------------

## house hold data, loaded and saved into local machine         
householdDataset <- "household_power_consumption.txt"

## the follwoing statement requires package sqldf
## select only rows of interest in the dataset and load them
## into a dataframe 'DT', this requires sqldf package
library(sqldf)
DT <- read.csv.sql(householdDataset, 
                   sql="SELECT * from file 
                   WHERE Date='1/2/2007' OR 
                   DATE='2/2/2007'", header= TRUE, sep=";")
## close the connection 
sqldf(verbose=TRUE)
## merge the date and time columns into Date/Time class
datetime<- strptime(paste(DT[,1],DT[,2]), "%d/%m/%Y %H:%M:%S")

## construct plot4.png 
plotGraph <- function (fileName, w, h){
        png(fileName, width=w, height=h)
        par(mfrow = c(2,2),mar = c(4,4,2,2))
        
        ## plot first plot 
        plot(datetime, DT$Global_active_power, 
             type="l", xlab="datetime", ylab="Global Active Power (kilowatts)")
        
        # ## plot the 2nd 
        plot(datetime, DT$Voltage, col="black",
             type="l", xlab="datetime", ylab="Voltage")
        
        ## plot the 3d plot 
        plot(datetime, DT$Sub_metering_1, col="black",
             type="l", xlab="", ylab="Engergy sub metering")
        
        ## add sub meter reading 2 & 3 
        lines(datetime, DT$Sub_metering_2, col="red")
        lines(datetime, DT$Sub_metering_3, col="blue")
        legend ("topright", lty=c(1,1), col=c("black", "red", "blue"), 
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## plot the 4th plot 
        
        plot(datetime, DT$Global_reactive_power, col="black",
             type="l", xlab="datetime", ylab="Global_reactive_pwer")
        
        dev.off()
        
}
plotGraph(fileName="plot4.png", 480,480)
