
cols = c("#89C61B","#FFC000","#7F7F7F","#0283E4","#C55A11","#FFC000","#7F7F7F","#000000")
niche_cols <- c("#89C64F", "#FFC000", "#7F7F7F", "#000000", "#548235", "#F9A01B", "#7030A0", "#002060")


#ggplot <- function(...) ggplot2::ggplot(...) + 
#  scale_fill_manual(values = cols) + 
#  scale_color_manual(values = cols)
  
#install.packages("extrafont")

#library(extrafont)
#font_import()

niche_style <- function(){
  theme(
    plot.title = element_text(family = "Arial",size=24, face="bold", color="#222222",margin = margin(10,0,10,0)),
    plot.subtitle = element_text(family = "Arial",size=18,margin = margin(0,0,10,0)),
    
    
    plot.background = element_rect(fill = "white"),
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_line(color="Grey85"),
    panel.grid.major.x = element_line(color="White"),  
    panel.background = element_rect(fill="White",color="White"),
    panel.spacing.y = unit(.75,"lines"),
    
    axis.title = element_text(family = "Arial",size=14,color="#222222",margin=margin(2,2,2,2)),
    axis.text = element_text(family = "Arial",size=12,color="#222222",margin=margin(7,2,2,2)),
    
    axis.ticks = element_blank(),
    axis.line = element_blank(),
    
    legend.position = "top",
    legend.text = element_text(family = "Arial",size=14, color="#222222",
                               margin = margin(0,7,0,2)),
    legend.title = element_blank(),
    legend.background = element_rect(fill="#ffffff"),
    legend.key = element_rect(fill = "#ffffff"),
    
    strip.background = element_rect(fill="grey85",color="Grey75"),
    strip.text = element_text(family = "Arial",size = 14,hjust = 0,color="black")
  ) 
}

######
#Ben's slight style edits
niche_style_bh = function(){
  theme(plot.title = element_text(family = "Arial",size=20, face="bold", color="#222222",margin = margin(10,0,10,0)),
        plot.subtitle = element_text(family = "Arial",size=18,margin = margin(0,0,10,0)),
        plot.background = element_rect(fill = "white"),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(color="Grey85"),
        panel.grid.major.x = element_line(color="White"),  
        panel.background = element_rect(fill="White",color="White"),
        panel.spacing.y = unit(.75,"lines"),
        axis.title = element_text(family = "Arial",size=14,color="#222222",margin=margin(2,2,2,2),face="bold"),
        axis.text.x = element_text(family = "Arial",size=12,color="#222222",margin=margin(-10,0,0,0),face="italic"),
        axis.text.y = element_text(family = "Arial",size=12,color="#222222",margin=margin(7,2,2,2),face="italic"),
        axis.ticks = element_blank(),
        axis.line = element_blank(),
        legend.position = "top",
        legend.text = element_text(family = "Arial",size=10, color="#222222"),
        legend.title = element_blank(),
        legend.background = element_rect(fill="#ffffff"),
        legend.key = element_rect(fill = "#ffffff"),
        strip.background = element_rect(fill="grey85",color="Grey75"),
        strip.text = element_text(family = "Arial",size = 10,color="black",face="bold"))
}

#######
#Need to make dedicated themes for: bar/column chart; line graph; boxplots
