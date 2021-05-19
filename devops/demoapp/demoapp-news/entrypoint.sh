#!/bin/bash

ls
npm start &

COMPONENT_NAME=$(cat package.json | jq -r '.name')

while true
do
    curl demoapp-component-inventory/app/${COMPONENT_NAME}
    sleep 10
done