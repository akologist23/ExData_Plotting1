URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "./householdpowerconsumption.zip")
list.files() 
unzip("householdpowerconsumption.zip")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings="?")
twodays <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007" ), ]

twodays$Date <- as.Date(twodays$Date, format="%d/%m/%Y")
twodays$Time <- paste(twodays$Date, twodays$Time)
twodays$Time <- strptime(twodays$Time, format="%Y-%m-%d %H:%M:%S")

#Plot 2
png("plot2.png",width=480,height=480)
plot(twodays$Time,twodays$Global_active_power, type="solid",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()