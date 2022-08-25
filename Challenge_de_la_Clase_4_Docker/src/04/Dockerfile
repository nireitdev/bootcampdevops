#Imagen oficial Apache2
FROM httpd:alpine

#Etiquetado
LABEL maintainer="nire.it.dev@gmail.com"
LABEL project="bootcamp"

#Como metadato, indicamos que el contenedor utiliza el puerto 80
EXPOSE 80

#Copio los archivos
COPY content/ /usr/local/apache2/htdocs/
