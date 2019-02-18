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
