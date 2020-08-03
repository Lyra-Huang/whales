library(readxl)
data<-read_xlsx('whales species data.xlsx',sheet = 'Baleen')
data$mass<-as.numeric(data$`Average Mass(kg)`)
data$length<-as.numeric(data$`Average Length(m)`)
data$records<-data$`total records`
data$growth<-data$`growth rate`
data$cs<-data$explanatory

#analyse the models (publication number/log (publications) vs mass/length/conservation statuts)
glm1<-glm(data=data,records~mass,family='quasipoisson')
summary(glm1)
glm11<-glm(data=data,log(records)~mass,family='quasipoisson')
summary(glm11)
glm2<-glm(data=data,records~length,family='quasipoisson')
summary(glm2)
glm21<-glm(data=data,log(records)~length,family='quasipoisson')
summary(glm21)
glm3<-glm(data=data,records~cs,family='quasipoisson')
summary(glm3)
glm31<-glm(data=data,log(records)~cs,family='quasipoisson')
summary(glm31)

#model of growth rate vs mass/length/conservation status
glma<-glm(data=data,growth~mass,family='quasipoisson')
summary(glma)
glmb<-glm(data=data,growth~length,family='quasipoisson')
summary(glmb)
glmc<-glm(data=data,growth~cs,family='quasipoisson')
summary(glmc)
