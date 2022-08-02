#!/bin/bash

docker build -t hmada15/multi-front:latest -t hmada15/multi-front ./front
docker build -t hmada15/multi-api:latest -t hmada15/multi-api ./server
docker build -t hmada15/multi-worker:latest -t hmada15/multi-worker ./worker

docker push hmada15/multi-front:latest
docker push hmada15/multi-api:latest
docker push hmada15/multi-worker:latest

docker push hmada15/multi-front
docker push hmada15/multi-api
docker push hmada15/multi-worker

kubectl apply -f k8s
