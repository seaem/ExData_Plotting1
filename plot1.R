# download zip file  (for windows machine. curl not required)

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destination<-"file.zip"
download.file(url,destination)

#read table and subset data
table<-read.table(unz(destination,"file.txt"),sep=";",header=TRUE)
table$Date<-as.Date(table$Date,"%d/%m/%Y")
table<-subset(table,table$Date=="2007-02-01" | table$Date=="2007-02-02")

#first plot
table$Global_active_power<-as.numeric(as.character(table$Global_active_power))
hist(table$Global_active_power,col="red",main="Global Active Power",xlab ="Global Active Power (kilowatts)")

#save as png
dev.copy(png,file="plot1.png")
dev.off()
