#load and prepare data
dati<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
dati$Date<-as.Date(dati$Date, format = "%d/%m/%Y")
dati_subset<-dati[dati$Date<=as.Date("2007-02-02")&dati$Date>=as.Date("2007-02-01"),]
dati_fin<-dati_subset
dati_fin$Global_active_power<-as.numeric(as.character(dati_fin$Global_active_power))
#plot
png(filename="plot1.png", width=480, height=480) 
par(mar=c(6,4,4,2)) 
hist(dati_fin$Global_active_power, col="red", ylab="Frequency",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()