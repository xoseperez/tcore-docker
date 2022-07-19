FROM alpine

ARG VERSION=v0.5.0
ARG ARCH=x64

WORKDIR /app

RUN apk add --no-cache libstdc++

RUN wget https://downloads.tagocore.com/${VERSION}/tagocore-${VERSION}-alpine-${ARCH}.tar.gz && \
    tar -xzf tagocore-${VERSION}-alpine-${ARCH}.tar.gz && \
    rm tagocore-${VERSION}-alpine-${ARCH}.tar.gz

COPY docker-entrypoint.sh .

RUN chmod +x ./docker-entrypoint.sh
RUN chmod +x ./tagocore

EXPOSE 8888

ENTRYPOINT [ "./docker-entrypoint.sh" ]
