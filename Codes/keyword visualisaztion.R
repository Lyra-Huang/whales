#keyword visualization
library(wordcloud2)

#change bib to bib_total_1 and bib_total_2 (regarding the reading data rscript)

bib <- bib_total_1
bib <- bib_total_2

results <- biblioAnalysis(bib, sep = ";")
S <- summary(object = results, k = 200, pause = FALSE) #chosse k=40 to get top 40 for results
keywords <- S$MostRelKeywords

#manually select the keywords of the species names out

#for bib_total_1
keywords <- keywords[-c(1,2,4:15,17:20,26:30,32,34,37,38,41,45,46,48,52,64,86), ]

#for bib_total_2
keywords <- keywords[-c(1:3,5,7,8,10:17,19:23,25,27,29:33,35,42,44,45,53,59,60,74,79,80:82),]

#using wordcloud2 to visualize
words<-keywords[,1]
freq<-as.numeric(keywords[,2])
prob<-freq/sum(freq)
wordcloud2(data.frame(words, prob), shuffle = TRUE, size = 0.4) #use size=0.7 for total_bib_1
