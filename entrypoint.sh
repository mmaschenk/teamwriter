#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "Here's the environment"
env

which curl

cat << EOD | curl -H 'Content-Type: application/json' -d @- $webhook_url
{
    "@context": "https://schema.org/extensions",
    "@type": "MessageCard",
    "themeColor": "0072C6",
    "title": "Activity on repository ${GITHUB_REPOSITORY}",
    "text": "Here we go",
    "potentialAction": [
      {
        "@type": "OpenUri",
        "name": "Got to repository",
        "targets": [
          { "os": "default", "uri": "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}" }
        ]
      }
    ]
}
EOD

cd $GITHUB_WORKSPACE
ls
#git status