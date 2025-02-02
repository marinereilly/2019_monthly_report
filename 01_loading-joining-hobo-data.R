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
wl2 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_10_21_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
View(wl2)
wl2<-wl2[-c(1:2),-1] #removes the first two rows and the first column
 #combines the date column and the time column so that it is the same as the other data.  Will probably be separated again during analysis
colnames(wl2)<-c("datetime","kPA","temp","barokPA","depth")
wl2$datetime<-mdy_hms(wl2$datetime)
wl2<-wl2 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl2$station<-"weir"
wl2<-wl2 %>% 
  drop_na(depth)

wl6 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_11_19_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
View(wl6)
wl6<-wl6[-c(1:2),-1] #removes the first two rows and the first column
#combines the date column and the time column so that it is the same as the other data.  Will probably be separated again during analysis
colnames(wl6)<-c("datetime","kPA","temp","barokPA","depth")
wl6$datetime<-mdy_hms(wl6$datetime)
wl6<-wl6 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl6$station<-"weir"
wl6<-wl6 %>% 
  drop_na(depth)

wl3 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_12_12_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl3<-wl3[-c(1:2),-1] #removes the first two rows and the first column
colnames(wl3)<-c("datetime","kPA","temp","barokPA","depth")
wl3$datetime<-mdy_hms(wl3$datetime)
wl3<-wl3 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl3$station<-"weir"

wl4 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/north_2019_04_16_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl4<-wl4[-c(1:2),-1] #removes the first two rows and the first column
colnames(wl4)<-c("datetime","kPA","temp","barokPA","depth")
wl4$datetime<-mdy_hms(wl4$datetime)
wl4<-wl4 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl4$station<-"north"

wl5 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/south_2019_04_16_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl5<-wl5[-c(1:2),-1] #removes the first two rows and the first column
colnames(wl5)<-c("datetime","kPA","temp","barokPA","depth")
wl5$datetime<-mdy_hms(wl5$datetime)
wl5<-wl5 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl5$station<-"south"
wl5<-drop_na(wl5, depth)

wl7<-read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_03_13_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl7<-wl7[-c(1:2),-1] #removes the first two rows and the first column
colnames(wl7)<-c("datetime","kPA","temp","barokPA","depth")
wl7$datetime<-mdy_hms(wl7$datetime)
wl7<-wl7 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl7$station<-"weir"

wl8<-read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_05_07_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl8<-wl8[-c(1:2),-1] #removes the first two rows and the first column
colnames(wl8)<-c("datetime","kPA","temp","barokPA","depth")
wl8$datetime<-mdy_hms(wl8$datetime)
wl8<-wl8 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl8$station<-"weir"

wl9<-read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_05_24_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl9<-wl9[-c(1:2),-1] #removes the first two rows and the first column
colnames(wl9)<-c("datetime","kPA","temp","barokPA","depth")
wl9$datetime<-mdy_hms(wl9$datetime)
wl9<-wl9 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl9$station<-"weir"

wl10<-read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_06_20_wl.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
wl10<-wl10[-c(1:2),-1] #removes the first two rows and the first column
colnames(wl10)<-c("datetime","kPA","temp","barokPA","depth")
wl10$datetime<-mdy_hms(wl10$datetime)
wl10<-wl10 %>% 
  convert(num("kPA","temp","barokPA","depth"))
wl10$station<-"weir"



#####join data to alredy joined files#####
wl<-readRDS("water_level2019.rds")

water_level<-wl %>% 
  full_join(., wl2) %>% 
  full_join(., wl6) %>% 
  full_join(., wl3)

saveRDS(water_level, "water_level2019.rds")
rm(wl2,wl4, wl5,wl3, wl6, wl7, wl8, wl9, wl10,wl)

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
###Load New data as follows####
#load new data using the code above
sal2 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_10_21_sal.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
sal2<-sal2[-c(1:2),-1] #removes the first two rows and the first column
colnames(sal2)<-c("datetime","conductivity", "temperature", "sp_cond", "salinity")
sal2$datetime<-mdy_hms(sal2$datetime)
sal2<-sal2 %>% 
  convert(num("conductivity", "temperature", "sp_cond", "salinity"))
sal2$station<-"weir"

sal3 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_11_19_sal.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
sal3<-sal3[-c(1:2),-1] #removes the first two rows and the first column
colnames(sal3)<-c("datetime","conductivity", "temperature", "sp_cond", "salinity")
sal3$datetime<-mdy_hms(sal3$datetime)
sal3<-sal3 %>% 
  convert(num("conductivity", "temperature", "sp_cond", "salinity"))
sal3$station<-"weir"

sal4 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/weir_2019_12_12_sal.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
sal4<-sal4[-c(1:2),-1] #removes the first two rows and the first column
#sal4$datetime<-paste0(sal4$V2, " ", sal4$V3) #combines the date column and the time column so that it is the same as the other data.  Will probably be separated again during analysis
colnames(sal4)<-c("datetime","conductivity", "temperature", "sp_cond", "salinity")
sal4$datetime<-mdy_hms(sal4$datetime)
sal4<-sal4 %>% 
  convert(num("conductivity", "temperature", "sp_cond", "salinity"))
sal4$station<-"weir"

sal5 <- read.csv("H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/hobo/data/2019/csv_files/south_2019_04_16_sal.csv", header=FALSE, na.strings="", stringsAsFactors=FALSE)
sal5<-sal5[-c(1:2),-1] #removes the first two rows and the first column
sal5$datetime<-paste0(sal5$V2, " ",sal5$V3)
colnames(sal5)<-sal_head
sal5$datetime<-mdy_hms(sal5$datetime)
sal5<-sal5 %>% 
  convert(num("conductivity", "temperature", "sp_cond", "salinity"))
sal5$station<-"south"

#join data to alredy joined files
salinity<-readRDS("hobo_salinity_2019.rds")

hobo_salinity<-salinity %>% 
  full_join(., sal2) %>%
  full_join(., sal3) %>% 
  full_join(., sal4) #%>% 
  #full_join(., sal5)

saveRDS(hobo_salinity, "hobo_salinity_2019.rds")
rm(sal2, sal3, sal4, sal5,salinity)
