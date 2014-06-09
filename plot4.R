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

data1$Sub_metering_1<-as.numeric(as.character(data1$Sub_metering_1))
#change into numeric. The same comment goes for the next two lines.
data1$Sub_metering_2<-as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3<-as.numeric(as.character(data1$Sub_metering_3))


par(mfrow=c(2,2))# create an array of subplots

plot(DateTime1,data1$Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)",cex=0.25)
#first subplot
plot(DateTime1,data1$Voltage,"l",xlab="datetime",ylab="Voltage",cex=0.25)
#second subplot
plot(DateTime1,data1$Sub_metering_1,type="l", ylim=c(0,38), xlab="",ylab="Energy Sub Metering",cex=0.25)
#third subplot
lines(DateTime1,data1$Sub_metering_2,col="red")#add lines to the third subplot
lines(DateTime1,data1$Sub_metering_3,col="blue")
legend(x='topright',legend=c('Sub_Metering_1','Sub_Metering_2','Sub_Metering_3'),col=c("black","red","blue"), cex=0.17, lty=c(1,1,1))
#add a legend to the third subplot
plot(DateTime1,data1$Global_reactive_power,"l",xlab="datetime",ylab="Global_reactive_power",cex=0.25)
#fourth subplot
dev.copy(png,file="plot4.png")
dev.off()
