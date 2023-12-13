## plot 2 Global_active_power vs time

plot2 <- function() {
        
        library(dplyr)
        library(lubridate)
        
        fn <- "C:/Users/pavel/Documents/Data Science materials/Exploratory Data Analysis with R/Project 1/exdata_data_household_power_consumption/household_power_consumption.txt"
        df <- read.csv(fn, sep = ";")
        
        sel <- dmy(df$Date) == as.Date("2007-02-01") | dmy(df$Date) == as.Date("2007-02-02")
        df_sel <- subset(df, sel)
        
        df_sel$Global_active_power <- as.numeric(df_sel$Global_active_power)
        df_sel <- mutate(df_sel, Full_time = strptime(paste(df_sel$Date, df_sel$Time),format = "%d/%m/%Y %H:%M:%S", tz = ""))
        
        png("plot2.png")
       
        plot(df_sel$Full_time,df_sel$Global_active_power, type = "l", xaxt ="n", xlab="", ylab="")
        
        axis.POSIXct(1,at = as.Date("2007-02-01"), labels = "Thu")
        axis.POSIXct(1,at = as.Date("2007-02-02"), labels = "Fri")
        axis.POSIXct(1,at = as.Date("2007-02-03"), labels = "Sat")
        
        title(ylab = "Global Active Power (kilowatts)")
        
        dev.off()
        
}