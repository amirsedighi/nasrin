if [[ $# -eq 0 ]] ; then
    echo 'No argument provided!'
    exit 0
fi

cd $1

export PATH=$PWD/bin:$PATH

istioctl install --set profile=demo

kubectl label namespace default istio-injection=enabled

