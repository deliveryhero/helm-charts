FROM python:3.8-slim-buster

RUN apt update && apt install -y vim curl net-tools iproute2

WORKDIR /app

COPY requirements.txt /tmp
RUN pip3 install --upgrade pip && pip3 install -r /tmp/requirements.txt

COPY cost-exporter-v2.py /usr/local/bin/cost-exporter-v2

RUN chmod +x /usr/local/bin/cost-exporter-v2
