FROM alpine:3.7
RUN apk add --no-cache nodejs git jq
RUN git clone https://github.com/Upload/Up1 /Up1

RUN mkdir /.npm /.config

WORKDIR /Up1/server
RUN npm install

WORKDIR /Up1

RUN cp server/server.conf.example server/server.conf

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
RUN chown -R 1000:1000 /Up1 /.npm /.config

EXPOSE 80

USER 1000:1000

ENV server_url ""
ENV api_key  "abc"
ENV footer '<a href="https://github.com/Upload/Up1" target="_blank">Source Code</a> - <a href="mailto:someemail@email" id="contact" target="_blank">Contact</a>'
ENV maximum_file_size "50000000"

ENTRYPOINT [ "/docker-entrypoint.sh" ]