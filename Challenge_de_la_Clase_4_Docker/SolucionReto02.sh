#!/bin/bash
dockerbin=/usr/bin/docker

ROOT_PASSW=root
DATABASE=prueba
USER=invitado
PASSWORD=invitado

$dockerbin run --name bbdd -p 3306:3306 \
    --env MARIADB_ROOT_PASSWORD=$ROOT_PASSW \
    --env MARIADB_DATABASE=$DATABASE \
    --env MARIADB_USER=$USER \
    --env MARIADB_PASSWORD=$PASSWORD \
    mariadb --port 3306