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

data1$Date<-as.Date(data1$Date,format="%d/%m/%Y")
#convert the date to appropriate format
data1$Time<-as.character(data1$Time)
#change the time to character format so it can be combined with date strings and 
#finally converted to the time format
DateTime<-paste(data1$Time,data1$Date)
#combine the date and time strings together
DateTime1<-strptime(DateTime,format="%H:%M:%S %Y-%m-%d")
#date and time strings together are converted to appropriate time format
plot(DateTime1,data1$Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)")
#draw the plot
dev.copy(png,file="plot2.png")
#copy the plot to png file
dev.off()
#safely close the device
