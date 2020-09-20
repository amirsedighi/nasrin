# nasrin
Nasrin is a boilerplate for bootified data-intensive microservices.
The name of project, "Nasrin" is inspired by https://en.wikipedia.org/wiki/Nasrin_Sotoudeh


## Compile
`$ mvn clean install`

## Run by Maven
`$ mvn spring-boot:run`

### Build Docker Image - overriding the existed one
`$ docker build --no-cache -t nasrin-micro-io/version:v0.1 .`

### Run by Docker
`$ docker run -p 5000:8080 nasrin-micro-io/version:v0.1`

## Kubernetes
Here we will find how to let Kubernetes takes care of the bootified image we've created in previous steps.
https://kubernetes.io/docs/tutorials/hello-minikube/

Start minikube:

`$ minikube start`

Make sure minikube started working:

`$ minikube status`

To make sure minikube will search for local cached images:

`$ eval $(minikube docker-env)`

Creating an updated image:

`$ docker build --no-cache -t nasrin-micro-io/version:v0.1 .`

Spring Cloud Kubernetes requires access to the Kubernetes API in order to be able to retrieve a list of addresses for pods running for a single service. 
Just execute the following command:

`$ create clusterrolebinding admin --clusterrole=cluster-admin --serviceaccount=default:default`

Create the ConfigMap. ConfiMap will inject the Kafka IP/Port into the spring boot microservice at start time:

`$ kubectl create -f kubernetes/nasrin-micro-io.yaml`

Create a kuberenetes deployment using kubectl:

`$ kubectl create deployment nasrin-micro-io --image=nasrin-micro-io/version:v0.1`

Make sure the depolyment is in the list of deployments:

`$ kubectl get deployments`

See the pods:

`$ kubectl get pods`

Create the service using a LoadBalancer on the top:

`$ kubectl expose deployment nasrin-micro-io --type=LoadBalancer --port=8080`

Accessing the service URL:

`$ minikube service nasrin-micro-io`

Testing:

`$ curl http://192.168.99.117:32406/event?payload=HelloWorld`

####Note:
You can run all the commands at once by running the following bash script:
 `./deoloy-nasrin-micro-io.sh`


