#load and prepare data
dati<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
dati$Date<-as.Date(dati$Date, format = "%d/%m/%Y")
dati_subset<-dati[dati$Date<=as.Date("2007-02-02")&dati$Date>=as.Date("2007-02-01"),]
dati_fin<-dati_subset
dati_fin$Global_active_power<-as.numeric(as.character(dati_fin$Global_active_power))
dati_fin <- transform(dati_fin, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#plot
png(filename="plot2.png", width=480, height=480) 
par(mar=c(6,4,4,2)) 
plot(dati_fin$timestamp,dati_fin$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()