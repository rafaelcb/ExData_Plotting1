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

png(filename="plot4.png",width = 480,
    height = 480)

par(mfrow=c(2,2),cex.axis=0.9,cex.lab=0.9)
# Chart 1

plot(chartdata$datetime,
     chartdata$Global_active_power, 
     ylab="Global Active Power",
     type="l",xlab="")

# Chart 2

plot(chartdata$datetime,
     chartdata$Voltage, 
     ylab="Voltage",
     type="l",xlab="datetime")

# Chart 3

plot(chartdata$datetime,
     chartdata$Sub_metering_1,
     ylab="Energy sub metering",xlab="",
     type="l")
points(chartdata$datetime,
       chartdata$Sub_metering_2,type="l",
       col="brown")
points(chartdata$datetime,
       chartdata$Sub_metering_3,type="l",
       col="blue")
legend("topright",legend=c("Sub_metering_1",
                           "Sub_metering_2",
                           "Sub_metering_3"),
       lty=c(1,1,1), bty="n", cex=0.9,
       col=c("black","brown","blue"))

# Chart 4

plot(chartdata$datetime,
     chartdata$Global_reactive_power, 
     ylab="Global_reactive_power",
     type="l",xlab="datetime")

dev.off()