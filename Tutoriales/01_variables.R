# R como calculadora
2+7
5-3
9*3
62/3
2^3
sqrt(4)
pi*2
exp(1)
log(8)
log(8, base = 2)
cos(pi)


# Comentarios: son provistos para darle al lector infomación sobre qué está
# ocurriendo en el código R, pero ni son ejecutados ni tienen ningún impacto 
# sobre el resultado


# Asignación - Creación de objetos

## Podemos darle nombre a las cosas y asociarles un valor.
## Esto se llama asignar un valor a una variable

### Se consigue <- con el menor, seguido de un guión o con Alt+-
### que es el shortcut o atajo en la linea de comandos.

pepe <- 3 # Crea un objeto pepe y le asigna el valor 3
nombre <- "Pirulo" # Crea un objeto de tipo string y le asigna el valor Pirulo


# Tipos Simples

## Ejemplos de asignación de variables
peso <- 3.2
nombre <- "Jose"
## Ojo: distingue mayúsculas de minúsculas, 
## no es la misma variable, nombre que Nombre

## Otras manera para efectuar asignaciones
nombre2 = "Agustin"

## Consultar todos los objetos cargados en el entorno
objects()
ls()


# Operaciones

peso <-  3.2 # peso en kilos
peso + 1000 # Salida directa en pantalla
peso <- peso*1000
peso

## ¿ Qué diferencia hay?

## rm borra objetos
rm(peso)
