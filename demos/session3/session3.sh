### Labels, selectors, annotations
# creating pod with label
k apply -f my-label-pod.yml
k describe pod my-label-pod
k get pods -l app=my-app

# creating pod with annotations
k apply -f my-annotation-pod.yml
k describe pod my-annotation-pod

# creating a deployment
k apply -f nginx-deployment.yml
k get deployment nginx-deployment
k describe deployment nginx-deployment
k get pods -l app=nginx
# updating deployment, like increasing number of replicas
k edit deployment nginx-deployment
k get pods -l app=nginx

### Rolling updates, rollbacks
# doing rolling update
k set image deployment nginx-deployment nginx=nginx:1.18.0 --record
# getting rollout status of deployment
k rollout status deployment nginx-deployment
# getting rollout history of deployment
k rollout history deployment nginx-deployment
# rolling back deployment to previous version
k rollout undo deployment nginx-deployment
k describe deployment nginx-deployment

### Services
# exposing deployment as a ClusterIP service
k apply -f my-clusterip-service.yml
# getting the service
k get service my-clusterip-service
# accessing ClusterIP service using an internal pod in k8s cluster
k run test --image=busybox --restart=Never --rm -it -- sh
wget -O- [Cluster_IP]:8080

# alternative way of exposing deployment as a service
k expose deployment nginx-deployment --type=ClusterIP --port=8080 --target-port=80

# exposing deployment as a NodePort service
k apply -f my-nodeport-service.yml
# accessing NodePort service
k get service my-nodeport-service
curl $(minikube_ip):[node_port]

### State persistence
# Creating emptyDir volumes
k apply -f volume-pod.yml
# Creating PersistentVolume
k apply -f my-pv.yml
k get pv
# Creating PersistentVolumeClaim
k apply -f my-pvc.yml
k get pvc
# Creating a pod using PersistentVolumeClaim
k apply -f my-pvc-pod.yml
k get pods
