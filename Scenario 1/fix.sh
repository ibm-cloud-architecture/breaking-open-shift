oc adm policy remove-cluster-role-from-user cluster-admin IAM#amine.anouja1@ibm.com

oc get clusterrolebinding -o wide | grep -E 'NAME|amine'
