library(ggplot2)
library(tidyverse)

setwd("/Users/vanessajean-gilles/We-R-Awesome")

#dat variable
dat<-read.csv("~/We-R-Awesome/scales.csv")

#dimensions of dataset
dim(dat)

#class of each column in dataset
sapply(dat,class)

#summary of number of scales
species.n<-dat%>%
  group_by(species) %>%
  summarise(n=n())
species.n

#summary of number of specimens
dat %>%
  count(species,specimen) %>%
  print() %>%
  count(species,name = "n.specimens")

#pdf file code
pdf("Vanessa_JG_species_quadrant.pdf")
for(i in species) {
  p <- dat %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}

