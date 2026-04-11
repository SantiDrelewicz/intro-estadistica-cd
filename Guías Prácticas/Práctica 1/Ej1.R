library(readxl)
library(ggplot2)

DATOS_RUTA <- "Guías Prácticas/datos/"

load_csv <- function(filename) {
  return(read.csv(paste0(DATOS_RUTA, filename)))
}

load_txt <- function(filename) {
  return(read.table(paste0(DATOS_RUTA, filename), header = TRUE))
}

load_excel <- function(filename) {
  return(read_excel(paste0(DATOS_RUTA, filename)))
} 


# 1) ----
df_debernardi <-  load_csv("Debernardi")

## a)
diagnosis_prop = prop.table(
  table(df_debernardi$diagnosis)
)

## b)
barplot(diagnosis_prop)


# 2) ----
df_titanic <- read.csv(paste0(DATOS_RUTA, "datos_titanic"))

## a) 
sobrevivientes <- df_titanic$Survived == 1
mujeres <-  df_titanic$Sex == "female"

proba_mujer_dado_que_sobrevivio <- sum(mujeres & sobrevivientes) / sum(sobrevivientes)
proba_mujer_dado_que_sobrevivio

proba_mujer <-  sum(mujeres) / nrow(df_titanic)
proba_mujer

## b)
tabla <- table(df_titanic$Survived, df_titanic$Pclass)
tabla_norm_x_clase <- prop.table(tabla, margin = 2)
proba_sobrevivir_por_clase <- tabla_norm_x_clase["1",]
proba_sobrevivir_por_clase

## c)
barplot(tabla_norm_x_clase, beside = TRUE, legend = TRUE,
        xlab = "Clase", ylab = "Proporción",
        main = "Probabilidad de supervivencia por clase")


# 3) ----
iridio = scan(paste0(datos_ruta, "iridio.txt"), skip=1)
rodio = scan(paste0(datos_ruta, "rodio.txt"), skip=1)

## a)
hist(iridio, col = rgb(1, 0, 0, 0.5), xlim = range(c(iridio, rodio)))
hist(rodio,  col = rgb(0, 0, 1, 0.5), add = TRUE)
legend("center", legend = c("Iridio", "Rodio"),
       fill = c(rgb(1,0,0,0.5), rgb(0,0,1,0.5)))

par(mfrow = c(1, 2))

boxplot(iridio, main = "Iridio", ylab="Temperatura")
boxplot(rodio,  main = "Rodio")

## b)
mean(iridio)
median(iridio)
mean(iridio, trim = 0.1)
mean(iridio, trim = 0.2)

mean(rodio)
median(rodio)
mean(rodio, trim = 0.1)
mean(rodio, trim = 0.2)

## c)
sd(iridio)
IQR(iridio)
mad(iridio)

sd(rodio)
IQR(rodio)
mad(rodio)

## d)
quantile(iridio, 0.90)
quantile(iridio, 0.75)
quantile(iridio, 0.50)
quantile(iridio, 0.25)
quantile(iridio, 0.10)

quantile(rodio, 0.90)
quantile(rodio, 0.75)
quantile(rodio, 0.50)
quantile(rodio, 0.25)
quantile(rodio, 0.10)


# 4) ----

## a)
letras <- c("A", "B", "C")
dfs <- list()
for (l in letras) {
  df_salchicha <- read.table(paste0(datos_ruta, "salchichas_", l, ".txt"), 
                                    skip=1, col.names = c("calorias", "sodio"))
  df_salchicha$tipo <- l
  dfs[[l]] <- df_salchicha
}
write.table(do.call(rbind, dfs), 
            paste0(datos_ruta, "salchichas.txt"),
            row.names = FALSE, sep = "\t")

## b)
df_salchichas = read.table(paste0(datos_ruta, "salchichas.txt"), header = TRUE)

tipos <- unique(df_salchichas$tipo)

colores <- c("red", "green", "blue")

br <- seq(min(df_salchichas$calorias),
          max(df_salchichas$calorias),
          length.out = 15)

hist(df_salchichas$calorias[df_salchichas$tipo == tipos[1]],
     breaks = br, col = rgb(1,0,0,0.4),
     xlim = range(br),
     main = "Calorías por tipo", xlab = "Calorías")

for (t in tipos) {
  calorias_t = df_salchichas$calorias[df_salchichas$tipo == t]
  bw = 5
  br <- seq(min(calorias_t), max(calorias_t) + bw, bw)
  hist(calorias_t, breaks = br, probability = TRUE)
}

## c)
boxplot(calorias ~ tipo, data = df_salchichas,
        main = "Calorías por tipo de salchicha",
        xlab = "Tipo", ylab = "Calorías",
        col = c("red", "green", "blue"))

## d)
for (t in tipos) {
  sodio_t = df_salchichas$sodio[df_salchichas$tipo == t]
  bw <- 5
  br <- seq(min(sodio_t), max(sodio_t) + bw, bw)
  hist(sodio_t, breaks = br, probability = TRUE)
}

boxplot(sodio ~ tipo, data = df_salchichas,
        main = "Sodio por tipo de salchicha",
        xlab = "Tipo", ylab = "Sodio",
        col = c("red", "green", "blue"))


# 5) ----
estudiantes <- read.table(paste0(datos_ruta, "estudiantes.txt"), header = TRUE)

## a)

par(mfrow = c(2, 2))

### Grupo 1
g1 <- estudiantes$GRUPO1

hist(g1, prob = TRUE, 
     main = "Grupo 1", xlab = "Concentración (ug/L)")

curve(dnorm(x, mean = mean(g1), sd = sd(g1)),
      col = "red", lwd = 2, add = TRUE)

### Grupo 2
g2 = estudiantes$GRUPO2

hist(g2, prob = TRUE, 
     main = "Grupo 2", xlab = "Concentración (ug/L)")

curve(dnorm(x, mean = mean(g2), sd = sd(g2)),
      col = "red", lwd = 2, add = TRUE)

qqnorm(g1, main = "QQ-plot Grupo 1")
qqline(g1, col = "red")

qqnorm(g2, main = "QQ-plot Grupo 2")
qqline(g2, col = "red")

## b)
par(mfrow = c(1,1))
boxplot(g1, g2, col = c("red", "blue"),
        names = c("Grupo 1", "Grupo 2"),
        ylab = "Concentración (ug/L)")


# 6) ----
nubes <- read.table(paste0(datos_ruta, "nubes.txt"), header = TRUE)

## a)
controles <- nubes$CONTROLES
tratadas <- nubes$TRATADAS
boxplot(controles, tratadas, 
        col = c("red", "blue"),
        names = c("Controles", "Tratadas"),
        ylab = "Cantidad de agua caida")

## b)
par(mfrow = c(2, 2))

qqnorm(controles, main = "QQ-plot Controles")
qqnorm(tratadas, main = "QQ-plot Tratadas")

hist(controles, prob=TRUE)
curve(dnorm(x, mean = mean(controles), sd = sd(controles)),
      col = "red", lwd = 2, add = TRUE)

hist(tratadas, prob = TRUE)
curve(dnorm(x, mean = mean(tratadas), sd = sd(tratadas)),
      col = "red", lwd = 2, add = TRUE)

## c)
log_controles <- log(controles)
log_tratadas <- log(tratadas)

par(mfrow = c(2, 2))

qqnorm(log_controles, main = "QQ-plot Log(Controles)")
qqnorm(log_tratadas, main = "QQ-plot Log(Tratadas)")

hist(log_controles, prob=TRUE)
curve(dnorm(x, mean = mean(log_controles), sd = sd(log_controles)),
      col = "red", lwd = 2, add = TRUE)

hist(log_tratadas, prob = TRUE)
curve(dnorm(x, mean = mean(log_tratadas), sd = sd(log_tratadas)),
      col = "red", lwd = 2, add = TRUE)

## d)
par(mfrow = c(1, 1))
boxplot(log_controles, log_tratadas, 
        col = c("red", "blue"),
        names = c("log(Controles)", "log(Tratadas)"),
        ylab = "log(Cantidad de agua caida)")


# 7) ----
credit_card <- load_csv("data_credit_card")

## a)
par(mfrow = c(2, 2))

for (c in colnames(credit_card)) {
  plot(ecdf(credit_card[[c]]),
       main = "",
       xlab = c,
       ylab = "F(x)")
}

## b)
par(mfrow = c(1, 1))

hist(credit_card$credit_limit, prob = TRUE,
     main = "", xlab = "credit limit")

plot(density(credit_card$credit_limit))

## c)
boxplot(credit_card$tenure)

## d)
for (column in colnames(credit_card)) {
  cat(
    sprintf("%s :", column),
    sprintf("media = %3.f", mean(credit_card[[column]])),
    sprintf("meadiana = %3.f", median(credit_card[[column]])),
    sprintf("media (alpha=0.1)-podada = %3.f", mean(credit_card[[column]], 
                                                    trim = 0.1)),
    sep = "\n\t"
  )
}

## e)
par(mfrow = c(2,2))

for (column in colnames(credit_card)) {
  quantiles = quantile(credit_card[[column]])
  Q_1 = quantiles[1]
  Q_3 = quantiles[3]
  cat(
    sprintf("%s :", column),
    sprintf("Q_1 = %3.f", Q_1),
    sprintf("Q_3 = %3.f", Q_3),
    sprintf("IQR = %3.f", Q_3 - Q_1),
    sprintf("MAD = %3.f", mad(credit_card[[column]])),
    sep = "\n\t"
  )
  boxplot(credit_card[[column]], main = sprintf("%s :", column))
}



     
# 8) ----
ciclo_comb <- load_excel("ciclocombinado.xlsx")

## a)
pe = ciclo_comb$PE
hist(pe, probability = TRUE)
plot(density(pe))

## b)
pe_high = pe[ciclo_comb$HighTemp == 1]
pe_low = pe[ciclo_comb$HighTemp == 0]

par(mfrow = c(1,2))
dl = density(pe_low)
dh = density(pe_high)
plot(dl)
plot(dh)

par(mfrow = c(1,1))
plot(dl, col = "blue", main = "Densidades", 
     xlim = range(c(dl$x, dh$x)), 
     ylim = range(c(dl$y, dh$y)))
lines(dh, col = "red")
legend(
  "topright",
  legend = c("LowTemp", "HighTemp"),
  col = c("blue", "red"),
  lty = 1,
)

## c)
mean(pe_low < 450)
mean(pe_high < 300)

## d)
mean(pe < 450)

## e)
quantile(pe_high, 0.1)

## f)
quantile(pe, 0.1)
