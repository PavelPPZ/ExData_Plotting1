## plot 1 - Global_active_power histogram

plot1 <- function() {
        
        library(dplyr)
        library(lubridate)
        
        fn <- "C:/Users/pavel/Documents/Data Science materials/Exploratory Data Analysis with R/Project 1/exdata_data_household_power_consumption/household_power_consumption.txt"
        df <- read.csv(fn, sep = ";")
        
        sel <- dmy(df$Date) == as.Date("2007-02-01") | dmy(df$Date) == as.Date("2007-02-02")
        df_sel <- subset(df, sel)
        
        df_sel$Global_active_power <- as.numeric(df_sel$Global_active_power)
        
        png("plot1.png")
        
        hist(df_sel$Global_active_power, col = "red", main = "", xlab = "", ylab = "")
        
        title(main = "Global Active Power")
        title(xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
        
        dev.off()
        
}