# Alguns pacotes para melhorar visualização
install.packages("GGally")
install.packages("corrplot")
install.packages("arm")

str(Pasta1)
table <- data.frame(Pasta1)
table

# Tabela para verificar se há dados faltantes
is.na(Pasta1)

# Lógica para identificar se há valores faltantes (1 = Tem, 0 - Não tem)
sum(is.na(Pasta1))

# Verifica a correlação
res <- cor(table)
round(res, 2)

# Melhorando visualização
corrplot::corrplot(res, method = c("circle"), is.corr = FALSE)

# Outra visualização
GGally::ggcorr(table, label = T)

# Utilizando dados "iris". Neste caso dá um alerta devido a coluna
# Species não ser numérica
iris
GGally::ggcorr(iris, label = T)
GGally::ggpairs(iris, lower = list(continuous = "smooth"))
