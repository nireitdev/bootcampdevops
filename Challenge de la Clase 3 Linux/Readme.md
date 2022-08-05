# Resolucion Clase 3 - Bash Script


## Reto 1 - Linux Ejercicios 1,2 y 3

Script que sumariza los puntos 1, 2 y 3

Se utiliza una variable para almacenar el texto por defecto "Me encanta bash!!". 
Si se carga un parametro por consola se lo asigna a esta variable.

Se crean todos los directorios requeridos y se carga el texto en el archivo **file1.txt**

Por último se copia el texto en **file2.txt** y se mueve al directorio **/empty/**



```
#!/bin/bash

texto='Me encanta bash!!'

if [ ! -z  $1  ]
then
    texto=$1
fi

mkdir foo
mkdir foo/dummy
mkdir foo/empty
echo $texto > foo/dummy/file1.txt
touch foo/dummy/file2.txt


cat foo/dummy/file1.txt > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty/file2.txt
```

## Reto 1 - Linux Ejercicio 4 

Script para la resolución del  ejecicio 4
Descargar un archivo desde wikipedia y buscar por la cadena que se indique en la linea de comandos.
Si no se carga ningún parámetro se finaliza el script con un mensaje indicando la correcta sintaxis.

```
#!/bin/bash

if [ -z  $1  ]
then
    echo "Falta como parametro palabra a buscar:"
    echo "$0  palabra_a_buscar"
    exit
fi


ARCHIVO='archivo.out'
WWW='https://es.wikipedia.org/wiki/DevOps'

curl -s $WWW -o $ARCHIVO

grep -n $1 $ARCHIVO
```
