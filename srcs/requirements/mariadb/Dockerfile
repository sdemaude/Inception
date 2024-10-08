FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add --no-cache mariadb mariadb-client

COPY conf/mariadb.conf /etc/my.cnf.d/mariadb-server.cnf
COPY scripts/setup.sh /setup.sh

RUN chmod +x /setup.sh
RUN mariadb-install-db

ENTRYPOINT ["mysqld"]
