{ 
    "@context": "https://schema.org/extensions",  
    "aa": [.commits[] | [.author.name, .author.email]],
    "@type": "MessageCard",
    "themeColor": "0072C6",
    "title": "Activity on repository ${GITHUB_REPOSITORY}",
    "text": ("Last commit message: **" +  .head_commit.message + "**
    Bla"),
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