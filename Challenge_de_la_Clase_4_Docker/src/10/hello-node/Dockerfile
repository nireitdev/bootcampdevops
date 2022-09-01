# load node version
FROM node:erbium-alpine

# create app dir
WORKDIR /opt/hello-node

# install dependencies
COPY package*.json ./
RUN npm install

#bundle everything
COPY . .

EXPOSE 9443

RUN apk add wait4x
CMD  wait4x tcp  mq:5672 -t 10m && wait4x mysql "root:${MYSQL_PASSWORD}@tcp(${MYSQL_HOST}:3306)/hello" -t 10m && npm start
