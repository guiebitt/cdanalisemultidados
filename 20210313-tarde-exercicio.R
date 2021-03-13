# ANÁLISE MULTIVARIADA
#
# EXERCÍCIOS
#
# ANÁLISE FATORIAL
#
# 1) Usando o arquivo “Exerc A fatorial.xlsx”, realize a análise fatorial, seguindo todos
# os passos, desde a verificação da adequação da característica dos dados para
# essa análise até chegar na visualização gráfica do modelo e suas cargas
# fatoriais.

#
# Pacotes e libs necessários
#
require(psych)

library(readxl)
library(zoo)
library(data.table)

#
# PASSO 1 - Importar os dados
#
data <- read_excel(
  "Exerc_A_fatorial.xlsx",
  col_types = c(
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric",
    "numeric"
  )
)
#data

#
# PASSO 2 - Verificar se os dados são numéricos
#
str(table)

#
# PASSO 3 - Verificar se há dados faltantes
#
#is.na(data)
sum(is.na(data))

#
# PASSO 4 - Tratar os dados faltantes definindo a média da coluna
#           usando as libs zoo e data.table
#
data <- na.aggregate(data)
data

#
# PASSO 5 - Criar tabela de correlação
#
tablecor <- cor(data)
round(tablecor, 2)

#
# PASSO 6 - Apresentar a matriz de correlação
#
corrplot::corrplot(tablecor, method = "circle")

#
# PASSO 7 - Realizar o teste de esfericidade (Bartlett)
#
cortest.bartlett(data)

#
# O teste indica que não é uma Matriz de Identidade, pois não atende: (p>0,05)
#

#
# PASSO 8 - Realizar o teste KMO
#
KMO(data)

#
# Quando MSA maior que 0,5 na análise KMO, então indica que a análise
# fatorial é adequada para o conjunto de dados
#

#
# PASSO 9 - Realizar a análise de componentes principais
#
fit <- princomp(data, cor = TRUE)
fit

#
# Com o summary de fit, temos um entendimento maior da análise
#
summary(fit)

#
# Apresentando o resultado através de gráfico de barras
# É possível verificar que 7 fatores possuem variância maior que 1
# e devem ser considerados
#
screeplot(fit)

#
# Apresentando o resultado através de gráfico de linhas
#
plot(fit, type = "lines")

#
# Rodando a Análise de Componentes Principais (sem rotacionar)
#
pcdata <- principal(data, nfactors = 7, n.obs = 2800, rotate = "none", scores = TRUE)
pcdata

#
# Rodando a Análise de Componentes Principais (com rotação varimax)
# Agora é possível verificar a relação de variáveis em relação aos fatores
#
pcdatavarimax <- principal(data, nfactors = 7, n.obs = 2800, rotate = "varimax", scores = TRUE)
pcdatavarimax

#
# PASSO 10 - Interpretação dos fatores e análise dos componentes
#
biplot(pcdatavarimax, choose=c(1,2,3,4))
biplot(pcdatavarimax, choose=c(5,6,7))
fa.diagram(pcdatavarimax)

#
# Relações identificadas (Fator x Variáveis)
# RC2 - N2, N1, N3, N4, N5
# RC1 - A3, A2, A5, A4, A1
# RC6 - E2, E1, E4, E5, E3
# RC3 - C2, C3, C1, C4, C5
# RC4 - 05, 02, 03, 04
# RC5 - gender, 01
# RC7 - education, age
#
