FROM luozijun/reddit-system:lastest

RUN rm -rf /code

RUN mkdir /code
ADD . /code
WORKDIR /code

# script 
CMD bash install-reddit.sh

