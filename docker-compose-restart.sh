#!/bin/bash

# restart services in docker-compose
docker-compose -p int -f $PWD/docker-compose.yaml stop $@
docker-compose -p int -f $PWD/docker-compose.yaml rm -f -v $@
docker-compose -p int -f $PWD/docker-compose.yaml up --no-start $@
docker-compose -p int -f $PWD/docker-compose.yaml start $@

