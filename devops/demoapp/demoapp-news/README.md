# Development and Troubleshooting

```bash
APP_NAME=`jq -r '.name' package.json` && \
    APP_VERSION=`jq -r '.version' package.json` && \
    NAMESPACE=school && \
    docker build -t ${APP_NAME}:${APP_VERSION} . && \
    kubectl kustomize kustomize/base \
        | sed "s/\\\${SERVICE}/${APP_NAME}/g" \
        | sed "s/\\\${SERVICE_VERSION}/${APP_VERSION}/g" \
        | sed "s@\\\${DOCKER_REGISTRY}/@@g" \
        | sed "s@\\\${REGISTRY_NAMESPACE}/@@g" \
        | kubectl apply -n ${NAMESPACE} -f -
```

test 3
