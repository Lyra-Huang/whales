##reading data
library(bibliometrix)
library(plyr)

#species level
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

#total data and subsets of 2 time-spans
bib_total<-rbind.fill(bib1,bib2,bib3,bib4,bib5,bib6,bib7,bib8,bib9,bib10,bib11,bib12,bib13,bib14)
#remove the repetitive data
bib_total<-unique(bib_total)
bib_total_1 <- subset( bib_total, PY > 1999 & PY < 2010)
bib_total_2 <- subset( bib_total, PY > 2009 & PY < 2020)


