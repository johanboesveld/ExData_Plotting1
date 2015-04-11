## Exploratory Data Analysis - Project 1 


## Dataset used in this project is downloaded from:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## and unzipped in the R Working directory


## Read the dataset into a dataframe with following parameters:
## seperator=";", NA's are "?", do not convert strings to factors

data <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?",stringsAsFactors=F)

## convert dataframe into datatable for faster and easier handling (not necesary, just handy)

library(data.table)                                         ## use data.table package
dt <- data.table(data)                                      ## convert to data.table
use <- dt[Date=="1/2/2007"|Date=="2/2/2007"]                ## subset the 2 days needed for the plots
usenew <- use[,DateTime:=paste(Date, Time, sep='-')]        ## add a new column with DateTime (character)

## general settings for plots

Sys.setlocale("LC_TIME","English")      ## set locale to english (to show weekdays in English)
par(cex=1)                              ## set text-size in plots (default)


## create plot 4:

png(filename = "plot4.png",width = 480, height = 480, units = "px",bg = "white")
par(mfrow=c(2,2))                       ## multipleplots: 2 colums, 2 rows 
## graph 1
plot(strptime(usenew$DateTime, format="%d/%m/%Y-%H:%M:%S"),usenew$Global_active_power,type="l",xlab="",yla="Global Active Power")
## graph 2
plot(strptime(usenew$DateTime, format="%d/%m/%Y-%H:%M:%S"),usenew$Voltage,type="l",xlab="datetime",yla="Voltage")
## graph 3
plot(strptime(usenew$DateTime, format="%d/%m/%Y-%H:%M:%S"),usenew$Sub_metering_1,type="n",xlab="",yla="Energy sub metering")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=1, lty=c(1),bty="n")
points(strptime(usenew$DateTime, format="%d/%m/%Y-%H:%M:%S"),usenew$Sub_metering_1,type="l",col="black")
points(strptime(usenew$DateTime, format="%d/%m/%Y-%H:%M:%S"),usenew$Sub_metering_2,type="l",col="red")
points(strptime(usenew$DateTime, format="%d/%m/%Y-%H:%M:%S"),usenew$Sub_metering_3,type="l",col="blue")
## graph 4
plot(strptime(usenew$DateTime, format="%d/%m/%Y-%H:%M:%S"),usenew$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
