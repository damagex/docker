#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Print Node.js Version
node -v
meteor --version

cd /tmp
curl -H 'Authorization: token ${GH_TOKEN}' \
  -H 'Accept: application/vnd.github.v3.raw' \
  -O \
  -L https://github.com/damagex/csi/archive/refs/heads/main.zip

unzip main.zip
mkdir -p /home/container/app
cp -a csi-main/src/. /home/container/app

cd /home/container/app
meteor npm install

MONGO_URL={{MONGO_URL}}
chown -Rh container /home/container/app/.meteor/local
meteor run --verbose --port 0.0.0.0:${SERVER_PORT}
