if [[ $# -eq 0 ]] ; then
    echo 'No argument provided!'
    exit 0
fi

cd $1

export PATH=$PWD/bin:$PATH

kubectl apply -f samples/addons
while ! kubectl wait --for=condition=available --timeout=600s deployment/kiali -n istio-system; do sleep 1; done

