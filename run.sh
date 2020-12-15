#!/bin/sh
docker-compose down &&
docker-compose rm &&
docker-compose build &&
docker-compose up -d
sleep 1
docker rmi $(docker images -f "dangling=true" -q)
echo y | docker volume prune
printf "\n... DOCKER CONTAINERS UP! ...\n\e[0m"
