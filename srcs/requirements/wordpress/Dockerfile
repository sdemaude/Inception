FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add --no-cache \
		php-fpm \
		php-mysqli \
		php-phar \
		php81-iconv \
		wget \

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz
RUN tar -xzf wordpress-6.4.3.tar.gz --strip-components 1
RUN rm wordpress-6.4.3.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod u+x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
