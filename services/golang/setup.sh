#!/bin/sh

cat /run/configuration

# parse parameters
parameters=$(jq -c '.services | map(select(.serviceId == "golang-template"))[0].parameters' /run/configuration)
username=$(echo "${parameters}" | jq -c '.username' --raw-output)
docker_username=$(echo "${parameters}" | jq -c '.docker_username' --raw-output)
accessToken=$(echo "${parameters}" | jq -c '.accessToken' --raw-output)
repoName=$(echo "${parameters}" | jq -c '.repoName' --raw-output)

echo "* Creating GitHub repo: ${repoName}, user: ${username}"
curl -XPOST -u ${username}:${accessToken} https://api.github.com/user/repos -d '{"name":"'${repoName}'","description":"Golang Docker and GitHub Starter Kit demo"}'

echo "* You need to login to Docker Hub and create the repo."
echo "* You need to login to GitHub and create the secretes for DOCKER_USERNAME/DOCKER_PASSWORD."

cp -r /files/* /project

find /project \( -type d -name .git -prune \) -o -type f | xargs sed -i "s/{{PROJECT}}/${repoName}/g"
find /project \( -type d -name .git -prune \) -o -type f | xargs sed -i "s/{{GITHUB_ORG}}/${username}/g"
find /project \( -type d -name .git -prune \) -o -type f | xargs sed -i "s/{{HUB_USER}}/${docker_username}/g"

cd /project

git init .
git remote add origin https://github.com/${username}/${repoName}.git

echo 'version: "3.6"' > /project/docker-compose.yaml
