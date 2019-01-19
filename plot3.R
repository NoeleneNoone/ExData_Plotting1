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
############ multi line graph #########################
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(graphdata,{
  plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(datetime,Sub_metering_2,col="Red")
  lines(datetime,Sub_metering_3,col="Blue")
})
legend("topright",lty=1,  col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()