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


hpal1<-c("north"="#54086B", "mid" = "#FF0BAC", "south"="#00BEC5", "weir"="#050833")
hpal2<-c("north"="#FF5C4D", "mid" = "#FF9636", "south"="#FFCD58", "weir"="#DAD870")
hpal3<-c("north"="#FF8370", "mid" = "#00B1B0", "south"="#FEC84D", "weir"="#E42256")
hpal4<-c("north"="#0A4158", "mid" = "#4B8378", "south"="#FF9636", "weir"="#E4D7D0")
hpal5<-c("north"="#FFCE13", "mid" = "#88070B", "south"="#F65156", "weir"="#009292")
hpal6<-c("north"="#F6A21E", "mid" = "#E55B13", "south"="#104210", "weir"="#7A871E")
hpal7<-c("north"="#FF5765", "mid" = "#FFDB15", "south"="#8A6FDF", "weir"="#A8E10C")
hpal8<-c("north"="#E69F00", "mid" = "#F0E442", "south"="#009E73", "weir"="#56B4E9")