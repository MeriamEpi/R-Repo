install.packages("plotly")
library(ggplot2)
library(dplyr)
library(plotly)
library(lubridate)
setwd("/Users/meriamberka/Desktop")

data <- read.csv("Unemployment.csv")
data <- data %>% mutate(Month=dmy(Month))

p <- ggplot(data, aes(x=Month, y=Total)) + annotate('rect', xmin=as.Date("2020-01-01"), xmax=as.Date("2023-10-01"), ymin=0, ymax=15, alpha=.3, fill="#CC79A7") + geom_area(fill="#E69F00", alpha=0.5) + geom_line(color="#E69F00") + xlab("Year") + ylab("Unemployment rate (%)") + geom_vline(xintercept=as.numeric(as.Date("2020-01-01")), lwd=1, color="#CC79A7", alpha=0.5, ) + annotate("text", label = "Jan 31 2020", x=as.Date("2018-01-01"), y=7, size=3, color = "#CC79A7", hjust=1, fontface="bold")
  
p <- ggplotly(p) %>% layout(annotations=list(x = 1, y = -0.1, text ="Data courtesy of US Bureau of Labour Statistics", showarrow = F, xref='paper', yref='paper', xanchor='right', yanchor='auto', xshift=0, yshift=0, font=list(size=8)))
p