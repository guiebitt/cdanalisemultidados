library(titanic)

# Define os subconjuntos
train <- titanic_train
test <- titanic_test
test <- merge(test, titanic_gender_class_model, by="PassengerId")

# Verificando as variáveis
str(train)

# Verificando se há dados ausentes
colSums(is.na(train))
colSums(is.na(test))

# Verifica se há valores vazios
colSums(train == '')
colSums(test == '')

# Remover valores faltantes e vazios
train <- train[-which(train$Embarked == ""),]
test <- test[-which(is.na(test$Fare)),]

# Colocando a mediana para valores faltantes
train$Age[is.na(train$Age)] <- median(train$Age, na.rm = T)
test$Age[is.na(test$Age)] <- median(test$Age, na.rm = T)

# Remover variáveis não necessárias
train <- subset(train, select = -c(Cabin, PassengerId, Ticket, Name))
test <- subset(test, select = -c(Cabin, PassengerId, Ticket, Name))

# Converter colunas para fatores
for (i in c("Survived","Pclass","Sex","Embarked")){
  train[,i] <- as.factor(train[,i])
}
for (j in c("Survived","Pclass","Sex","Embarked")){
  test[,j] <- as.factor(test[,j])
}

# Correlação das variáveis
library(dlookr)
correlate(train, )
plot_correlate(train)

# Removendo linhas com dados ausentes
train <- train[complete.cases(train),]

# Vendo se a classe está balanceada
table(train$Survived)
prop.table(table(train$Survived))

# Modelo 1
mod1 <- glm(Survived ~ ., data = train, family = binomial(link = "logit"))
mod1
summary(mod1)

# É possível identificar as variáveis significantes: 
