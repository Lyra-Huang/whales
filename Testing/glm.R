library(readxl)
data<-read_xlsx('whales.xlsx',sheet = 'Baleen')

glm<-glm(data=data,`total records`~`Average Mass(kg)`+`Average Length(m)`+data$`# of records 2000-2009`)
summary(glm)
