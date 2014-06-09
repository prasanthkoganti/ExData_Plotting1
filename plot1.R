# Please use this to set appropriate working directory if required
#setwd('c:/Users/Documents/R/Coursera/Explorator Data Analysis JHU/Project 1')

data<-read.table('household_power_consumption.txt',header=TRUE,sep=';')
#read the data

data1<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
#Get the subset data of interest

data1$Global_active_power<-as.character(data1$Global_active_power)
#converting the activepower data to character so as to replace ? with NA
data1$Global_active_power[data1$Global_active_power=="?"]<-"NA"
#replacing all the ? marks with NA's
data1$Global_active_power<-as.numeric(data1$Global_active_power)
#Getting the global_active_power as numeric
hist(data1$Global_active_power,xlab='Global Active Power (kilowatts)',ylab=
       'Frequency',main="Global Active Power",col='red')
#draw the histogram

dev.copy(png,file="plot1.png")
#copy the plot to png file
dev.off()
#safely close the device