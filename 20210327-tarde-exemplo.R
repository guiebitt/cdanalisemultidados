raw_data_alt <- data.frame(Municipio=c("Cambe","Ibipora","Londrina",
                                       "Pitangueiras","Rolandia","Tamarana"),
                           PopTotal=c(88186,42153,447065,2418,49410,9713),
                           EVN=c(72.87,74.43,71.37,72.25,68.4,66.57),
                           TxAlfab=c(90.55,88.8,92.93,84.97,90.48,77.26),
                           row.names = 1)
raw_data_alt
boxplot(raw_data_alt)

# Padronizando os dados
data_scaled <- scale(raw_data_alt)

# Calculando a matriz de distâncias, fazendo HC 
dist(data_scaled)

mun.hc.complete <- hclust(dist(data_scaled), method="complete")
mun.hc.average <- hclust(dist(data_scaled), method="average")
mun.hc.single <- hclust(dist(data_scaled), method="single")

par(mfrow=c(1,3))
plot(mun.hc.complete, main="Complete Linkage", xlab="", sub="",
     cex=.9)
plot(mun.hc.average, main="Average Linkage", xlab="", sub="",
     cex=.9)
plot(mun.hc.single, main="Single Linkage", xlab="", sub="",
     cex=.9)

plot(mun.hc.complete, main="Complete Linkage", xlab="", sub="",
     cex=.9, hang = -1)
plot(mun.hc.average, main="Average Linkage", xlab="", sub="",
     cex=.9, hang = -1)
plot(mun.hc.single, main="Single Linkage", xlab="", sub="",
     cex=.9, hang = -1)

par(mfrow=c(1,3))
plot(mun.hc.average, main="HC - Corte em 2 Clusters", xlab="", sub="",
     cex=.9, hang=-1)
abline(h=3, lty=2, lwd=2, col = "#E31A1C")
plot(mun.hc.average, main="HC - Corte em 3 Clusters", xlab="", sub="",
     cex=.9, hang=-1)
abline(h=2.5, lty=2, lwd=2, col = "#E31A1C")
plot(mun.hc.average, main="HC - Corte em 4 Clusters", xlab="", sub="",
     cex=.9, hang=-1)
abline(h=1.5, lty=2, lwd=2, col = "#E31A1C")