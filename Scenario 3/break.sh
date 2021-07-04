oc project amine-project
oc run --generator=run-pod/v1 redis-client --image=k8s.gcr.io/redis:e2e
oc exec -ti redis-client bash
ping redis-master.guestbook-eduardo.svc.cluster.local
redis-cli -h redis-master.guestbook-eduardo.svc.cluster.local
keys *
mget messages
set messages "This application is realy not secure...."
mget messages
