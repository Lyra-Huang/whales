#install.packages("bibliometrix", dependencies=TRUE)
library(bibliometrix)

#authors
bib <- convert2df(file = "Rstudio_data/Eubalaena glacialis.bib", dbsource = "scopus", format = "bibtex")
names(bib)
authors <- bib$AU
authors <- unlist(strsplit(authors, ";"))
authors <- authors[order(authors)]
head(authors)

#check the citation
dim(bib) 
names(bib)
grep("NAKAGAWA, S.", bib$CR) 
bib[grep("NAKAGAWA, S.", bib$CR), c(1:3)] 

results <- biblioAnalysis(bib, sep = ";")
plot(results, k = 10, pause=TRUE)
grep("KRAUS SD", bib$AU)

mostcitedP <- citations(bib, field = "article", sep = ";")
cbind(mostcitedP$Cited[1:10]) 

mostcitedP <- citations(bib, field = "article", sep = ";")
cbind(mostcitedP$Cited[1:10]) 

## Creating bibliometric networks
NetMatrix <- biblioNetwork(bib, analysis = "coupling", network = "references", sep = ";")
net = networkPlot(NetMatrix, weighted = NULL, 
                  n = 10, Title = "Papers' bibliographic coupling", 
                  type = "fruchterman", size = 5, remove.multiple = TRUE, labelsize = 0.5)


NetMatrix <- biblioNetwork(bib, analysis = "coupling", network = "authors", sep = ";")
net = networkPlot(NetMatrix, weighted = NULL, 
                  n = 10, Title = "Authors' bibliographic coupling", 
                  type = "fruchterman", size = 5, remove.multiple = TRUE, labelsize = 0.8)

NetMatrix <- biblioNetwork(bib[1:50,], analysis = "co-citation", network = "references", sep = ";")
net = networkPlot(NetMatrix, weighted=NULL, 
                  n = 10, Title = "Papers' co-citations", 
                  type = "fruchterman", size = 5, remove.multiple = TRUE, labelsize = 0.5)

NetMatrix <- biblioNetwork(bib, analysis = "collaboration", network = "authors", sep = ";")
net = networkPlot(NetMatrix, weighted = NULL,
                  n = 10, Title = "Authors' collaborations", 
                  type = "fruchterman", size = 5, remove.multiple = TRUE, labelsize = 0.5)

##Country Scientific Collaboration
bib <- metaTagExtraction(bib, Field = "AU_CO", sep = ";") #we need to extract countries from the affiliations first
NetMatrix <- biblioNetwork(bib, analysis = "collaboration", 
                           network = "countries", sep = ";")
net = networkPlot(NetMatrix, n = 10, Title = "Country Collaboration",
                  type = "auto", size = TRUE, remove.multiple = FALSE, labelsize = 0.5)

#Keyword co-occurrences
NetMatrix <- biblioNetwork(bib, analysis = "co-occurrences", network = "keywords", sep = ";")
net = networkPlot(NetMatrix, n = 50,
                  Title = "Keyword co-occurance", type = "fruchterman", 
                  size = T, remove.multiple = FALSE, labelsize = 0.7, edgesize = 5)

#Co-Word Analysis
CS <- conceptualStructure(bib, field = "ID",
                          minDegree = 20, k.max = 5, stemming = FALSE, labelsize = 10)



#Historical Direct Citation Network
histResults <- histNetwork(bib, min.citations = 10, sep = ";")
net = histPlot(histResults, labelsize = 2)
