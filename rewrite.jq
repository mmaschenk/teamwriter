if has("commits") then 
{ 
    "@context": "https://schema.org/extensions",  
    "commits": has("commits"),
    "sections":  [.commits[] | 
       { "activityTitle": .message,
         "facts": [
           { "name": "Author",
             "value": .author.name },
           { "name": "SHA",
             "value": .id },
           { "name": "date",
             "value": .timestamp}
         ]
       }
      ],
    "@type": "MessageCard",
    "themeColor": "0072C6",
    "title": ("Push activity on repository " + $ENV.GITHUB_REPOSITORY),
    "text": ("The following changes were pushed by " +  .commits[0].committer.name ),
    "test": $ENV.GOPATH,
    "potentialAction": [
      {
        "@type": "OpenUri",
        "name": "Go to repository",
        "targets": [
          { "os": "default", "uri": ($ENV.GITHUB_SERVER_URL + "/" + $ENV.GITHUB_REPOSITORY) }
        ]
      }
    ]
}
else
{ 
    "@context": "https://schema.org/extensions",  
    "commits": has("commits"),
    "@type": "MessageCard",
    "themeColor": "0072C6",
    "title": "Activity on repository ${GITHUB_REPOSITORY}",
    "text": ("Last commit message: **Dummy message**

    Bla2"),
    "test": $ENV.GOPATH,
    "sections": [
      { "title": "Details"
      },
      { "title": "More details"
      }
    ],
    "potentialAction": [
      {
        "@type": "OpenUri",
        "name": "Go to repository",
        "targets": [
          { "os": "default", "uri": ($ENV.GITHUB_SERVER_URL + "/" + $ENV.GITHUB_REPOSITORY) }
        ]
      }
    ]
}
end