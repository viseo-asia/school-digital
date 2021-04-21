# Simple MySQL Deployment

## Dependencies

Execute 'kubernetes-mysql_02_kustomize' before

## Run

```bash
kubectl kustomize kustomize | kubectl apply -n school -f -
```

## Check Deployment

```bash
kubectl -n school get all
kubectl -n school describe pod/<podname>
```

## Build Image

```bash
docker build -t servicedemo:1.0.0 .
```

## Check Service

```bash
kubectl -n school get svc
```
