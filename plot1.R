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

## create plot 1:

png(filename = "plot1.png",width = 480, height = 480, units = "px",bg = "white")
hist(use$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",cex.lab=1)
dev.off()
