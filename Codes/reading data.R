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

#dividing datasets to 2 timespans 2000-2009 and 2010-2019
bib1_1 <- subset( bib1, PY > 1999 & PY < 2010)
bib1_2 <- subset( bib1, PY > 2009 & PY < 2020)

bib2_1 <- subset( bib2, PY > 1999 & PY < 2010)
bib2_2 <- subset( bib2, PY > 2009 & PY < 2020)

bib3_1 <- subset( bib3, PY > 1999 & PY < 2010)
bib3_2 <- subset( bib3, PY > 2009 & PY < 2020)

bib4_1 <- subset( bib4, PY > 1999 & PY < 2010)
bib4_2 <- subset( bib4, PY > 2009 & PY < 2020)

bib5_1 <- subset( bib5, PY > 1999 & PY < 2010)
bib5_2 <- subset( bib5, PY > 2009 & PY < 2020)

bib6_1 <- subset( bib6, PY > 1999 & PY < 2010)
bib6_2 <- subset( bib6, PY > 2009 & PY < 2020)

bib7_1 <- subset( bib7, PY > 1999 & PY < 2010)
bib7_2 <- subset( bib7, PY > 2009 & PY < 2020)

bib8_1 <- subset( bib8, PY > 1999 & PY < 2010)
bib8_2 <- subset( bib8, PY > 2009 & PY < 2020)

bib9_1 <- subset( bib9, PY > 1999 & PY < 2010)
bib9_2 <- subset( bib9, PY > 2009 & PY < 2020)

bib10_1 <- subset( bib10, PY > 1999 & PY < 2010)
bib10_2 <- subset( bib10, PY > 2009 & PY < 2020)

bib11_1 <- subset( bib11, PY > 1999 & PY < 2010)
bib11_2 <- subset( bib11, PY > 2009 & PY < 2020)

bib12_1 <- subset( bib12, PY > 1999 & PY < 2010)
bib12_2 <- subset( bib12, PY > 2009 & PY < 2020)

bib13_1 <- subset( bib13, PY > 1999 & PY < 2010)
bib13_2 <- subset( bib13, PY > 2009 & PY < 2020)

bib14_1 <- subset( bib14, PY > 1999 & PY < 2010)
bib14_2 <- subset( bib14, PY > 2009 & PY < 2020)

#total data and subsets of 2 time-spans
bib_total<-rbind.fill(bib1,bib2,bib3,bib4,bib5,bib6,bib7,bib8,bib9,bib10,bib11,bib12,bib13,bib14)
bib_total_1 <- subset( bib_total, PY > 1999 & PY < 2010)
bib_total_2 <- subset( bib_total, PY > 2009 & PY < 2020)

