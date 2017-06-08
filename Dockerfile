FROM alpine
MAINTAINER Magnus Ullberg <magnus@ullberg.us>

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
