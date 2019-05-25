
#install.packages("extraFont")

#install.packages("windowsFonts")
#font_import()
#loadfonts(device = "win")

#install.packages("tidyverse")

library(extrafont)
library(tidyverse)
library(devtools)
library(tidyverse)

source_url("https://raw.githubusercontent.com/nicheconsult/NicheAssets/master/niche_theme.R")


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

