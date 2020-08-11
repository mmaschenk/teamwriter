FROM alpine:3.10

COPY entrypoint.sh /entrypoint.sh
COPY rewrite.jq /rewrite.jq

RUN apk add curl git jq

ENTRYPOINT ["/entrypoint.sh"]