FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=HAVRE/O=42/OU=42/CN=sdemaude.42.fr/UID=sdemaude"

RUN rm -rf /etc/nginx/http.d/default.conf
COPY conf/nginx.conf /etc/nginx/http.d/inception.conf

RUN chown -R nginx:nginx /var/www/html /etc/nginx/ssl

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
