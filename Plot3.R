## plot 3 3 Sub_metering graphs vs time

plot3 <- function() {
        
        library(dplyr)
        library(lubridate)
        
        fn <- "C:/Users/pavel/Documents/Data Science materials/Exploratory Data Analysis with R/Project 1/exdata_data_household_power_consumption/household_power_consumption.txt"
        df <- read.csv(fn, sep = ";")
        
        sel <- dmy(df$Date) == as.Date("2007-02-01") | dmy(df$Date) == as.Date("2007-02-02")
        df_sel <- subset(df, sel)
        
        df_sel$Sub_metering_1 <- as.numeric(df_sel$Sub_metering_1)
        df_sel$Sub_metering_2 <- as.numeric(df_sel$Sub_metering_2)
        df_sel$Sub_metering_3 <- as.numeric(df_sel$Sub_metering_3)
        df_sel <- mutate(df_sel, Full_time = strptime(paste(df_sel$Date, df_sel$Time),format = "%d/%m/%Y %H:%M:%S", tz = ""))
        
        png("plot3.png")
       
        plot(df_sel$Full_time,df_sel$Sub_metering_1, type = "l", xaxt ="n", xlab="", ylab="")
        points(df_sel$Full_time,df_sel$Sub_metering_2, type = "l", col = "red")
        points(df_sel$Full_time,df_sel$Sub_metering_3, type = "l", col = "blue")
        
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1),col = c("black", "red", "blue"))
        
        axis.POSIXct(1,at = as.Date("2007-02-01"), labels = "Thu")
        axis.POSIXct(1,at = as.Date("2007-02-02"), labels = "Fri")
        axis.POSIXct(1,at = as.Date("2007-02-03"), labels = "Sat")
        
        title(ylab = "Energy sub metering")
        
        dev.off()
        
}