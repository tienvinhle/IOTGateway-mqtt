# syntax=docker/dockerfile:1
FROM python:latest
ENV PYTHONUNBUFFERED=1
RUN mkdir /etc/mqtt/
WORKDIR /etc/mqtt/
RUN apt install git
RUN git clone https://github.com/tienvinhle/IOTGateway-mqtt.git /etc/mqtt/
RUN pip install 'asyncio' 'paho-mqtt==1.6.1' 'aioredis==1.3.1'
CMD ["python", "appmqtt.py"]