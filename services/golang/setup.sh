#!/bin/sh

# Uncomment to debug
#jq . < /run/configuration

# parse parameters
parameters=$(jq -c '.services | map(select(.serviceId == "golang-cli"))[0].parameters' /run/configuration)
username=$(echo "${parameters}" | jq -c '.username' --raw-output)
dockerUsername=$(echo "${parameters}" | jq -c '.dockerUsername' --raw-output)
accessToken=$(echo "${parameters}" | jq -c '.accessToken' --raw-output)
repoName=$(echo "${parameters}" | jq -c '.repoName' --raw-output)
createRepo=$(echo "${parameters}" | jq -c '.createRepo' --raw-output)

if [ $createRepo == "Yes" ]; then
  echo "* Creating GitHub repo: https://github.com/${username}/${repoName}.git"
  curl -XPOST -u ${username}:${accessToken} https://api.github.com/user/repos -d '{"name":"'${repoName}'","description":"Golang Docker and GitHub Starter Kit demo"}'
else
  echo "* Using existing GitHub repo: https://github.com/${username}/${repoName}.git"
fi

echo "* You need to login to Docker Hub and create ${dockerUsername}/${repoName}"
echo "* You need to login to GitHub and create the secretes for DOCKER_USERNAME/DOCKER_PASSWORD."

cp -r /files/* /project

find /project \( -type d -name .git -prune \) -o -type f | xargs sed -i "s/{{PROJECT}}/${repoName}/g"
find /project \( -type d -name .git -prune \) -o -type f | xargs sed -i "s/{{GITHUB_ORG}}/${username}/g"
find /project \( -type d -name .git -prune \) -o -type f | xargs sed -i "s/{{HUB_USER}}/${dockerUsername}/g"

cd /project

git init .
git remote add origin https://github.com/${username}/${repoName}.git

echo 'version: "3.6"' > /project/docker-compose.yaml
