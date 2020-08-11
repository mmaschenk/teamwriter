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

cat ${GITHUB_EVENT_PATH}
