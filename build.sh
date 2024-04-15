#!/usr/bin/env bash


docker buildx build --platform linux/amd64  -t code4tag/laravel-vapor:latest .

docker run -it code4tag/laravel-vapor:latest vapor list
