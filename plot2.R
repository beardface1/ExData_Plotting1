df <- read.delim("household_power_consumption.txt", sep = ";", colClasses = "character")        ##read in dataset

df[,1] <- as.Date(df[,1], format = "%d/%m/%Y")  ##set 'date'into date format

dfg <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]   ##subset the data

x <- as.POSIXct(paste(dfg$Date, dfg$Time), format="%F %H:%M:%S")   ##combine columns 1 and 2 to make datetime

dfg[,1] <- x    ##make column 1 datetime

rm(x)   ##remove x

names(dfg)[names(dfg) == 'Date'] <- 'datetime'   ##rename column 1

dfg[,3] <- suppressWarnings(as.numeric(dfg[,3]))
dfg[,4] <- suppressWarnings(as.numeric(dfg[,4]))
dfg[,5] <- suppressWarnings(as.numeric(dfg[,5]))
dfg[,6] <- suppressWarnings(as.numeric(dfg[,6]))
dfg[,7] <- suppressWarnings(as.numeric(dfg[,7]))
dfg[,8] <- suppressWarnings(as.numeric(dfg[,8]))
dfg[,9] <- suppressWarnings(as.numeric(dfg[,9]))  ##make other variables numeric

png(file = "plot2.png", width = 480, height = 480)

plot(dfg$datetime, dfg$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()  ##make plot png
