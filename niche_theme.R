
#install.packages("extraFont")

#install.packages("windowsFonts")
#font_import()
#loadfonts(device = "win")

install.packages("tidyverse")
library(extrafont)
library(tidyverse)

cols = c("#89C61B","#FFC000","#7F7F7F","#0283E4","#C55A11","#FFC000","#7F7F7F","#000000")
ggplot <- function(...) ggplot2::ggplot(...) + 
  scale_fill_manual(values = cols) + 
  scale_color_manual(values = cols)
  

niche_style <- function(){
  theme(
    plot.title = element_text(family = "Arial",size=24, face="bold", color="#222222"),
    plot.subtitle = element_text(family = "Arial",size=18,margin = margin(5,0,15,0)),
    
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_line(color="Grey85"),
    panel.grid.major.x = element_line(color="White"),  
    panel.background = element_rect(fill="White",color="White"),
    panel.spacing.y = unit(.75,"lines"),
    
    axis.title = element_text(family = "Arial",size=14,color="#222222",margin=margin(2,2,2,2)),
    axis.text = element_text(family = "Arial",size=12,color="#222222",margin=margin(2,2,2,2)),
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


data("ChickWeight")


#Multiple line plot
x <- ChickWeight %>%
  group_by(Time,Diet) %>%
  summarise(Weight = mean(weight))

x$Time <- as.factor(x$Time)

ggplot(x,aes(x=Time,y=Weight,color=Diet,group=Diet)) +
  geom_line(size=1) + 
  labs(title = "Total chicken weight over time",
       subtitle = "Really groundbreaking stuff",
       x = "Time",
       y = "Weight") +
  coord_cartesian(ylim=c(0,300)) +
  scale_y_continuous(expand=c(0,0)) + 
  niche_style() 

#Single line chart
x <- ChickWeight %>%
  group_by(Time) %>%
  summarise(Weight = mean(weight))

x$Time <- as.factor(x$Time)

ggplot(x,aes(x=Time,y=Weight,group=1)) +
  geom_line(size=1,color=cols[1]) + 
  labs(title = "Total chicken weight over time",
       subtitle = "Really groundbreaking stuff",
       x = "Time",
       y = "Weight") +
  coord_cartesian(ylim=c(0,300)) +
  scale_y_continuous(expand=c(0,0)) + 
  niche_style() 

#Single bar chart
x <- ChickWeight %>%
  group_by(Time,Diet) %>%
  summarise(Weight = mean(weight))

x$Time <- as.factor(x$Time)

ggplot(x,aes(x=Time,y=Weight,fill=Diet)) +
  geom_col() + 
  labs(title = "Total chicken weight over time",
       subtitle = "Really groundbreaking stuff",
       x = "Time",
       y = "Weight") +
  scale_y_continuous(expand=c(0,0)) + 
  niche_style() 

#Faceted bar chart
x <- ChickWeight %>%
  group_by(Time,Diet) %>%
  summarise(Weight = mean(weight))

x$Time <- as.factor(x$Time)

ggplot(x,aes(x=Time,y=Weight,fill=Diet)) +
  geom_col() + 
  facet_grid(Diet~.) +
  labs(title = "Total chicken weight over time",
       subtitle = "Really groundbreaking stuff",
       x = "Time",
       y = "Weight") +
  scale_y_continuous(expand=c(0,0)) + 
  coord_cartesian(ylim=c(0,300)) +
  niche_style() 

