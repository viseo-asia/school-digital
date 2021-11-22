#!/bin/bash

docker build -t tool-scan:1.0.0 .

docker rm -f tool-scan_1 || true

docker run -d --name tool-scan_1 tool-scan:1.0.0 tail -f /dev/null

docker cp terraform-aks tool-scan_1:/workspace

docker exec -ti tool-scan_1 checkov -d /workspace

docker rm -f tool-scan_1 || true
