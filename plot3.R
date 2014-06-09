# Please use this to set appropriate working directory if required
#setwd('c:/Users/Documents/R/Coursera/Explorator Data Analysis JHU/Project 1')

data<-read.table('household_power_consumption.txt',header=TRUE,sep=';')
#read the data

data1<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
#Get the subset data of interest

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
plot(DateTime1,data1$Sub_metering_1,type="l", ylim=c(0,38), xlab="",ylab="Energy Sub Metering")
#generate the plot
lines(DateTime1,data1$Sub_metering_2,col="red") # add the necessary lines
lines(DateTime1,data1$Sub_metering_3,col="blue")
legend(x='topright',legend=c('Sub_Metering_1','Sub_Metering_2','Sub_Metering_3'),col=c("black","red","blue"), cex=0.75, lty=c(1,1,1))
#add the legend
dev.copy(png,file="plot3.png") #copy the plot to png file
dev.off() #safely close the device


