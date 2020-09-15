# nasrin
Nasrin is a boilerplate for bootified data-intensive microservices.
The name of project, "Nasrin" is inspired by https://en.wikipedia.org/wiki/Nasrin_Sotoudeh


## Compile
$ mvn clean install

## Run by Maven
$ mvn spring-boot:run

## Common Docker Commands

### Buildig Image
$ docker build -t nasrin-micro-io/version:v0.1 .

### Run by Docker
$ docker run -p 5000:8080 nasrin-micro-io/version:v0.1

## Common Kubernetes Commands


$ minikube start

$ minikube stop

$ minukube dashboard


## Kubernetes
Here we will find how to let Kubernetes takes care of the bootified image we've created in previous steps.
https://kubernetes.io/docs/tutorials/hello-minikube/

First run minikube
$ minikube start

Make sure minikube started working:
$ minikube status

To make sure minikube will search for local cached images:
$ eval $(minikube docker-env)

Create a kuberenetes deployment using kubectl:
$ kubectl create deployment nasrin-micro-io --image=nasrin-micro-io/version:v0.1

Make sure the depolyment is in the list of deployments:
$ kubectl get deployments

See the pods:
$ kubectl get pods

$ kubectl expose deployment nasrin-micro-io --type=LoadBalancer --port=8080
service/nasrin-micro-io exposed

$ minikube service nasrin-micro-io
