## -----------------CODE TO PLOT (plot1.png)---------------------

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

## construct plot1.png 
plotGraph <- function (fileName, w, h){
        png(fileName, width=w, height=h) ## save as png file in current wd
        hist(as.numeric(DT$Global_active_power), main ="Global Active Power",
             col="red", xlab ="Global Active Power (Kilowatts", ylab= "Frequency")
        dev.off()   
}

plotGraph(fileName="plot1.png", 480,480)
