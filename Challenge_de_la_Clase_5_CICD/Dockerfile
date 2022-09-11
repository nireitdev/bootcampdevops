FROM ubuntu:18.04

LABEL mantainer="nire.it.dev"
LABEL project="AppNode"

USER root
RUN apt update && apt upgrade
RUN apt install -y curl
#Agrega apt sources para node16
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt -y install nodejs


WORKDIR /usr/src/app
COPY app/package*.json .
RUN npm install

COPY app .


EXPOSE 8888

CMD [ "node", "index.js" ]