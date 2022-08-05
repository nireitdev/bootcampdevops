# Reto 2

## Solucion ej 1,2 y 3:

Script con todos los comandos:

```
#!/bin/bash

touch archiv1
touch archiv2
touch archiv3
touch archiv4
touch archiv5
touch archiv6
touch archiv7
touch archiv8
touch archiv9

chmod a-rwx archiv*


chmod u=rwx,go=     archiv1
chmod u=rw,go=      archiv2
chmod a=rwx         archiv3
chmod u=rwx,g=rw,o=r archiv4
chmod u=rwx,g=r,o=  archiv5
chmod u=rx,g=rw,o=r archiv6
chmod u=r,g=,o=x    archiv7
chmod u=rw,g=r,o=r  archiv8
chmod u=rw,g=rw,o=r archiv9



chmod o+r 		archiv1 	
chmod u-w 		archiv2
chmod a-x 		archiv3
chmod go-r 		archiv4
chmod g-r,o+wx 	archiv5
chmod u+w,o-r 	archiv6
chmod u+w,g+x,o-x,o+w archiv7
chmod u-rw,g-r 	archiv8
chmod u+rw,g+rw,o+r archiv9
```

## Solucion ej 4


Una forma rápida de ver los permisos actuales del archivo **/home/Lista_Precios** es con el comando ls:

```
ls -l  /home/Lista_Precios
```

A partir de ahí se puede forzar el propietario y grupo al que pertenece del archivo:

```
chown roxs:roxs /home/Lista_Precios
```

En principio según los requerimientos sólo el usuario Roxs puede editar y leer el archivo, por lo tanto faltaria setear el acceso:

```
chmod  u=rw,go= /home/Lista_Precios
```
