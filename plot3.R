## -----------------CODE TO PLOT (plot3.png)---------------------

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

## construct plot3.png 
plotGraph <- function (fileName, w, h){
        
        png(fileName, width=w, height=h)
        plot(datetime, DT$Sub_metering_1, col="black",
             type="l", xlab="", ylab="Engergy sub metering")
        ## add sub meter reading 2 & 3 
        lines(datetime, DT$Sub_metering_2, col="red")
        lines(datetime, DT$Sub_metering_3, col="blue")
        legend ("topright", lty=c(1,1), col=c("black", "red", "blue"), 
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
        
}
plotGraph(fileName="plot3.png", 480,480)