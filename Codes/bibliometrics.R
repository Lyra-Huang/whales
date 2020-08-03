
library(bibliometrix)
library(plyr)
library(ggplot2)

bib1<- convert2df(file = 'Rstudio_data/Eubalaena glacialis.bib', dbsource = "scopus", format = "bibtex")
bib2 <- convert2df(file = 'Rstudio_data/Eubalaena japonica.bib', dbsource = "scopus", format = "bibtex")
bib3<- convert2df(file = 'Rstudio_data/Eubalaena australis.bib', dbsource = "scopus", format = "bibtex")
bib4<- convert2df(file = 'Rstudio_data/Balaena mysticetus.bib', dbsource = "scopus", format = "bibtex")
bib5<- convert2df(file = 'Rstudio_data/Caperea marginata.bib', dbsource = "scopus", format = "bibtex")
bib6<- convert2df(file = 'Rstudio_data/Eschrichtius robustus.bib', dbsource = "scopus", format = "bibtex")
bib7<- convert2df(file = 'Rstudio_data/Balaenoptera musculus.bib', dbsource = "scopus", format = "bibtex")
bib8<- convert2df(file = 'Rstudio_data/Balaenoptera physalus.bib', dbsource = "scopus", format = "bibtex")
bib9<- convert2df(file = 'Rstudio_data/Megaptera novaeangliae.bib', dbsource = "scopus", format = "bibtex")
bib10<- convert2df(file = 'Rstudio_data/Balaenoptera omurai.bib', dbsource = "scopus", format = "bibtex")
bib11<- convert2df(file = 'Rstudio_data/Balaenoptera edeni.bib', dbsource = "scopus", format = "bibtex")
bib12<- convert2df(file = 'Rstudio_data/Balaenoptera borealis.bib', dbsource = "scopus", format = "bibtex")
bib13<- convert2df(file = 'Rstudio_data/Balaenoptera acutorostrata.bib', dbsource = "scopus", format = "bibtex")
bib14<- convert2df(file = 'Rstudio_data/Balaenoptera bonaerensis.bib', dbsource = "scopus", format = "bibtex")

bib<-rbind.fill(bib1,bib2,bib3,bib4,bib5,bib6,bib7,bib8,bib9,bib10,bib11,bib12,bib13,bib14)

#keyword occurance
NetMatrix <- biblioNetwork(bib, analysis = "co-occurrences", network = "keywords", sep = ";")
net = networkPlot(NetMatrix, n = 50,
                  Title = " ", type = "fruchterman", 
                  size = T, remove.multiple = FALSE, labelsize = 0.7, edgesize = 5)
title("Keyword Co-occurance", line=-1)

##Country Scientific Collaboration
bib <- metaTagExtraction(bib, Field = "AU_CO", sep = ";") #we need to extract countries from the affiliations first
NetMatrix <- biblioNetwork(bib, analysis = "collaboration", 
                           network = "countries", sep = ";")
net = networkPlot(NetMatrix, n = 10, Title = "Country Collaboration in 2000-2009",
                  type = "auto", size = TRUE, remove.multiple = FALSE, labelsize =1)
net=networkPlot(NetMatrix, n = 30, Title = "Country Collaboration in 2000-2009",
                type = "circle", size=TRUE, remove.multiple=FALSE,
                labelsize=0.7,cluster="none")

##family level

bib<-rbind.fill(bib1,bib2,bib3,bib4)
bib<-rbind.fill(bib5)
bib<-rbind.fill(bib6)
bib<-rbind.fill(bib7,bib8,bib9,bib10,bib11,bib12,bib13,bib14)

#Co-Word Analysis
CS <- conceptualStructure(bib, field = "ID",
                          minDegree = 5, k.max = 5, stemming = FALSE, labelsize = 10)


str(bib$PY)

##publication year
ggplot(bib,aes(PY))+
  geom_bar(fill="#56B4E9")+
  labs(title="Number of publications of Family Balaenidae over years",
       x="year",y="Number of publications")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))


ggplot(bib,aes(PY))+
  geom_bar(fill="#56B4E9")+
  scale_x_binned(n.break=20) +
  labs(title="Number of publications of Family Neobalaenidae over years",
       x="year",y="Number of publications")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))

ggplot(bib,aes(PY))+
  geom_bar(fill="#56B4E9")+ 
  labs(title="Number of publications of Family Eschrichtiidae over years",
       x="year",y="Number of publications")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))

ggplot(bib,aes(PY))+
  geom_bar(fill="#56B4E9")+ 
  labs(title="Number of publications of Family Balaenopteridae over years",
       x="year",y="Number of publications")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))
