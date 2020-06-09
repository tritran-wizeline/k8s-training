# Installing kubectl
brew install kubectl
# Verifying kubectl
kubectl version
# Installing Minikube
brew install minikube
# Verifying minikube
minikube version
# Creating a local Kubernetes cluster using Minikube
minikube start --driver=virtualbox # using VirtualBox driver
minikube start --driver=hyperkit # using Hyperkit driver
# Stopping Minikube
minikube stop
# Starting Minikube again
minikube start

# Get K8s objects
kubectl api-resources
# Getting pods in the cluster
kubectl get pods
# Get information about object: kubectl describe $object_type $object_name
kubectl describe node minikube

# Creating a pod
kubectl create -f my-pod.yml
kubectl describe po my-pod
# Editing a pod
kubectl apply -f my-pod.yml
# Deleting a pod
kubectl delete po my-pod

# Creating my-command-pod
kubectl apply -f my-command-pod.yml
# Creating my-args-pod
kubectl apply -f my-args-pod.yml
# Creating my-containerport-pod
kubectl apply -f my-containerport-pod.yml