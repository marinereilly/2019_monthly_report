#####libraries#####
library(dplyr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(hablar)

#####load water level hobo data#####
#different this year in that we will be 
#assigning stations as we upload data because we have hobos out at morethan just the weir
wl_head<-c("date", "time", "kPA", "temp", "barokPA", "depth", "datetime")

wl1 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_01_18_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl1<-wl1[-c(1:2),-1] #removes the first two rows and the first column
wl1$datetime<-paste0(wl1$V2, " ", wl1$V3) #combines the date column and the time column so that it is the same as the other data.  Will probably be separated again during analysis
colnames(wl1)<-wl_head
wl1$datetime<-mdy_hms(wl1$datetime)
wl1<-wl1 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl1$station<-"weir"

wl2 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_01_28_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl2<-wl2[-c(1:2),-1] #removes the first two rows and the first column
wl2$datetime<-paste0(wl2$V2, " ", wl2$V3) #combines the date column and the time column so that it is the same as the other data.  Will probably be separated again during analysis
colnames(wl2)<-wl_head
wl2$datetime<-mdy_hms(wl2$datetime)
wl2<-wl2 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl2$station<-"weir"

wl3 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/mid_2019_01_28_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl3<-wl3[-c(1:2),-1] #removes the first two rows and the first column
wl3$datetime<-paste0(wl3$V2, " ", wl3$V3) #combines the date column and the time column so that it is the same as the other data.  Will probably be separated again during analysis
colnames(wl3)<-wl_head
wl3$datetime<-mdy_hms(wl3$datetime)
wl3<-wl3 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl3$station<-"mid"

water_level<-wl1 %>% 
  full_join(., wl2) %>% 
  full_join(., wl3)

saveRDS(water_level, "water_level2019.rds")

rm(wl1,wl2,wl3)

###Load New data as follows###
#load new data as copied from above

#join data to alredy joined files
wl<-readRDS("water_level2019.rds")

water_level<-wl %>% 
  full_join(., INSERT NEW FILES HERE)

saveRDS(water_level, "water_level2019.rds")
rm(INSERT NEW FILES HERE)

#####load salinity hobo data#####
#different this year in that we will be 
#assigning stations as we upload data because we have hobos out at morethan just the weir
sal_head <- c("date", "time", "conductivity", "temperature", "sp_cond", "salinity", "datetime")

sal1 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_01_18_sal.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
sal1<-sal1[-c(1:2),-c(1,8)] #removes the first two rows and the first column
sal1$datetime<-paste0(sal1$V2, " ", sal1$V3) #combines the date column and the time column so that it is the same as the other data.  Will probably be separated again during analysis
colnames(sal1)<-sal_head
sal1$datetime<-mdy_hms(sal1$datetime)
sal1<-sal1 %>% 
  convert(num("conductivity", "temperature", "sp_cond", "salinity"))
sal1$station<-"weir"

sal2 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_01_28_sal.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
sal2<-sal2[-c(1:2),-1] #removes the first two rows and the first column
sal2$datetime<-paste0(sal2$V2, " ", sal2$V3) #combines the date column and the time column so that it is the same as the other data.  Will probably be separated again during analysis
colnames(sal2)<-sal_head
sal2$datetime<-mdy_hms(sal2$datetime)
sal2<-sal2 %>% 
  convert(num("conductivity", "temperature", "sp_cond", "salinity"))
sal2$station<-"weir"

sal3 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/mid_2019_01_28_sal.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
sal3<-sal3[-c(1:2),-1] #removes the first two rows and the first column
sal3$datetime<-paste0(sal3$V2, " ", sal3$V3) #combines the date column and the time column so that it is the same as the other data.  Will probably be separated again during analysis
colnames(sal3)<-sal_head
sal3$datetime<-mdy_hms(sal3$datetime)
sal3<-sal3 %>% 
  convert(num("conductivity", "temperature", "sp_cond", "salinity"))
sal3$station<-"mid"

hobo_salinity<-sal1 %>% 
  full_join(., sal2) %>% 
  full_join(., sal3)

saveRDS(hobo_salinity, "hobo_salinity_2019.rds")
rm(sal1,sal2,sal3)
###Load New data as follows###
#load new data using the code above

#join data to alredy joined files
salinity<-readRDS("hobo_salinity_2019.rds")

hobo_salinity<-salinity %>% 
  full_join(., INSERT NEW FILES HERE)

saveRDS(hobo_salinity, "hobo_salinity_2019.rds")
rm(INSERT NEW FILES HERE)