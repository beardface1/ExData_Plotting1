df <- read.delim("household_power_consumption.txt", sep = ";", colClasses = "character")        ##read in dataset

df[,1] <- as.Date(df[,1], format = "%d/%m/%Y")  ##set 'date'into date format

dfg <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]   ##subset the data

y <- weekdays(as.Date(dfg[,1],'%d-%m-%Y'))

x <- as.POSIXct(paste(dfg$Date, dfg$Time), format="%F %H:%M:%S")   

dfg[,1] <- x    ##make column 1 DateTIme

dfg[,2] <- y    ##make column 2 weekdays

rm(x)   ##remove x

rm(y)   ##remove y

names(dfg)[names(dfg) == 'Date'] <- 'DateTime'   ##rename column 1

names(dfg)[names(dfg) == 'Time'] <- 'Weekday'   ##rename column 2

dfg[,3] <- suppressWarnings(as.numeric(dfg[,3]))
dfg[,4] <- suppressWarnings(as.numeric(dfg[,4]))
dfg[,5] <- suppressWarnings(as.numeric(dfg[,5]))
dfg[,6] <- suppressWarnings(as.numeric(dfg[,6]))
dfg[,7] <- suppressWarnings(as.numeric(dfg[,7]))
dfg[,8] <- suppressWarnings(as.numeric(dfg[,8]))
dfg[,9] <- suppressWarnings(as.numeric(dfg[,9]))  ##make other variables numeric

plot(dfg$DateTime, dfg$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

png(file = "plot2.png", width = 480, height = 480)
with(dfg, plot(dfg$DateTime, dfg$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()  ##make plot png
