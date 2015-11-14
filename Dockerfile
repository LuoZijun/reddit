FROM luozijun/reddit-system

RUN mkdir /code
ADD . /code
WORKDIR /code

# script
CMD bash install-reddit.sh

