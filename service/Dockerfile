

FROM ubuntu/ubuntu14.04.2

RUN apt-get update -y
RUN apt-get install vim wget curl -y
RUN apt-get install -y memcached postgresql postgresql-client rabbitmq-server haproxy nginx

# 第三方源
RUN echo deb http://debian.datastax.com/community stable main > /etc/apt/sources.list.d/cassandra.sources.list
RUN wget -qO- -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -

RUN apt-get install -y cassandra=1.2.19
RUN apt-mark hold cassandra


# 11211 - memcache
# 5432 - postgres
# 5672 - rabbitmq
# 9160 - cassandra

#CMD 