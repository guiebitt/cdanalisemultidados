# Importando dados
Proteinas_alimentacao <- read.csv("/cloud/project/Proteinas_alimentacao.txt", row.names=1, sep="")
Proteinas_alimentacao

boxplot(Proteinas_alimentacao)

# Padronizando os dados
data_scaled <- scale(Proteinas_alimentacao)

# Visualizar a matriz de distancias
dist(data_scaled)

# Algoritmo HC com distância Euclidiana
mun.hc.complete <- hclust(dist(data_scaled), method = "complete")
mun.hc.average <- hclust(dist(data_scaled), method = "average")
mun.hc.single <- hclust(dist(data_scaled), method = "single")

# Apresentando dendogramas
par(mfrow=c(1,3))
plot(mun.hc.complete, main = "Complete Linkage", xlab = "", sub = "", cex = .9, hang = -1)
plot(mun.hc.average, main = "Average Linkage", xlab = "", sub = "", cex = .9, hang = -1)
plot(mun.hc.single, main = "Single Linkage", xlab = "", sub = "", cex = .9, hang = -1)

# Utilizando apenas o Average Linkage, vamos fazer 3 cortes com 2, 3 e 5 clusters
par(mfrow=c(1,1))
plot(mun.hc.average, main = "Average Linkage", xlab = "", sub = "", cex = .9, hang = -1)
abline(h=4.85, lty=2, lwd=2, col="#E31A1C")

# Com 2 clusters:
# 1 - Finla, Norue, Dinam, Sueci, Franc, ReinU, Belgi, Irlan, Polon, AleOc, Suica, Tchec, AleOr, Austr, PaisB
# 2 - Portu, Espan, Greci, Itali, Alban, Bula, Romen, Iugos, Hungr, USSR

par(mfrow=c(1,1))
plot(mun.hc.average, main = "Average Linkage", xlab = "", sub = "", cex = .9, hang = -1)
abline(h=4.5, lty=2, lwd=2, col="#E31A1C")

# Com 3 clusters:
# 1 - Finla, Norue, Dinam, Sueci, Franc, ReinU, Belgi, Irlan, Polon, AleOc, Suica, Tchec, AleOr, Austr, PaisB
# 2 - Portu, Espan
# 3 - Greci, Itali, Alban, Bula, Romen, Iugos, Hungr, USSR

par(mfrow=c(1,1))
plot(mun.hc.average, main = "Average Linkage", xlab = "", sub = "", cex = .9, hang = -1)
abline(h=3.292, lty=2, lwd=2, col="#E31A1C")

# Com 5 clusters:
# 1 - Finla, Norue, Dinam, Sueci
# 2 - Franc, ReinU, Belgi, Irlan, Polon, AleOc, Suica, Tchec, AleOr, Austr, PaisB
# 3 - Portu, Espan
# 4 - Greci, Itali
# 5 - Alban, Bula, Romen, Iugos, Hungr, USSR
