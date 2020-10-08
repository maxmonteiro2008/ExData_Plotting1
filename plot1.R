#############################################################################
#Author:Maxwell
#Date:10/06/2020
# File: plot1.R
#############################################################################

#Installing packages
install.packages("dplyr")
library(dplyr)

## Downloading the Original DataSet Electric power consumption 

target<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(target,destfile="./Electric.zip",method="curl")


#checking directory structure and unzipping the data set
if(!file.exists("./data")){
  dir.create("./data")
  unzip(zipfile = "./Electric.zip",exdir ="./data" )
}else{unzip(zipfile = "./Electric.zip",exdir ="./data" )}


###### mapping the desired files####################
####################################################

file<-file.path("./data","household_power_consumption.txt")

###### Loading the data####################
####################################################
data<- read.table(file,sep=";",header = TRUE)

## Formatting Date from factor to string, then to Date
data[,1]<-as.character(data[,1])  # factor Date to String Date
data[,1]<-as.Date(data[,1],format="%d/%m/%Y") # String Date to  Date

## Subseting the data period:from 2007-02-01 to 2007-02-02

data<-subset(data,(Date=="2007-02-01"|Date== "2007-02-02"))

##Formating columns from factor to numeric

for (i in 3:9){
  data[,i]<-as.character(data[,i])
  data[,i]<-as.numeric(data[,i])
}


###### Plotting the Plot1.png####################
####################################################
png(filename = "./data/plot1.png",480,480) # opening the png device

# plotting the histogram in red
hist(data$Global_active_power,col = "red",main = "Global Active Power",xlab ="Global Active Power(Kilowatts)" )

dev.off() # closing the png device