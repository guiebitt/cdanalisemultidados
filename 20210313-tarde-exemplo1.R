# Visualização dos dados
View(creme_dental_exemplo1)

# Função que retorna várias informações em relação aos dados
summary(creme_dental_exemplo1)

# Verificando se os dados são numéricos
str(creme_dental_exemplo1)

# Verifica se há dados faltando
is.na(creme_dental_exemplo1)
sum(is.na(creme_dental_exemplo1))

# Criação da tabela de correlação
matcor <- cor(creme_dental_exemplo1)
round(matcor, 2)

# Apresentando a matriz de correlação
corrplot::corrplot(matcor, method = "circle")

# Realizar o teste de esfericidade (Bartlett)
install.packages("psych")
require(psych)
cortest.bartlett(creme_dental_exemplo1)

# Para que seja uma matriz identidade, p > 0,05 (que não é este o caso)
# A matriz de identidade indica que não há correlação entre as variáveis

# Agora é necessário fazer o teste KMO
KMO(creme_dental_exemplo1)

# Quando maior que 0,5 na análise KMO, então a análise fatorial é adequada

# Agora é aplicado a análise dos componentes principais
fit <- princomp(creme_dental_exemplo1, cor = TRUE)
fit

# Com o summary de fit, temos o entendimento maior da análise de comp. principais
summary(fit)

# Plot em barras
screeplot(fit)

# Plot em linhas
plot(fit, type = "lines")

# Análise de componentes principais
PCAdente <- principal(creme_dental_exemplo1, nfactors = 2, n.obs = 30, rotate = "none", scores = TRUE)
PCAdente

# Análise de componentes principais (rotação varimax)
# Agora é possível verificar a relação de variáveis e identificar os fatores
PCAdentevarimax <- principal(creme_dental_exemplo1, nfactors = 2, n.obs = 30, rotate = "varimax", scores = TRUE)
PCAdentevarimax

# Foram identificados dois fatores, RC1 = V1, V3, V5, RC2 = V2, V4 e V6 (> 0.5; > -0.5)

# Apresentação dos dados
biplot(PCAdentevarimax)
fa.diagram(PCAdentevarimax)
