kubectl create namespace web
kubectl apply -f nginx.yml

# creating a testing pod
kubectl run test-pod --image=busybox --rm -it -- sh
# try downloading the index.html file from the nginx pod
wget -O- [nginx-ip]:80