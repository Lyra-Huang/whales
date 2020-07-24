##country collaboration plot

#choose which timespan
bib<-bib_total_1
bib<-bib_total_2

#extracting collaboration matrix
bib <- metaTagExtraction(bib, Field = "AU_CO", sep = ";") 
NetMatrix <- biblioNetwork(bib, analysis = "collaboration", 
                           network = "countries", sep = ";")

#Getting most citited countries
results <- biblioAnalysis(bib, sep = ";")
S <- summary(object = results, k=20 ,pause = FALSE) #set k to 200 to get all countries
MostProdCountries <- S$MostProdCountries
MostProdCountries$Articles <- as.numeric(MostProdCountries$Articles)
countries <- MostProdCountries[1:8,'Country']
countries <- trimws(countries)
net_matrix <- as.matrix(NetMatrix)
small_matrix <-net_matrix[countries, countries]

#chord plot
chordDiagramFromMatrix(small_matrix)
title('Collaboration of Countries in 2010-2019', line=-1)
