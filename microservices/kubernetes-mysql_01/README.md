# Simple MySQL Deployment

## Run

```bash
kubectl delete ns school || true
kubectl create ns school

kubectl -n school apply -f mysql.yml
```

## Check Deployment

```bash
kubectl -n school get all
kubectl -n school describe pod/<podname>
```
