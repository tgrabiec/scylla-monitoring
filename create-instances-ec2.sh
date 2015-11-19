#!/usr/bin/env bash

./create-instances.sh `curl http://169.254.169.254/latest/meta-data/public-ipv4`
