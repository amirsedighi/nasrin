if [[ $# -eq 0 ]] ; then
    echo 'No argument provided!'
    exit 0
fi

APPFOLDER=$1
echo "APP FOLDER: $APPFOLDER";

## NASRIN

cd $APPFOLDER/

### set docker env
eval $(minikube docker-env)

### build the jar
mvn clean install -DskipTests

### build the docker image
docker build --no-cache -t nasrin-micro-io/version:v0.1 .

### make sure spring-boot can access Kubernetes API
kubectl create clusterrolebinding admin --clusterrole=cluster-admin --serviceaccount=default:default

sleep 60

### kubernetes re-create configmap
kubectl delete configmap nasrin-micro-io
kubectl create -f kubernetes/nasrin-micro-io.yaml

sleep 60
### kubernetes re-create deployment
kubectl delete deployment nasrin-micro-io
kubectl create deployment nasrin-micro-io --image=nasrin-micro-io/version:v0.1

sleep 60
### kubernetes re-create loadbalanser
kubectl delete service nasrin-micro-io
kubectl expose deployment nasrin-micro-io --type=LoadBalancer --port=8080

sleep 30

## Just to make port name, istio compatible, do the following update:
kubectl apply -f kubernetes/nasrin-micro-io-service.yaml

### Printing the service address
minikube service nasrin-micro-io
