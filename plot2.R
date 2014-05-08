## -----------------CODE TO PLOT (plot2.png)---------------------

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

## construct plot2.png 
plotGraph <- function (fileName, w, h){
        png(fileName, width=w, height=h)
        plot(datetime, DT$Global_active_power, 
             type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.off() 
}
        
plotGraph(fileName="plot2.png",480,480 )
