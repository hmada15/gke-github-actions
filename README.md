## Kubernetes app with Travis-ci to deploy to Google Kubernetes Engine (GKE)
The application includes front-end ReactJs, back-end NodeJs, worker NodeJs, Postgres, and Redis containers
 
### How it works
On every push or merge to Github, A Github Actions pipeline pulls the code, builds the docker images, tags them, pushes them to Docker Hub then deploys the app to GKE by applying k8s folder config files that pull and deploy the containers and Install ingress-nginx to handle the traffic.
