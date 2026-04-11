# ¿De qué trata el conjunto de datos "mtcars"?
help(mtcars)
mtcars

# Explorando los datos
## Para ver las primeros filas
head(mtcars)
## Si en cambio queremos ver las últimas, escribimos
tail(mtcars)

# Para ver los nombres de las columnas
colnames(mtcars)

# Para ver los nombres de las filas
rownames(mtcars)

# Cómo extraer algunas filas
## Extraemos las filas 3 y 5
mtcars[c(3,5),]

# Cómo extraer algunas columnas
## Usando su número
mtcars[, 4]
## Usando su nombre
mtcars$hp

# ¿Cuántos tienen 4 velocidades
mtcars$gear
mtcars$gear == 4
sum(mtcars$gear == 4)

# ¿Qué autos tienen 4 velocidades?
which(mtcars$gear == 4)
rownames(mtcars)[c(1,2,3,8,9,10,11,18,19,20,26,32)]
## Otra forma
rownames(mtcars)[which(mtcars$gear == 4)]
## O lo hacemos en 2 pasos
cuales <- which(mtcars$gear == 4)
rownames(mtcars)[cuales]

# ¿Qué autos tienen 4 velocidades y transmisión manual?
cuales <- which(mtcars$gear == 4 & mtcars$am == 1)
rownames(mtcars)

# Hallar la cant. media de millas por galón de los autos de este conj. de datos.
mean(mtcars$mpg)

# Hallar la cant. media de millas por galón de los autos con 2 y 3 carburadores.
mean(mtcars$mpg[mtcars$carb == 2])
mean(mtcars$mpg[mtcars$carb == 3])

# Explorar la realción entre millas por galón y peso.
plot(mtcars$wt, mtcars$mpg)
## Qué podemos decir de la relación entre millas por galón y peso?
### La realción es aproximadamente lineal. Podríamos arrgiesgarnos a decir que
### por c/tonelada de peso, las millas por galón disminuyen en 10 (muyyy a ojo).