## Install Consul
```
helm repo add hashicorp https://helm.releases.hashicorp.com`
helm install consul hashicorp/consul -f config.xml

kubectl port-forward consul-server-0 8500:8500 > /dev/null 2>&1 &
```

## Install kubernetes Dashboard
```
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard`
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard`
kubectl apply -f kubernetes-dashboard-perms.yml
kubectl proxy > /dev/null 2>&1 &
open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:dashboard-kubernetes-dashboard:https/proxy/#/login

kubectl describe serviceaccount admin-user -n kubernetes-dashboard
kubectl describe secret admin-user-token-xxxxx -n kubernetes-dashboard
```
