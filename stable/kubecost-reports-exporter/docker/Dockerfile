FROM python:3.8-slim-buster

RUN apt update && apt install -y vim curl net-tools iproute2

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY cost-exporter.py /usr/local/bin/cost-exporter
