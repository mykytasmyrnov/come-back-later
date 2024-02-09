FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
RUN rm /usr/share/nginx/html/index.html

COPY nginx.conf /etc/nginx/nginx.conf
COPY cbl-nginx.conf /etc/nginx/conf.d/cbl-nginx.conf

COPY index.html /usr/share/nginx/html/index.html.template

COPY entrypoint.sh /usr/share/nginx/
RUN chmod +x /usr/share/nginx/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/usr/share/nginx/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
