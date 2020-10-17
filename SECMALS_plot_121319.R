# Script to plot AKTA data
# Read in different files with read.table
# Change title ggtitle
# Change size with coord_cartesion



# Loading libraries
library(dplyr)
library(ggplot2)
library(tidyr)

setwd("S:/Documents/chromatograms/sec_mals/121319/")
rawdata <- read.csv("secmals_data_all_121319.csv", col.names = c("time", "dri", "time2", "uv", "time3", "mass"), header = TRUE, fill = TRUE, stringsAsFactors = FALSE)


dridat <- rawdata %>%
  select("time", "dri") %>%
  mutate(time = time*0.4) %>%
  gather(key = "Sample", value = "data", -time)


massdat <- rawdata %>%
  select("time3", "mass") %>%
  mutate(time3 = time3*0.4) %>%
  gather(key = "Sample", value = "data", -time3)


ggplot(dridat) +
  geom_point(aes(time, data, color = Sample ), size = 3.2) +
  coord_cartesian(xlim = c(15, 17.5), ylim = c(1, -0.1)) +
  ggtitle("PASB + Nurr1 28-67 SEC MALS DRI 12/13/19") +
  ylab("Normalized Differential Refractive Index") +
  xlab("Volume (mL)") +
  theme_bw() +
  theme(legend.position = "right") +
  theme(plot.title = element_text(hjust = 0.5, size =19)) +
  theme(axis.title = element_text(size = rel(1.6))) +
  theme(axis.text = element_text(size = rel(1.6))) 
  #theme(legend.text = element_text(size = rel(1.4))) +
  #theme(legend.title = element_text(size = rel(1.4))) +
  #theme(legend.position = c(0.8,0.8))


ggplot(massdat) +
  geom_point(aes(time3, data, color = Sample ), size = 3.2) +
  coord_cartesian(xlim = c(15, 17.5)) +
  ggtitle("PASB + Nurr1 28-67 SEC MALS Mass 12/13/19") +
  ylab("Calculated Mass (daltons)") +
  xlab("Volume (mL)") +
  theme_bw() +
  theme(legend.position = "right") +
  theme(plot.title = element_text(hjust = 0.5, size =19)) +
  theme(axis.title = element_text(size = rel(1.6))) +
  theme(axis.text = element_text(size = rel(1.6))) 
#theme(legend.text = element_text(size = rel(1.4))) +
#theme(legend.title = element_text(size = rel(1.4))) +
#theme(legend.position = c(0.8,0.8))



