#!/bin/bash

# Install ingress-nginx to handel trafic
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml

docker build -t hmada15/multi-front:latest -t hmada15/multi-front:$GIT_SHA ./front
docker build -t hmada15/multi-api:latest -t hmada15/multi-api:$GIT_SHA ./api
docker build -t hmada15/multi-worker:latest -t hmada15/multi-worker:$GIT_SHA ./worker

docker push hmada15/multi-front:latest
docker push hmada15/multi-api:latest
docker push hmada15/multi-worker:latest

docker push hmada15/multi-front:$GIT_SHA
docker push hmada15/multi-api:$GIT_SHA
docker push hmada15/multi-worker:$GIT_SHA

kubectl apply -f k8s

# Use $GIT_SHA to force kubernetes to pull the new images from Docker Hub
kubectl set image deployments/api-deployment api=hmada15/multi-api:$GIT_SHA
kubectl set image deployments/front-deployment front=hmada15/multi-front:$GIT_SHA
kubectl set image deployments/worker-deployment worker=hmada15/multi-worker:$GIT_SHA

