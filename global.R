library(data.table); library(lubridate)

crimeDf <- read.csv(url("https://data.cityofchicago.org/api/views/vwwp-7yr9/rows.csv?accessType=DOWNLOAD&bom=true&format=true"))

crimeDf$Date <- as.Date(crimeDf$Date, '%m/%d/%Y %H:%M:%S')