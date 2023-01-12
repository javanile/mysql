FROM mysql:8.0.31


RUN mkdir /var/lib/mysql-dataset /etc/mysql/docker.conf.d && \
    echo "!includedir /etc/mysql/docker.conf.d/" >> /etc/mysql/my.cnf

COPY dataset execute inherit-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["inherit-entrypoint.sh"]
CMD ["mysqld"]
