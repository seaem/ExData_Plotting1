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

#second plot
global_active_power<-as.numeric(as.character(table$Global_active_power))

plot(datetime,global_active_power,type="n", xlab = "", ylab="Global Active Power (kilowatts)")

lines(datetime,global_active_power)

#png file

dev.copy(png,file="plot2.png")
dev.off()
