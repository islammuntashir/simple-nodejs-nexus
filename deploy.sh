#!/bin/bash
pwd
cd code 
git pull
docker-compose pull
docker-compose stop
docker-compose rm -f
docker-compose -f docker-compose.yml up -d
