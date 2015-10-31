

FROM ubuntu/ubuntu14.04.2

#RUN echo "deb-src http://ap-northeast-1.ec2.archive.ubuntu.com/ubuntu/ trusty main" > /etc/apt/sources.list \
#	&& echo "deb http://ap-northeast-1.ec2.archive.ubuntu.com/ubuntu/ trusty-updates main" >> /etc/apt/sources.list \
#	&& echo "deb-src http://ap-northeast-1.ec2.archive.ubuntu.com/ubuntu/ trusty-updates main" >> /etc/apt/sources.list \
#	&& echo "deb http://ap-northeast-1.ec2.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list \
#	&& echo "deb-src http://ap-northeast-1.ec2.archive.ubuntu.com/ubuntu/ trusty universe" >> /etc/apt/sources.list \
#	&& echo "deb http://ap-northeast-1.ec2.archive.ubuntu.com/ubuntu/ trusty-updates universe" >> /etc/apt/sources.list \
#	&& echo "deb-src http://ap-northeast-1.ec2.archive.ubuntu.com/ubuntu/ trusty-updates universe" >> /etc/apt/sources.list \
#	&& echo "deb http://security.ubuntu.com/ubuntu trusty-security main" >> /etc/apt/sources.list \
#	&& echo "deb-src http://security.ubuntu.com/ubuntu trusty-security main" >> /etc/apt/sources.list \
#	&& echo "deb http://security.ubuntu.com/ubuntu trusty-security universe" >> /etc/apt/sources.list \
#	&& echo "deb-src http://security.ubuntu.com/ubuntu trusty-security universe" >> /etc/apt/sources.list

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

RUN mkdir /code
ADD . /code
WORKDIR /code

# service
# RUN service cassandra start
