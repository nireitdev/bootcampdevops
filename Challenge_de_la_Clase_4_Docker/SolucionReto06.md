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


