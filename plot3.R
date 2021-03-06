#############################################################################
#Author:Maxwell
#Date:10/07/2020
# File: plot3.R
#############################################################################

#Installing packages
install.packages("dplyr")
library(dplyr)

#Setting English as default config
Sys.setlocale("LC_ALL","English")
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
data[,1]<-as.Date(data[,1],format="%d/%m/%Y") 




## Subseting the data period:from 2007-02-01 to 2007-02-02

data<-subset(data,(Date=="2007-02-01"|Date== "2007-02-02"))

##Formatting columns from factor to numeric

for (i in 3:9){
  data[,i]<-as.numeric(as.character(data[,i]))
}

## Creating a new column Join_time, combining Date and Time 

data$"Join_time"<-strptime(paste(data$Date,data$Time), "%Y-%m-%d %T", tz ="GMT")

###### Plotting the Plot3.png####################
####################################################
png(filename = "./data/plot3.png",480,480) # opening the png device

# plotting the base graph
with(data,plot(data$Join_time,data$Sub_metering_1, type = "n",ylab = "Energy sub metering",xlab = ""))

# plotting the Sub_metering_1 line
with(data,plot(data$Join_time,data$Sub_metering_1, type = "l",ylab = "Energy sub metering",xlab = ""))
# plotting the Sub_metering_2 line
with(data,points(data$Join_time,data$Sub_metering_2,col="red", type = "l",ylab = "Energy sub metering",xlab = ""))
# plotting the Sub_metering_3 line
with(data,points(data$Join_time,data$Sub_metering_3,col="blue", type = "l",ylab = "Energy sub metering",xlab = ""))

#legend
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# closing the png device
dev.off() 