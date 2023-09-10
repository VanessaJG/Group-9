library(ggplot2)
library(tidyverse)

setwd("/Users/seankiah/Desktop/Scales/Group-9")

#1) Line of code with dat variable containing the scales dataset
dat<-read.csv("scales.csv")

#3) Line of code that shows the dimensions of the dataset
dim(dat)

#2) Line of code that reports the class of each column in dataset
sapply(dat,class)

#4) Code that shows the the number of scales punctured for each species
species.n<-dat%>%
  group_by(species) %>%
  summarise(n=n())
species.n
#5) Code that shows how many specimens are sampled for each species
dat %>%
  count(species,specimen) %>%
  print() %>%
  count(species,name = "n.specimens")

#6)Code that produces a PDF containing a boxplot of puncture force vs quadrant
pdf("Sean_Kiah_species_quadrant.pdf")
for(i in species) {
  p <- dat %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}