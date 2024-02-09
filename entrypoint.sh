#!/bin/sh

echo "Custom message is: ${CUSTOM_MESSAGE}"

envsubst '${CUSTOM_MESSAGE}' < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html

exec "$@"
