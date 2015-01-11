#load and prepare data
dati<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
dati$Date<-as.Date(dati$Date, format = "%d/%m/%Y")
dati_subset<-dati[dati$Date<=as.Date("2007-02-02")&dati$Date>=as.Date("2007-02-01"),]
dati_fin<-dati_subset
dati_fin$Sub_metering_1<-as.numeric(as.character(dati_fin$Sub_metering_1))
dati_fin$Sub_metering_2<-as.numeric(as.character(dati_fin$Sub_metering_2))
dati_fin$Sub_metering_3<-as.numeric(as.character(dati_fin$Sub_metering_3))
dati_fin <- transform(dati_fin, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#plot
png(filename="plot3.png", width=480, height=480) 
par(mar=c(6,4,4,2)) 
plot(dati_fin$timestamp,dati_fin$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
lines(dati_fin$timestamp,dati_fin$Sub_metering_2,col="red")
lines(dati_fin$timestamp,dati_fin$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off()