
setwd(paste0(Sys.getenv('CS_HOME'),'/NoisyEA/Models'))

library(ggplot2)

res <- read.csv(file='mgo/test/rastriginNSGA3.csv',sep=';',header = F)
ref <- read.csv(file='mgo/test/reference.csv',sep=';',header = F)

for(j in 1:ncol(res)){
  res[,j] = (res[,j] - min(res[,j]))/(max(res[,j]) - min(res[,j]))
}

g=ggplot(res,aes(x=V1,y=V2))
g+geom_point()+geom_point(data=ref,aes(x=V1,y=V2),col='red')



####

pop = data.frame()
nextGen=T;gen=0
while(nextGen){
  res <- read.csv(file=paste0('mgo/test/pop',gen,'.csv'),sep=';',header = F)
  pop = rbind(pop,data.frame(x = res$V1,y=res$V2,gen=rep(gen,nrow(res))))
  gen = gen + 1
  nextGen = file.exists(paste0('mgo/test/pop',gen,'.csv'))
}
for(j in 1:(ncol(pop)-1)){
  pop[,j] = (pop[,j] - min(pop[,j]))/(max(pop[,j]) - min(pop[,j]))
}

g=ggplot(pop,aes(x=x,y=y,color = gen))
g+geom_point()+geom_point(data=ref,aes(x=V1,y=V2),col='red')


g=ggplot(pop[pop$gen>60,],aes(x=x,y=y,color = gen))
g+geom_point()+geom_point(data=ref,aes(x=V1,y=V2),col='red')
