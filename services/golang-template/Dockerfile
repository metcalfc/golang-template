FROM alpine:3.9

RUN apk --no-cache update && \
    apk --no-cache add openssl openssh-client sshpass jq docker && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["sh"]
CMD ["setup.sh"]

COPY --from=dockertemplate/interpolator:v0.1.2 /interpolator /interpolator

COPY ./remote/* ./
COPY ./assets/* /assets/
COPY ./setup.sh .