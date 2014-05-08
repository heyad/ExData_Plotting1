##define the location of the url file
urlFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## check if the file is not already downloaded into the current working directory
if (!file.exists("dataset.txt")){
        ## download the dataeset  
        ## store it in a file called dataset.txt
        download.file(urlFile, destfile ="dataset.zip")
} else {
        print("File dataset.txt is already downloaded")
}

## load data into R 
householdDataset <- "household_power_consumption.txt"
DT = read.table(householdDataset, header= TRUE, sep=";", stringsAsFactors=FALSE)

## merge the date and time columns into Date/Time class
datetime<- strptime(paste(DT[,1],DT[,2]), "%d/%m/%Y %H:%M:%S")
## add a new column to the data table 
## and call it dateAndTime
DT1 <- cbind(DT, datetime=strptime(paste(DT[,1],DT[,2]), "%d/%m/%Y %H:%M:%S"))
# 
# datetime <- paste(DT[1,1],DT[1,2])
# datetime<- strptime(datetime, "%d/%m/%Y %H:%M:%S")
# datetime
##############################

## file name (should be already in the working directory)
householdDataset <- "household_power_consumption.txt"
## nrows = -1 implies that all rows will be read
## better appraoch to read only rows of interest for this assignment
DT <- fread(householdDataset, sep=";", nrows=10,header=TRUE, stringsAsFactors=FALSE)
## merge the date and time columns into Date/Time class
datetime<- strptime(paste(DT[,1],DT[,2]), "%d/%m/%Y %H:%M:%S")
## add a new column to the data table 
## and call it dateAndTime
DT[,dateTime:=datetime]