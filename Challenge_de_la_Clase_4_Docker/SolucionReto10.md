# Solucion Reto Bonus 10 Clase Docker

El ejercicio plantea un problema de disponibilidad de servicios. Cuand se levanta la app de NodeJs puede ser que la base de datos en Mysql no esté disponible.

La solución consiste en detectar fehacientemente que un servicio que depende de otro este levantado.

Investigué varias herramientas, muchas en bash y otras en Go. Elegí `Wait4x` que permite verificar el funcionamiento de servicios TCP en general y otros en forma particular tal como Mysql y RabbitMQ. 

RTFM [Wait4X](https://wait4x.dev/) ç
[Github] (https://github.com/atkrad/wait4x)

**Lo bueno**: existe paquetes directamente instalables en la imagenes de Alpine Linux.

**Lo malo**: sólo tiene la version 0.4 en los paquetes Alpine, pero que es suficiente para este ejercicio.

Si se desea automatizar la descarga y utilizar todas las *features* que provee en un Dockerfile se debere utilizar la herramientas `wget` para descargar la ultima version del binario (v2.4) y `tar` para descomprimirlo dentro de la imagen.


Entonces para verificar que se cumnle las condiciones para la app de Nodejs se debería agregar al Dockerfile:

````
RUN apk add wait4x
CMD  wait4x tcp  mq:5672 -t 10m && wait4x mysql "root:password@tcp(db:3306)/hello" -t 10m && npm start

````
Y para la imagen de la App en Python:

````
RUN apk add wait4x
CMD wait4x tcp  mq:5672 -t 10m &&  python3 /home/myapp/app.py
````



## Ejecutar la solución:
Finalmente la solución al problema es:

````
git clone https://github.com/nireitdev/bootcampdevops.git
cd bootcampdevops/Challenge_de_la_Clase_4_Docker/src/10/deployment
docker-compose build
docker-compose up 
````

La pagina será visible desde la url `http://localhost:5000`


![src](./img/sol10_01.jpg)

Para finalizar:

```
docker-compose down --rm all
```