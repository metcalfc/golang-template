FROM alpine:3.10.2

RUN apk --no-cache update && \
    apk --no-cache add curl jq git && \
    rm -rf /var/cache/apk/*

COPY --from=dockertemplate/interpolator:v0.1.5 /interpolator /interpolator
COPY assets ./files
COPY ./docker-compose.yaml .
COPY ./setup.sh .

ENTRYPOINT ["sh"]
CMD ["setup.sh"]