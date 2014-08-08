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

## date time
data$datetime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

## change the class
for(i in 3:8){
    data[,i]<-as.numeric(as.character(data[,i]))
}

## plot
png("plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()