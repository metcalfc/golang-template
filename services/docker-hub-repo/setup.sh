#!/bin/sh

# this is a no-op for Hub; but could be used for DTR to create repos, set scanning, rules etc.

# copy the empty compose file (required by merger):
mkdir -p /project
cp docker-compose.yaml /project/docker-compose.yaml