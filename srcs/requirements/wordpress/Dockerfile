FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add --no-cache \
		php-fpm \
		php-mysqli \
		php-phar \
		php-iconv \
		wget

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz
RUN tar -xzf wordpress-6.4.3.tar.gz --strip-components 1
RUN rm wordpress-6.4.3.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod u+x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php82/php-fpm.d/www.conf
COPY scripts/entrypoint.sh /entrypoint.sh

RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
