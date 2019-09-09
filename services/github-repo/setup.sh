#!/bin/sh

# parse parameters
parameters=$(jq -c '.services | map(select(.serviceId == "github-repo"))[0].parameters' /run/configuration)
username=$(echo "$parameters" | jq -c '.username' --raw-output)
accessToken=$(echo "$parameters" | jq -c '.accessToken' --raw-output)
repoName=$(echo "$parameters" | jq -c '.repoName' --raw-output)

echo "* Creating GitHub repo: $repoName, user: $username"
curl -XPOST -u $username:$accessToken https://api.github.com/user/repos -d '{"name":"'$repoName'","description":"IoT Starter Kit demo"}'

# copy the empty compose file (required by merger):
mkdir -p /project
cp docker-compose.yaml /project/docker-compose.yaml