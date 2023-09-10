##Intro
library("ggplot2")
library("tidyverse")

#Set working directory
setwd("/Users/cahillwhittier/test")

##Download scales.csv and create dat variable
dat <- read_csv("~/Downloads/scales.csv")

##class of each column in the data set
sapply(dat,class)

##Dimensions of the data set
dim(dat)

##How many scales punctured per species
species.n<- dat %>%
  group_by(species) %>%
  summarise(n = n())
species.n

##How many specimens sampled for each species
dat %>% 
  count(species,specimen) %>%
  print() %>%
  count(species,name = "n.specimens")


##plotting mean puncture force for each quadrant in each species
##Create PDF file containing all the figures
pdf("Cahill_Whittier_species_quadrant.pdf")
for(i in species){
  p <- dat %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}
dev.off()

