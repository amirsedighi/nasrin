# nasrin
Nasrin is a boilerplate for bootified data-intensive microservices.
The name of project, "Nasrin" is inspired by https://en.wikipedia.org/wiki/Nasrin_Sotoudeh


## Compile
$ mvn clean install

## Run by Maven
$ mvn spring-boot:run

## Common Docker Commands

### Buildig Image - overriding the existed one
$ docker build --no-cache -t nasrin-micro-io/version:v0.1 .

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

Creating an updated image:
$ docker build --no-cache -t nasrin-micro-io/version:v0.1 .

Spring Cloud Kubernetes requires access to the Kubernetes API in order to be able to retrieve a list of addresses for pods running for a single service. 
Just execute the following command:
$ create clusterrolebinding admin --clusterrole=cluster-admin --serviceaccount=default:default

Create the ConfigMap. ConfiMap will inject the Kafka IP/Port into the spring boot microservice at start time.
$ kubectl create -f nasrin-micro-io.yaml

Create a kuberenetes deployment using kubectl:
$ kubectl create deployment nasrin-micro-io --image=nasrin-micro-io/version:v0.1

Make sure the depolyment is in the list of deployments:
$ kubectl get deployments

See the pods:
$ kubectl get pods

$ kubectl expose deployment nasrin-micro-io --type=LoadBalancer --port=8080
service/nasrin-micro-io exposed

$ minikube service nasrin-micro-io

$ curl http://192.168.99.117:32406/event?payload=HelloWorld


