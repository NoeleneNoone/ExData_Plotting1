##### download and unzip data
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile = "temp.zip")	## download zip file
unzip("temp.zip") 				## unzip files
file.remove("temp.zip") 			## tidy up by removing the zip file
## Read data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",
                   na.strings="?",stringsAsFactors = FALSE)
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
graphdata<-subset(data,datetime>="2007-02-01"& datetime<"2007-02-03")
############ combo graph #########################
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
with(graphdata, {
  plot(datetime,Global_active_power,ylab="Global Active Power",xlab="",type="l")
  plot(datetime,Voltage,type="l")
  {
    plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
    lines(datetime,Sub_metering_2,col="Red")
    lines(datetime,Sub_metering_3,col="Blue")
  }
  plot(datetime,Global_reactive_power,type="l")
})
dev.off()