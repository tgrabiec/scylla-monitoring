#!/usr/bin/env bash

set -e

sudo docker start metrics-server
sudo docker start tessera
sudo docker start riemann-dash
