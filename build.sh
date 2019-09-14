#!/usr/bin/env bash

docker build -t teamnovu/laravel-vapor:latest .

docker run --interactive --tty
  teamnovu/laravel-vapor vapor list