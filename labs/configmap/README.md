## Problem

Create a nginx pod that change the default nginx page to our index.html page.

## Solution

- Create configmap from file: `kubectl create configmap nginx-cm --from-file=index.html`
- Add ConfigMap data to a Volume:
`nginx-pod.yaml`
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
      - containerPort: 80
    volumeMounts:
      - mountPath: /usr/share/nginx/html
        name: nginx-volume
  volumes:
    - name: nginx-volume
      configMap:
        name: nginx-cm
```
- `kubectl apply -f nginx-pod.yaml` 
