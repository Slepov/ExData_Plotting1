## check
if(!file.exists("household_power_consumption.txt")){
    fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile="household_power_consumption.zip", method="auto" )
    unzip("household_power_consumption.zip")
}

## read the txt file
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## subset the dates 2007-02-01 and 2007-02-02
data<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007",]

## change the class
data[,1]<-as.Date(data[,1],"%d/%m/%Y")

for(i in 3:8){
    data[,i]<-as.numeric(as.character(data[,i]))
}

## plot
png("plot3.png")
plot(data$Sub_metering_1, type="l", ylab="Energy sub metering", xaxt="n", xlab="")
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend("topright", legend = names(data)[7:9],lty=c(1,1), col=c("black", "blue", "red"))
axis(1, at=x<-c(0,1440,2880), labels=y<-c("Thu","Fri", "Sat"))
dev.off()