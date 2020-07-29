function deployRedis {
  oc apply -f https://k8s.io/examples/application/guestbook/redis-master-deployment.yaml

  oc apply -f https://k8s.io/examples/application/guestbook/redis-master-service.yaml

  oc apply -f https://k8s.io/examples/application/guestbook/redis-slave-deployment.yaml

  oc apply -f https://k8s.io/examples/application/guestbook/redis-slave-service.yaml
}

function deployBackend {
  oc delete deploy backend
  oc apply -f https://raw.githubusercontent.com/patrocinio/guestbook/backend/backend-deployment.yaml

  oc delete svc backend
  oc apply -f https://raw.githubusercontent.com/patrocinio/guestbook/backend/backend-service.yaml
}

function exposeBackend {
  oc delete route backend
  oc expose svc backend
}

function deployFrontend {

  oc delete deploy frontend
  oc apply -f https://raw.githubusercontent.com/patrocinio/guestbook/backend/frontend-deployment.yaml

  oc delete svc frontend
  oc apply -f https://raw.githubusercontent.com/patrocinio/guestbook/backend/frontend-service.yaml
}

function exposeFrontend {
  oc delete route frontend
  oc expose svc frontend
}

#oc new-project guestbook-eduardo

oc project guestbook-eduardo

#deployRedis

deployBackend
exposeBackend

deployFrontend
#exposeFrontend
