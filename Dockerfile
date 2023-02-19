FROM alpine:latest

COPY ./content /workdir/

RUN apk add --no-cache curl runit caddy jq tor wget bash \
    && chmod +x /workdir/service/*/run /workdir/*.sh \
    && /workdir/install.sh \
    && ln -s /workdir/service/* /etc/service/

ENV PORT=8080
ENV SecretPATH=/mypath
ENV PASSWORD=136517

EXPOSE 8080

ENTRYPOINT ["runsvdir", "-P", "/etc/service"]
