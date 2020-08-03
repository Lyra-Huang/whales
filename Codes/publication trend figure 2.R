#publication trend map

#
bib<-rbind.fill(bib1,bib2,bib3,bib4)
results <- biblioAnalysis(bib, sep = ";")
S <- summary(object = results, k=20 ,pause = FALSE)

#Family Balaenidae
bib<-rbind.fill(bib1,bib2,bib3,bib4)
ggplot(bib,aes(PY))+
  geom_bar(fill="#56B4E9")+
  labs(title="Number of publications of Family Balaenidae over years",
       x="year",y="Number of publications")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))

#Family Neobalaenidae
bib<-rbind.fill(bib5)
ggplot(bib,aes(PY))+
  geom_bar(fill="#56B4E9")+
  scale_x_binned(n.break=20) +
  labs(title="Number of publications of Family Neobalaenidae over years",
       x="year",y="Number of publications")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))

#Family Eschrichtiidae
bib<-rbind.fill(bib6)
ggplot(bib,aes(PY))+
  geom_bar(fill="#56B4E9")+ 
  labs(title="Number of publications of Family Eschrichtiidae over years",
       x="year",y="Number of publications")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))

#Family Balaenopteridae
bib<-rbind.fill(bib7,bib8,bib9,bib10,bib11,bib12,bib13,bib14)
ggplot(bib,aes(PY))+
  geom_bar(fill="#56B4E9")+ 
  labs(title="Number of publications of Family Balaenopteridae over years",
       x="year",y="Number of publications")+
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5))





