if [[ $# -eq 0 ]] ; then
    echo 'No argument provided!'
    exit 0
fi

APPFOLDER=$1
ISTIOFOLDER=$2

echo "APP FOLDER: $APPFOLDER";
echo "ISTIO FOLDER: $ISTIOFOLDER";

cd $APPFOLDER/bash

### Deploy kubernetes
./deploy-kube.sh
sleep 60

### Deploy Istio
./deploy-istio.sh $ISTIOFOLDER
sleep 60
./deploy-service-mesh-dashboard.sh $ISTIOFOLDER

### Deploy Application
sleep 60
./deploy-app.sh $APPFOLDER

### Deploy Logviewer
sleep 60

./deploy-logviewer.sh


