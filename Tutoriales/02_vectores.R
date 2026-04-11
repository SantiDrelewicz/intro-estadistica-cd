c(1,2,4) # c: concatena
vec <- c(1,2,4) # crea el objeto prueba vec y le asigna los valores 1, 2 y 4
x <- c(2,4,6,8,10)
y <- 1:5 # Otra forma de generar vectores


# Comando rep - rep(x, times)
x <- rep(0,10)
rep(1:3, 4)
x <- rep (NA,5) # NA: Not Available, valor ausente, missing

nombres <- c("Jose", "Pedro", "Agustin")
# ¿Qué diferencia hay?
rep(c("Jose", "Pedro"), times = 2)
rep(c("Jose", "Pedro"), each = 2)

# Cuando queremos saber algo sobre un comando usamos help()
help(rep)


# Comando  deq - seq(from=a, to=b, by=c)
r <- seq(1,5,0.5) # Especificamos un "step" o "by

# Podemos también ir para atras
r <- seq(1,-3, -0.5) # con un paso de 0.5 positivo obtendríamos un error
deq(-5,5, length=10) # Nos armamos una tira de 10 elementos
w <- seq(1,5) # Equivalente a 1:5


# Operaciones con un Vector
y <- seq(1,7,by=2)
y
2*y
log(y)


# Operaciones entre Vectores
## Podemos operar directamente sobre vectores
x <- 1:4
x + y
x*y
w <- x + y # ¿Qué hace?


# Comandos sobre vectores
sum(c(2,4,6))

## Sin embargo
sum(c(2,4,NA))

sum(c(2,4,NA), na.rm = TRUE)


# Indexación de Vectores

w <- (1:4)*10 # Los arreglos se indexan desde el 1
w[2]
w[-4]
v <- rep(0,5)
v[c(1,4,5)] <- 1
v
v[1:2]

## Vectores lógicos
x <- c(2,4,7, 20)
y <- c(3,2,8,19)
x > y
z <- x > y # z es un vector con valores lógicos
sum(z)
mean(x > 5) # ¿Qué hace esto?

x
x > 6
x[x>6] # Elige las componentes que cumplen la condición
x[c(F,F,T,T)] # También se podría hacer así


# Un poquito más
## Buscando el máximo y el mínimo valor del vector
y <- c(10, 30, 15, 5)
y
max(y)
min(y)
which.max(y)
which.min(y)
sort(y)
order(y)
