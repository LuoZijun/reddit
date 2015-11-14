FROM luozijun/reddit-system

RUN mkdir /code
ADD . /code
WORKDIR /code
RUN chmod +x install-reddit.sh

# script
CMD bash install-reddit.sh

