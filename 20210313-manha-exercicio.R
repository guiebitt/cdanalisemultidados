# 1 - Usaremos o data.frame “mtcars”, que significa “Motor Trend Car Road Tests”. Esse
# data.frame tem 32 observações de 11 variáveis numéricas e já está instalado no R.
# Nesse dataframe temos as seguintes variáveis:
#
# • 1- mpg - Miles/(US) gallon
# • 2- cyl - Number of cylinders
# • 3- disp - Displacement (cu.in.)
# • 4- hp - Gross horsepower
# • 5- drat - Rear axle ratio
# • 6- wt - Weight (1000 lbs)
# • 7- qsec - 1/4 mile time
# • 8- vs - Engine (0 = V-shaped, 1 = straight)
# • 9- am - Transmission (0 = automatic, 1 = manual)
# • 10- gear - Number of forward gears
# • 11- carb - Number of carburetors
#
# Use a library(corrplot). Construa a matriz de correlação, verificando se o data.frame é
# numérico, se há valores faltando, construa a tabela de correlação e a matriz de
# correlação, seguindo os passos do exemplo 1.
#
# Em “method” vc pode usar no lugar da palavra “circle” outras palavras para mudar a
# forma de apresentação, como “square”, “pie”, “color”, “number” e “shade”.

# Verificando se os dados são numéricos
str(mtcars)

# Verifica se há dados faltando
is.na(mtcars)
sum(is.na(mtcars))

# Criando o dataframe
table <- data.frame(mtcars)
table

# Tabela de correlação
cortable <- cor(table)
round(cortable, 2)

# Matriz de correlação (circle)
corrplot::corrplot(cortable, method = c("circle"), is.corr = FALSE)

# Matriz de correlação (square)
corrplot::corrplot(cortable, method = c("square"), is.corr = FALSE)

# Matriz de correlação (pie)
corrplot::corrplot(cortable, method = c("pie"), is.corr = FALSE)

# Matriz de correlação (color)
corrplot::corrplot(cortable, method = c("color"), is.corr = FALSE)

# Matriz de correlação (number)
corrplot::corrplot(cortable, method = c("number"), is.corr = FALSE)

# Matriz de correlação (shade)
corrplot::corrplot(cortable, method = c("shade"), is.corr = FALSE)
