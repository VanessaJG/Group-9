#import the packages
library(ggplot2)
library(tidyverse)

#reading in the "scales" data set and storing it in "dat"
dat <- read.csv("scales.csv")

#shows the class of each column in the data set "dat"
sapply(dat, class)

#Shows the dimension of the data set "dat"
dim(dat)
head(dat)

#Showing the names and number of species
dat$species <- as.factor(dat$species)
species <- levels(dat$species)
species
length(species)

#First way of displaying number of scales punctured for each species.
A.rup<-length(dat$species[dat$species==species[1]])
L.gib<-length(dat$species[dat$species==species[2]])
L.mac<-length(dat$species[dat$species==species[3]])
M.sal<-length(dat$species[dat$species==species[4]])
M.sax<-length(dat$species[dat$species==species[5]])
P.fla<-length(dat$species[dat$species==species[6]])
species.obs <- data.frame(sp=species,n=c(A.rup,L.gib,L.mac,M.sal,M.sax,P.fla))
species.obs

#Second way of displaying number of scales punctured for each species.
species.n <- dat %>%
  group_by(species) %>%
  summarise(n = n())
species.n

#Summarizing the number of specimens sampled for each species.
dat %>% 
  count(species,specimen) %>%
  print() %>%
  count(species,name = "n.specimens")

#Generating a PDF containing the 6 box plot figures of puncture forces vs. quadrants for each species
pdf("Yunshu_Qiu_species_quadrant.pdf")
for(i in species) {
  p <- dat %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}
dev.off()
list.files(pattern = ".pdf")
