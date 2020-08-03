library(migest)
library(circlize)
library(tidyr)
library(dplyr)

#2000-2009
bib<-bib_total_1

##country collaboration plot
#extracting collaboration matrix
bib <- metaTagExtraction(bib, Field = "AU_CO", sep = ";") 
NetMatrix <- biblioNetwork(bib, analysis = "collaboration", 
                           network = "countries", sep = ";")

#Getting most citited countries
results <- biblioAnalysis(bib, sep = ";")
S <- summary(object = results, k=20 ,pause = FALSE) 
MostProdCountries <- S$MostProdCountries
MostProdCountries$Articles <- as.numeric(MostProdCountries$Articles)
countries <- MostProdCountries[1:8,'Country']
countries <- trimws(countries)
net_matrix <- as.matrix(NetMatrix)
small_matrix <-net_matrix[countries, countries]
diag(small_matrix) <- 0 #get rid of collaboration with same country

#chord plot
circos.clear()
a <- chordDiagramFromMatrix(small_matrix)
col_new<-a$col
chordDiagramFromMatrix(small_matrix, col = col_new, grid.col = 'light grey')


#2010-2019
bib<-bib_total_2

#extracting collaboration matrix
bib <- metaTagExtraction(bib, Field = "AU_CO", sep = ";") 
NetMatrix <- biblioNetwork(bib, analysis = "collaboration", 
                           network = "countries", sep = ";")
#Getting most citited countries
results <- biblioAnalysis(bib, sep = ";")
S <- summary(object = results, k=20 ,pause = FALSE) 
MostProdCountries <- S$MostProdCountries
MostProdCountries$Articles <- as.numeric(MostProdCountries$Articles)
countries <- MostProdCountries[1:8,'Country']
countries <- trimws(countries)
net_matrix <- as.matrix(NetMatrix)
small_matrix <-net_matrix[countries, countries]
diag(small_matrix) <- 0 #get rid of collaboration with same country

#chord plot
chordDiagramFromMatrix(small_matrix, col = col_new, grid.col = 'light grey')