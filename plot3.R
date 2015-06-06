#read table and subset data
table<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
table$Date<-as.Date(table$Date,"%d/%m/%Y")
table<-subset(table,table$Date=="2007-02-01" | table$Date=="2007-02-02")

#add datetime vector
datetime<-paste(table$Date,table$Time)
datetime<-strptime(datetime,"%Y-%m-%d %H:%M:%S")

#plot 3
submetering1<-as.numeric(as.character(table$Sub_metering_1))
submetering2<-as.numeric(as.character(table$Sub_metering_2))
submetering3<-as.numeric(as.character(table$Sub_metering_3))

plot(datetime,submetering1,type="n", xlab = "", ylab="Energy sub metering")

lines(datetime,submetering1)
lines(datetime,submetering2,col="red")
lines(datetime,submetering3,col="blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),cex=0.5)

#png file
dev.copy(png,file="plot3.png")
dev.off()
