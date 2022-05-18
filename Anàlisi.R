#mat <- scan(p_(n1=0)(t=10000).txt);
#d<-read.table("/k_p=50/p_(n1=0)(t=10000).txt",header=FALSE,sep=" ")
matriu<-data.frame()
for (k in seq(25,150,by=25)) {
  a <- as.matrix(read.table(paste("./k_6=",k,"/rx-ry-inf_(a=0).txt",sep=""), sep="\t"))
  data<- as.data.frame(t(a))
  nomGrup <- rep(paste("k=",k,sep=""), nrow(data))
  temps<- index(data)
  data<- as.data.frame(cbind(data, nomGrup, temps))
  colnames(data)<- c("Radix", "Radiy", "Alerta", "Gruix","deep", "nom", "temps")
  
  matriu <- as.data.frame(rbind(matriu,data))
}
library(ggplot2)
library(stats)
library(zoo)
ggplot(matriu, aes(x=temps,y=as.numeric(Radix), col=nom ))+ geom_line(size=0.5)
ggplot(matriu, aes(x=temps,y=as.numeric(deep), col=nom ))+ geom_line(size=0.5)
ggplot(matriu, aes(x=temps,y=as.numeric(Gruix), col=nom ))+ geom_line(size=0.5)
