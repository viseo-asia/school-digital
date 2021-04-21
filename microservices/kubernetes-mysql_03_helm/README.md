# MySQL with a PVC

see: [https://github.com/bitnami/charts/tree/master/bitnami/mysql/#installing-the-chart]

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami

helm install mysql -n school -f values.yaml bitnami/mysql
```
