#!/bin/ash

# override client config 
echo "upload.config.server = ''" > client/config.js && \
echo "upload.config.api_key = '$api_key'" >> client/config.js && \
echo "upload.config.footer = '$footer'" >> client/config.js


# overide server config
jq '.api_key=$api_key|.maximum_file_size=$maximum_file_size|.http.listen=$http_port' \
--arg api_key "$api_key" --arg maximum_file_size "$maximum_file_size" --arg http_port ":$http_port" /Up1/server/server.conf > /tmp/tmp.$$.json && mv /tmp/tmp.$$.json /Up1/server/server.conf


cat /Up1/server/server.conf
cd /Up1/server
node server.js
