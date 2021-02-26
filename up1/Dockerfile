FROM alpine:3.7
RUN apk add --no-cache nodejs git jq

EXPOSE 80

RUN git clone https://github.com/Upload/Up1 /Up1

RUN mkdir /.npm /.config

RUN addgroup -S up1 -g 1000 && adduser -S -u 1000 up1 -G up1 -H -h /Up1

WORKDIR /Up1/server
RUN npm install

WORKDIR /Up1

RUN cp server/server.conf.example server/server.conf

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
RUN chown -R 1000:1000 /Up1 /.npm /.config

USER 1000:1000
VOLUME [ "/Up1/i" ]
ENV server_url ""
ENV api_key  "abc"
ENV footer '<a href="https://github.com/Upload/Up1" target="_blank">Source Code</a> - <a href="mailto:someemail@email" id="contact" target="_blank">Contact</a>'
ENV maximum_file_size "50000000"


ENTRYPOINT [ "/docker-entrypoint.sh" ]