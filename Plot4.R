URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "./householdpowerconsumption.zip")
list.files() 
unzip("householdpowerconsumption.zip")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")
twodays <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007" ), ]

twodays$Date <- as.Date(twodays$Date, format="%d/%m/%Y")
twodays$Time <- paste(twodays$Date, twodays$Time)
twodays$Time <- strptime(twodays$Time, format="%Y-%m-%d %H:%M:%S")

#Plot 4
png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))
plot(twodays$Time,twodays$Global_active_power, type="solid",ylab="Global Active Power (kilowatts)", xlab="")
with(twodays, plot(twodays$Time,twodays$Voltage,type="solid",ylab="Voltage",xlab="datetime"))
with(twodays, plot(twodays$Time,twodays$Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(twodays, points(twodays$Time,twodays$Sub_metering_1,col="black",type="solid"))
with(twodays, points(twodays$Time,twodays$Sub_metering_2,col="red",type="solid"))
with(twodays, points(twodays$Time,twodays$Sub_metering_3,col="blue",type="solid"))
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(twodays, plot(twodays$Time,twodays$Global_reactive_power,type="solid",ylab="Global_reactive_power",xlab="datetime"))
dev.off()