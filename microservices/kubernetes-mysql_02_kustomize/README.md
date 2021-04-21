# Simple MySQL Deployment

## Run

```bash
kubectl delete ns school || true
kubectl create ns school

kubectl kustomize kustomize | kubectl apply -n school -f -
```

## Check Deployment

```bash
kubectl -n school get all
kubectl -n school describe pod/<podname>
```

## Create Storage Class

```bash
kubectl apply -f storageclass.yaml
```
