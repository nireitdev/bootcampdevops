#!/bin/bash
dockerbin=/usr/bin/docker

$dockerbin run -d --name servidor_web -p 8181:80 nginx
$dockerbin ps
$dockerbin images
$dockerbin stop servidor_web 
$dockerbin ps
$dockerbin rm servidor_web 
$dockerbin ps -a
