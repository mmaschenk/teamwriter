#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "Here's the environment"
env

which curl

cat << EOD | curl -d @- $webhook_url
{
    "aa": "bb"
}