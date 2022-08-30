#Uso alpine por lo chica de la imagen
FROM node:alpine

#Etiquetado
LABEL maintainer="nire.it.dev@gmail.com"
LABEL project="bootcamp-node-app"

#Puerto Node
 4000

#Modificaciones a la  imagen Node
COPY  hello-bootcamp/ /app
WORKDIR /app
EXPOSE
#Sin esto me daba error. San Google
RUN npm install --save express

CMD [ "node", "server.js" ]
