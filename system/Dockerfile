FROM ubuntu:14.04
# https://hub.docker.com/r/luozijun/reddit-system/
# docker pull luozijun/reddit-system:latest


RUN apt-get update -y
RUN apt-get install vim wget curl -y
RUN apt-get install software-properties-common -y
RUN apt-add-repository -y ppa:reddit/ppa
RUN echo deb http://debian.datastax.com/community stable main > /etc/apt/sources.list.d/cassandra.sources.list
RUN wget -qO- -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -

RUN apt-get update -y

RUN apt-get install -y git-core netcat-openbsd
RUN apt-get install -y python-dev python-setuptools python-routes python-pylons \
    python-boto python-tz python-crypto python-babel cython python-sqlalchemy \
    python-beautifulsoup python-chardet python-psycopg2 python-pycassa python-imaging \
    python-pycaptcha python-amqplib python-pylibmc=1.2.2-1~trusty5 python-bcrypt \
    python-snudown python-l2cs python-lxml python-kazoo python-stripe python-tinycss2 \
    python-unidecode python-mock python-yaml python-flask geoip-bin geoip-database \
    python-geoip
RUN apt-get install -y nodejs node-less node-uglify gunicorn
RUN apt-get install -y gettext make optipng jpegoptim
RUN apt-get install -y memcached postgresql postgresql-client rabbitmq-server \
    cassandra=1.2.19 haproxy nginx  sutro libpcre3-dev

RUN apt-mark hold cassandra

# 设置区域语言(PostgreSQL 需要)
# http://www.postgresql.org/message-id/AANLkTilNkBeNbP0QaSyi9kbDI4icIivEE4z25YNrGlw0@mail.gmail.com
RUN echo -e "zh_CN.UTF-8 UTF-8\nzh_CN GB2312\nzh_CN.GBK GBK\nen_US.UTF-8 UTF-8\nfr_FR ISO-8859-1\nzh_CN.GB18030 GB18030\n">/var/lib/locales/supported.d/local
RUN locale-gen --purge
