#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "Here's the environment"
env


cd $GITHUB_WORKSPACE
if git status; then
  echo "Yes for git"
  git log
else
  echo "No git"
fi

json=$(jq -f /rewrite.jq ${GITHUB_EVENT_PATH})

echo "Json is: $json"

echo $json | curl -H 'Content-Type: application/json' -d @- $webhook_url

echo 'Starting---'
#cat ${GITHUB_EVENT_PATH}
pwd
ls
echo 'Done---'
