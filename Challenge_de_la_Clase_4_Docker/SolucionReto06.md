# Solucion Reto Bonus 6 Clase Docker

## MongoDB

Se utilizo la imagen oficial de Mongo:latest.
Utilizo un volumen para almacenamiento permanenten en mi computadora.
Configuro el docker run para que se se conecte en la red con un "bridge" para permitir otras imagenes docker conectarse.
Ademas abri el puerto 27017 para que pueda importar desde otra pc utilizando Compass el archivo json

````
docker run -d --network bridge \
    --name mongodb --rm \
    -e MONGO_INITDB_ROOT_USERNAME=admin \
    -e MONGO_INITDB_ROOT_PASSWORD=secreto \
    -p27017:27017 \
    -v ~/datadir:/data/db \
    mongo:latest

````

Con el comando ``docker inspect mongodb`` puedo obtener la ip que obtuvo dentro de la red  "bridge" de docker.

Utilizando Mongodb Compass y sabiendo la ip y el usuario/contraseña me conecté al mongodb. Creé la database "Library" y coleccion "Ebbok". Finalmente importé el archivo "books.json.

Para comprobar con Mongo Express, utilé otra imagen docker conectado a la misma red "bridge". 

````
docker run -it --network bridge \
    --name express --rm \-
    e  ME_CONFIG_MONGODB_URL=mongodb://admin:secreto@172.17.0.2:27017/ \
    -p 8081:8081 \
    mongo-express:latest
````

Express
![src](./img/sol6_01.jpg)

### TODO

Otra solución para la importación automatizada del archivo Json hubiera sido montar otra imagen docker con la herramienta ``mongoimport`` y parámetros la ip, usuarios, contraseña, database y colección. Pero para esto me tengo que asegurar que la imagen docker mongo se levantó correctamente.

## Nginx

Utilizando un Docerfile con la última version de **nginx:alpine** :

````
FROM nginx:alpine

LABEL mantainer="nire.it.dev"
LABEL project="ej06-nginx"

COPY bootcamp-web /usr/share/nginx/html

````

Build y run de la imagen docker:

````
docker run -d --rm --name bootcamp-web -p 9999:80 bootcamp-web
````

Comprobar que se haya copiado bien los archivos:

````
docker exec bootcamp-web ls /usr/share/nginx/html
````

Navegador:
![src](./img/sol6_02.jpg)

## Limpieza

````
docker stop mongodb
docker stop express
docker stop bootcamp-web
docker rm mongodb
docker rm express
docker rm bootcamp-web
````

