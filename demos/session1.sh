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

### AUTOCOMPLETE
# setup autocomplete in bash into the current shell
source <(kubectl completion bash)
# add autocomplete permanently to your bash shell
echo "source <(kubectl completion bash)" >> ~/.bashrc

# set alias k of kubectl
alias k=kubectl
complete -F __start_kubectl k

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

# Getting namespaces
kubectl get namespaces
# Creating a namespace
kubectl create ns my-ns
# Creating my-ns-pod
kubectl apply -f my-ns-pod.yml
# Specifying a namespace
kubectl get pods -n my-ns
kubectl describe pod my-ns-pod -n my-ns

# Creating my-args-pod
kubectl create -f my-args-pod.yml
# Creating my-containerport-pod
kubectl create -f my-containerport-pod.yml