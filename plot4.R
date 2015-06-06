# download zip file  (for windows machine. curl not required)

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination<-"file.zip"
download.file(url,destination)

#read table and subset data
table<-read.table(unz(destination,"file.txt"),sep=";",header=TRUE)
table$Date<-as.Date(table$Date,"%d/%m/%Y")
table<-subset(table,table$Date=="2007-02-01" | table$Date=="2007-02-02")

#add datetime vector
datetime<-paste(table$Date,table$Time)
datetime<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

#numeric vectors
global_active_power<-as.numeric(as.character(table$Global_active_power))

submetering1<-as.numeric(as.character(table$Sub_metering_1))
submetering2<-as.numeric(as.character(table$Sub_metering_2))
submetering3<-as.numeric(as.character(table$Sub_metering_3))

voltage<-as.numeric(as.character(table$Voltage))
global_reactive_power<-as.numeric(as.character(table$Global_reactive_power))

#plot 4

#first plot
plot(datetime,global_active_power,type="n", xlab = "", ylab="Global Active Power (kilowatts)")
lines(datetime,global_active_power)

#second plot
plot(datetime,voltage,type="n", xlab = "datetime", ylab="Voltage")
lines(datetime,voltage)

#third plot
plot(datetime,submetering1,type="n", xlab = "", ylab="Energy sub metering")
lines(datetime,submetering1)
lines(datetime,submetering2,col="red")
lines(datetime,submetering3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),cex=0.5)

#fourth plot
plot(datetime,global_reactive_power,type="n", xlab = "datetime", ylab="Global_reactive_power")
lines(datetime,global_reactive_power)


#png file
dev.copy(png,file="plot4.png")
dev.off()
