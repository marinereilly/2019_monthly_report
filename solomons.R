library(dplyr)
library(ggplot2)
library(lubridate)

theme_hoboplot<-function(){
  theme(plot.subtitle = element_text(vjust = 1), 
        plot.caption = element_text(vjust = 1), 
        axis.line = element_line(size = 0.7), 
        axis.ticks = element_line(size = 0.75), 
        panel.grid.major = element_line(colour = "gray86", 
                                        linetype = "dashed"), panel.grid.minor = element_line(colour = NA), 
        axis.title = element_text(size = 14), 
        axis.text = element_text(size = 12, colour = "black"), 
        axis.text.x = element_text(size = 12), 
        axis.text.y = element_text(size = 12), 
        plot.title = element_text(size = 16), 
        legend.text = element_text(size = 11), 
        legend.title = element_text(size = 12), 
        panel.background = element_rect(fill = NA), 
        plot.background = element_rect(colour = NA), 
        legend.key = element_rect(fill = NA), 
        legend.background = element_rect(fill = NA))
}

hpal7<-c("north"="#FF5765", "mid" = "#FFDB15", "south"="#8A6FDF", "weir"="#A8E10C")

salinity<-readRDS("hobo_salinity_2019.rds")

salinity$date<-date(salinity$datetime)
salinity$hour<-hour(salinity$datetime)
salinity$month<-month(salinity$datetime)
salinity$station<-as.factor(salinity$station)

b<-salinity %>% 
  filter(month==3) %>% 
  select(date, hour, temperature, salinity, station) %>% 
  group_by(date, hour, station) %>% 
  summarise_if(is.numeric, mean) %>% 
  mutate(datetime=ymd_hm(paste0(date, " ", hour, ":00"))) %>% 
  ggplot(., aes(x=datetime))+
  geom_line(aes(y=salinity, color = station), size =1.2)+
  theme_hoboplot()+
  scale_color_manual(values = hpal7, breaks=c("north", "mid", "south", "weir"), name="Station")+
  ggtitle("March Salinity - Hourly means")+
  scale_x_datetime(limits=c(as.POSIXct("2019-03-01 00:00:00"),as.POSIXct("2019-03-08 00:00:00")))+
  xlab("Date")+ylab("Salinity (ppt)")+ 
  guides(colour = guide_legend(override.aes = list(size=2.5)))
b

solomons<-read.csv(file = "soloms_wl_2019_03_01-08.csv")
solomons$datetime<-paste0(solomons$Date, " ", solomons$Time..GMT.)
solomons$datetime<-ymd_hm(solomons$datetime)

b+geom_line(data=solomons, aes(x=datetime, y=Verified..ft.), color="navy", size=1)

