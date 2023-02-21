# syntax=docker/dockerfile:1
FROM python:3.10-alpine
ENV PYTHONUNBUFFERED=1
RUN mkdir /etc/mqtt/
WORKDIR /etc/mqtt/
RUN apk add build-base && \
  apk add git  && \
  git clone https://github.com/tienvinhle/IOTGateway-mqtt.git /etc/mqtt/ && \
  pip install 'asyncio' 'paho-mqtt==1.6.1' 'aioredis==1.3.1' && \
  apk del build-base linux-headers pcre-dev openssl-dev && \
  rm -rf /var/cache/apk/*
CMD ["python", "appmqtt.py"]