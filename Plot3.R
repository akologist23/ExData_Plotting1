URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "./householdpowerconsumption.zip")
list.files() 
unzip("householdpowerconsumption.zip")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")
twodays <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007" ), ]

twodays$Date <- as.Date(twodays$Date, format="%d/%m/%Y")
twodays$Time <- paste(twodays$Date, twodays$Time)
twodays$Time <- strptime(twodays$Time, format="%Y-%m-%d %H:%M:%S")

#Plot 3
png("plot3.png",width=480,height=480)
with(twodays, plot(twodays$Time,twodays$Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(twodays, points(twodays$Time,twodays$Sub_metering_1,col="black",type="solid"))
with(twodays, points(twodays$Time,twodays$Sub_metering_2,col="red",type="solid"))
with(twodays, points(twodays$Time,twodays$Sub_metering_3,col="blue",type="solid"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()