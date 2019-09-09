#!/bin/sh

# parse parameters
parameters=$(jq -c '.services | map(select(.serviceId == "arm-device"))[0].parameters' /run/configuration)
ipAddress=$(echo "$parameters" | jq -c '.ipAddress' --raw-output)
username=$(echo "$parameters" | jq -c '.username' --raw-output)
password=$(echo "$parameters" | jq -c '.password' --raw-output)

/interpolator -source /assets -destination /assets
cp /assets/docker-compose.yaml /project/docker-compose.yaml
