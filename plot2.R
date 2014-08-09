#The code below reads data from the Household Power
#Consumption file and generates a chart as per
#instructions from a Coursera project

data<-read.table("household_power_consumption.txt",
                 sep=";",na.strings="?",header=T,
                 as.is=TRUE)
datetime<-paste(data[,1],data[,2]," ")
datetime<-strptime(datetime,
                   format="%d/%m/%Y %H:%M:%S ")
data<-cbind(datetime,data)
chartdata<-data[(data[,1]>="2007-02-01")
                &(data[,1]<"2007-02-03"),]
png(filename="plot2.png",width = 480,
    height = 480)
plot(chartdata$datetime,
     chartdata$Global_active_power, 
     ylab="Global Active Power (kilowatts)",
     type="l",xlab="")
dev.off()