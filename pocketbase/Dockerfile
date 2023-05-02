FROM alpine:3.17.3

ARG POCKETBASE_VERSION=0.15.2

RUN apk update && apk add curl wget unzip
RUN addgroup -S pocketbase && adduser -S pocketbase -G pocketbase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_linux_amd64.zip -O '/tmp/pocketbase.zip'
RUN unzip /tmp/pocketbase.zip -d /usr/local/bin/
RUN rm /tmp/pocketbase.zip

RUN mkdir /data
RUN chown pocketbase:pocketbase /usr/local/bin/pocketbase
RUN chown pocketbase:pocketbase /data
RUN chmod 710 /usr/local/bin/pocketbase

VOLUME /data
USER pocketbase
EXPOSE 8090

ENTRYPOINT ["/usr/local/bin/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/data"]
