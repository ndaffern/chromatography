
# Loading libraries
library(dplyr)
library(ggplot2)
library(tidyr)

setwd("Y:/scopes/NDaffern/")
dime <- read.table("rxralphanur77n15dimerrun1st070618.asc", col.names = c("dml", "dabs280", "dout", "dabs260"), skip = 2, stringsAsFactors = FALSE)
nur <- read.table("nur77n15run3pur052618.asc", col.names = c("mml", "mabs280", "mout", "mabs260"), skip = 2, stringsAsFactors = FALSE)
rxr <- read.table("rxralphaapo070918.asc", col.names = c("rml", "rabs280", "rout", "rabs260"), skip = 2, stringsAsFactors = FALSE)
rawdat <- cbind(dime, nur, rxr)
rawdat <- as.data.frame(sapply(rawdat, as.numeric))
rawdat <- rawdat %>%
  select(dml, dimer = dabs280, mml, nur77 = mabs280, rml, rxr = rabs280) %>%
  slice(-1) %>%
  mutate(nnorm = nur77/max(nur77)) %>%
  mutate(rnorm = rxr/max(rxr)) %>%
  mutate(dnorm = dimer/max(dimer))


ggplot(rawdat) +
  geom_point(aes(dml, dnorm, colour = "1:1 Nur77+RXR"), size = 3.2) +
  geom_point(aes(mml, nnorm, colour = "Nur77"), size = 3.2) +
  geom_point(aes(rml, rnorm, colour = "RXR"), size = 3.2) +
  coord_cartesian(xlim = c(11,15)) +
  xlab("Volume (ml)") +
  ylab("Normalized Absorbance") +
  theme_bw() +
  theme(legend.position = "Right") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(plot.title = element_text(hjust = 0.5, size =19)) +
  theme(axis.title = element_text(size = rel(1.6))) +
  theme(axis.text = element_text(size = rel(1.6))) +
  theme(legend.text = element_text(size = rel(1.4))) +
  theme(legend.title = element_text(size = rel(1.4))) +
  theme(legend.position = c(0.78, 0.2))


