
library(migest)
library(circlize)
library(tidyr)
library(dplyr)

##affiliation collaboration plot
#2000-2009
bib<-bib_total_1
bib <- metaTagExtraction(bib, Field = "AU_UN", sep = ";") 
NetMatrix <- biblioNetwork(bib, analysis = "collaboration", 
                           network = "universities", sep = ";")
net_matrix <- as.matrix(NetMatrix)
results <- biblioAnalysis(bib, sep = ";")

df <- tibble(x=results$FirstAffiliation,y=1:length(results$FirstAffiliation))
aff<-dplyr::count(df,x,sort = TRUE)
affiliation<-aff$x[2:9]
small_matrix <-net_matrix[affiliation, affiliation]
diag(small_matrix) <- 0
chordDiagramFromMatrix(small_matrix)
title('Collaboration of top 8 affiliation in 2010-2019')



#2010-2019
bib<-bib_total_2
bib <- metaTagExtraction(bib, Field = "AU_UN", sep = ";") 
NetMatrix <- biblioNetwork(bib, analysis = "collaboration", 
                           network = "universities", sep = ";")
net_matrix <- as.matrix(NetMatrix)
results <- biblioAnalysis(bib, sep = ";")

df <- tibble(x=results$FirstAffiliation,y=1:length(results$FirstAffiliation))
aff<-dplyr::count(df,x,sort = TRUE)
affiliation<-aff$x[c(1,3:9)]
small_matrix <-net_matrix[affiliation, affiliation]
diag(small_matrix) <- 0
chordDiagramFromMatrix(small_matrix)
title('Collaboration of top 8 affiliation in 2010-2019')



