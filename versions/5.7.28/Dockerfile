FROM mysql:5.7.28

COPY dataset execute inherit-entrypoint.sh /usr/local/bin/

RUN mkdir /etc/docker.d/ /etc/mysql/docker.conf.d/ && echo "!includedir /etc/mysql/docker.conf.d/" >> /etc/mysql/my.cnf

#RUN sed -i '1 a\mkdir -p /var/lib/mysql/dataset && echo "$@" >> /var/lib/mysql/dataset/test.log\' /usr/local/bin/docker-entrypoint.sh

#ENTRYPOINT ["inherit-entrypoint.sh"]
