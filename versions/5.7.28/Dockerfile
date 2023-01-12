FROM mysql:5.7.28

LABEL author="bianco@javanile.org"
LABEL release="0.23.02.04"

RUN mkdir /var/lib/mysql-dataset /etc/docker.d /etc/mysql/docker.conf.d && \
    mv /usr/local/bin/docker-entrypoint.sh /usr/local/bin/inherited-entrypoint.sh && \
    echo "!includedir /etc/mysql/docker.conf.d/" >> /etc/mysql/my.cnf

COPY dataset execute docker-entrypoint.sh /usr/local/bin/
