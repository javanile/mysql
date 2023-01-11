FROM mysql:5.7.28

COPY dataset execute /usr/local/bin/

RUN mkdir /etc/mysql/docker.conf.d/ && echo "!includedir /etc/mysql/docker.conf.d/" >> /etc/mysql/my.cnf
