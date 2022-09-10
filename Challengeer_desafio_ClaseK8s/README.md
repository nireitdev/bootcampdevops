# Resolución desafio Clase K8s

Desafio original: [https://gist.github.com/roxsross/845243428b268ab0aa2199f77fea7a3d]

Importante: se hicieron varios fix a ``requirements.txt`` de la app original debido a errores de dependencias.

## Build de la imagen y posterior subida a Docker HUB

Para crear la imagen:

````
docker build -t nireitdev/myapp:1.0 .

````

Luego de cargar las credenciales de login, se sube la imagen:

````
docker push nireitdev/myapp:1.0
````

## Levantar la instancia del contenedor

A partir de una build local, se utiliza el Docker Compose para levantar la infraestructura:

````
docker-compose build
docker-compose up
````

En el navegador se debe ir a **http://localhost:8080** y se debe ver el texto: ``echo ok ``

Para finalizar:

````
docker-compose down --rm all
````

