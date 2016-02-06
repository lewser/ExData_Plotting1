## Load and transform dataframe
epc <- read.table("household_power_consumption.txt", header=T, sep=";") ## loads complete table into memory  -- assumes that the "household_power_consumption.txt" file is in the current working directory
epc$Date <- as.Date(as.character(epc$Date), "%d/%m/%Y") ## converts the Date column to a Date data type (from factor via character)
epcf <- subset(epc, epc$Date == "2007-02-01" | epc$Date == "2007-02-02") ## filters the rows to only include data from February 1st and 2nd, 2007
epcf$Global_active_power <- as.numeric(as.character(epcf$Global_active_power)) ## converts the Global_active_power column to a Numeric data type (from factor via character)
epcf$Weekday <- weekdays(epcf$Date) ## adds a new column with the weekday based on the Date column
tmp <- paste(as.character(epcf$Date), as.character(epcf$Time))  ## concatenates the date time into a single character value
epcf$DateTime <- strptime(tmp, "%Y-%m-%d %H:%M:%S") ## creates a new column with the datetime value in the POSIXlt data format
epcf$Sub_metering_1 <- as.numeric(as.character(epcf$Sub_metering_1)) ## converts the Sub_metering_1 column to a Numeric data type (from factor via character)
epcf$Sub_metering_2 <- as.numeric(as.character(epcf$Sub_metering_2)) ## converts the Sub_metering_2 column to a Numeric data type (from factor via character)
epcf$Sub_metering_3 <- as.numeric(as.character(epcf$Sub_metering_3)) ## converts the Sub_metering_3 column to a Numeric data type (from factor via character)

## Generate PNG Plot #2
png(file="plot2.png")
plot(epcf$DateTime, epcf$Global_active_power, type = "o", pch=".", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()