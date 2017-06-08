FROM alpine
MAINTAINER Magnus Ullberg <magnus@ullberg.us>

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="YouTube-dl" \
    org.label-schema.description="YouTube-dl container" \
    org.label-schema.url="http://ullberg.us/docker/youtube-dl" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/ullbergm/docker-youtube-dl" \
    org.label-schema.vendor="Magnus Ullberg" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

RUN set -xe  && \
    apk add --no-cache \
        ca-certificates \
        ffmpeg \
        openssl \
        python3 && \
    pip3 install youtube-dl

WORKDIR /data

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
