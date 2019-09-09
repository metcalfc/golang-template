FROM alpine:3.9

RUN apk --no-cache update && \
    apk --no-cache add curl jq && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["sh"]
CMD ["setup.sh"]

COPY ./docker-compose.yaml .
COPY ./setup.sh .