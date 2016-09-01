CreatePlot2 <- function(){
  ## Check path existence
  if(!file.exists("./R scripts")){
    dir.create("./R scripts")
  }
  
  ## Unzip the files
  unzip(zipfile = "./R scripts/household_power_consumption.zip",exdir = "./R scripts")
  
  ## Loading the data set from 1/2/2007 - 2/2/2007
  household_power_consumption <- read.table("./R scripts/household_power_consumption.txt", header=TRUE, sep=";", skip=66637, nrows=2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings = "?")
  
  ## Create a new variable called Timestamp which will combine the both the Date and Time variables
  household_power_consumption$Timestamp<-strptime(paste(household_power_consumption$Date,household_power_consumption$Time),"%d/%m/%Y %H:%M:%S")
  
  ## plot the x (Timestamp) and y (Global Active Power)
  plot(household_power_consumption$Timestamp,household_power_consumption$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  ## saving the plot in png file
  dev.copy(png,"Plot2.png",width=480,height=480)
  dev.off()
  
}
