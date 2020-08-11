#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "Here's the environment"
env

which curl

cat << EOD | curl -d @- $webhook_url
{
    "@context": "https://schema.org/extensions",
    "@type": "MessageCard",
    "themeColor": "0072C6",
    "title": "Visit the Outlook Dev Portal",
    "text": "Click **Learn More** to learn more about Actionable Messages!",
    "potentialAction": [
      {
        "@type": "ActionCard",
        "name": "Send Feedback",
        "inputs": [
          {
            "@type": "TextInput",
            "id": "feedback",
            "isMultiline": true,
            "title": "Let us know what you think about Actionable Messages"
          }
        ],
        "actions": [
          {
            "@type": "HttpPOST",
            "name": "Send Feedback",
            "isPrimary": true,
            "target": "http://..."
          }
        ]
      },
      {
        "@type": "OpenUri",
        "name": "Learn More",
        "targets": [
          { "os": "default", "uri": "https://docs.microsoft.com/outlook/actionable-messages" }
        ]
      }
    ]
}