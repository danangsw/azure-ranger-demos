#Docker get started:
## List Docker CLI commands
docker
docker container --help

## Display Docker version and info
docker --version
docker version
docker info

## Execute Docker image
docker run hello-world

## List Docker images
docker image ls

## List Docker containers (running, all, all in quiet mode)
docker container ls
docker container ls --all
docker container ls -aq

# Docker simple python flask app
## First of all, we need to create a directory called my_web_app and save the following code in a file called app.py.
## Creating Dockerfile
## Build the image from the Dockerfile
docker build -t flask_app:0.1 .
## See the image created successfully
docker images ls
## run the container specifying the port that will be mapped (-p) and using the -d flag, which means detached, so that the terminal does not get stuck. 
## We must also pass the name and tag of the image as parameter (flask_app:0.1).
docker run -d -p 5000:5000 flask_app:0.1
## Show the running container 
docker ps -a
## Remove the container
docker container rm <name>
## Push to registry (hub.docker.com) repository
### Create tag
### docker tag flask_app:0.1 danangsukma/flask_app:0.1
docker tag <image_source> <image_target>

# Docker Service (Docker container orchestration platform)		
docker swarm init					 # Running a swarm manager			
docker stack ls                                            # List stacks or apps
docker stack deploy -c <composefile> <appname>  # Run the specified Compose file ex: docker stack deploy -c docker-compose.yml flask_app
docker service ls                 # List running services associated with an app
docker service ps <service>                  # List tasks associated with an app ex: docker service ps gsxfpjcf8ib9
docker inspect <task or container>                   # Inspect task or container ex: docker inspect gsxfpjcf8ib9
docker container ls -q                                      # List container IDs
docker stack rm <appname>                             # Tear down an application ex: docker stack rm flask_app
docker swarm leave --force      # Take down a single node swarm from the manager


# AKS demo:
## The CLI locally requires that you are running the Azure CLI version 2.0.52 or later
az --version

##  Creates a resource group 
az group create -n "dsw-aks-quickstart-rg" -l southeastasia

## Create an AKS cluster.
az aks create --resource-group "dsw-aks-quickstart-rg" --name "dsw-aks-cluster" --node-count 1 --enable-addons monitoring --generate-ssh-keys

## Install kubectl locally, use the az aks install-cli 
az aks install-cli

## Set PATH of kubectl
set PATH=%PATH%;"C:\Users\v-dawant\.azure-kubectl"

## Downloads credentials and configures the Kubernetes CLI to use kubectl
az aks get-credentials --resource-group "dsw-aks-quickstart-rg" --name "dsw-aks-cluster" --overwrite-existing

## Verify the connection to your cluster, use the kubectl get command to return a list of the cluster nodes
kubectl get nodes

## Deploy the application using the kubectl apply
kubectl apply -f azure-vote.yaml

## Test the application
kubectl get service azure-vote-front --watch

##  Open a web browser to the external IP address of your service.
http://13.76.4.149/

## Chek the pods list
kubectl get pods
## Manually scale pods
kubectl scale --replicas=5 deployment/azure-vote-front

## Manually scale AKS nodes
az aks scale --resource-group "dsw-aks-quickstart-rg" --name "dsw-aks-cluster" --node-count 3

## Check the nodes
kubectl get nodes

## Delete cluster
az group delete --name "dsw-aks-quickstart-rg" --yes --no-wait