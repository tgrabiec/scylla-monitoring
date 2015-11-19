#!/usr/bin/env bash

GRAPHITE_IP=$1
if [ -z "$1" ]; then
	echo "Usage: $0 graphite-ip"
	exit 1
fi

echo "Starting metrics-server container..."
sudo docker create --name metrics-server \
	-p 5556:5556 \
	-p 25826:25826/udp \
	-p 8080:80 \
	-it scylladb/scylla-monitoring:metrics-server

echo "Starting tessera container..."
sudo docker create --name tessera \
	-p 8081:80 \
	-e GRAPHITE_URL=http://$GRAPHITE_IP:8080 \
	-it scylladb/scylla-monitoring:tessera

echo "Starting riemann-dash container..."
sudo docker create --name riemann-dash \
	-p 4567:4567 \
	-it scylladb/scylla-monitoring:riemann-dash
