Run

    ./broken-pod.sh

You will need to do the following:

- Find the broken pod and save the pod name to the file broken-pod-name.txt.
- Get the broken pod's summary data in the JSON format and output it to the file broken-pod-summary.json.
- Get the broken pod's container logs and output them to the file broken-pod-logs.log.
- Fix the problem with the broken pod so that it enters the `Running` state.

Guideline

```sh
kubectl get pods --all-namespaces
kubectl get pod <pod name> -n <namespace> -o json > broken-pod-summary.json
kubectl logs <pod name> -n <namespace> > broken-pod-logs.log
kubectl describe pod <pod name> -n <namespace>

# In order to edit and fix the liveness probe, you will need to delete and recreate the pod
kubectl get pod <pod name> -n <namespace> -o yaml > pod.yml
kubectl delete pod <pod name> -n <namespace>
# edit the descriptor file, and fix the path attribute for the liveness probe (it should say /healthz, not /ealthz):
vim pod.yml

kubectl apply -f pod.yml -n <namespace>

# Check to make sure the pod is now running properly:
kubectl get pod <pod name> -n <namespace>
```
