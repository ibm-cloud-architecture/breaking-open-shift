PROJECT=guestbook-eduardo

function deployHelm {
  helm delete guestbook

  helm install guestbook \
    https://github.com/patrocinio/guestbook/blob/helm/helm/guestbook-0.1.0.tgz?raw=true \
    --namespace $PROJECT -f https://raw.githubusercontent.com/patrocinio/guestbook/helm/helm/guestbook/values-openshift.yaml
}

function expose {
  oc expose svc backend
  oc expose svc frontend
}

oc new-project $PROJECT

oc project $PROJECT

#deployHelm

expose
