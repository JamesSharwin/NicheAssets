#standard library loads
library(tidyverse)
library(devtools)

source_url("https://raw.githubusercontent.com/nicheconsult/NicheAssets/master/ggplot_theme/niche_theme.R")

data("ChickWeight")

#Multiple line plot
x1 <- ChickWeight %>%
  group_by(Time,Diet) %>%
  summarise(Weight = mean(weight)) %>% ungroup() %>%
  mutate(Time = as.factor(Time))

ggplot(x1, aes(x=Time,y=Weight,color=Diet,group=Diet)) +
  geom_line(size=2) + scale_color_manual(values = niche_cols) +
  labs(title = "Total chicken weight over time",
       subtitle = "Really groundbreaking stuff",
       x = "Time",
       y = "Weight") +
  coord_cartesian(ylim=c(0,300)) +
  scale_y_continuous(expand=c(0,0)) + 
  niche_style_bh()

#Single line chart
x2 <- ChickWeight %>%
  group_by(Time) %>%
  summarise(Weight = mean(weight)) %>% ungroup() %>%
  mutate(Time = as.factor(Time))

ggplot(x2,aes(x=Time, y=Weight, group = 0)) +
  geom_line(size=2, color=niche_cols[1]) + 
  labs(title = "Total chicken weight over time",
       subtitle = "Really groundbreaking stuff",
       x = "Time",
       y = "Weight") +
  coord_cartesian(ylim=c(0,300)) +
  scale_y_continuous(expand=c(0,0)) + 
  niche_style_bh() 

#Single bar chart
x3 <- ChickWeight %>%
  group_by(Time,Diet) %>%
  summarise(Weight = mean(weight)) %>% ungroup() %>%
  mutate(Time = as.factor(Time))

ggplot(x3,aes(x=Time,y=Weight,fill=Diet)) +
  geom_col() + 
  labs(title = "Total chicken weight over time",
       subtitle = "Really groundbreaking stuff",
       x = "Time",
       y = "Weight") +
  scale_y_continuous(expand=c(0,0)) + 
  niche_style() 

#Faceted bar chart
x4 <- ChickWeight %>%
  group_by(Time,Diet) %>%
  summarise(Weight = mean(weight)) %>% ungroup() %>%
  mutate(Time = as.factor(Time))

ggplot(x4,aes(x=Time,y=Weight,fill=Diet)) +
  geom_col() + 
  facet_grid(Diet~.) +
  labs(title = "Total chicken weight over time",
       subtitle = "Really groundbreaking stuff",
       x = "Time",
       y = "Weight") +
  scale_y_continuous(expand=c(0,0)) + 
  coord_cartesian(ylim=c(0,300)) +
  niche_style() 

#Density plot
x5 <- ChickWeight %>% filter(Time %in% c(4,8,12,16,20))

ggplot(x,aes(x=weight,fill=Diet)) + 
  geom_density(color=NA) + 
  niche_style() +
  facet_grid(Diet~Time) +
  labs(
    title = "Distribution over time",
    x = "Weight",
    y = "Point density"
  )


