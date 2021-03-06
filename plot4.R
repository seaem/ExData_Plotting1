#read table and subset data
table<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
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
par(mfrow=c(2,2))

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
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7)

#fourth plot
plot(datetime,global_reactive_power,type="n", xlab = "datetime", ylab="Global_reactive_power")
lines(datetime,global_reactive_power)


#png file
dev.copy(png,file="plot4.png")
dev.off()
