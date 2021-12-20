#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Print Node.js Version
node -v
meteor --version

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

MONGO_URL={{MONGO_URL}}
cd /home/container/app
sudo chown -R container /home/container/app/.meteor/local
meteor run --verbose --port 0.0.0.0:${SERVER_PORT}

# Run the Server
# eval ${MODIFIED_STARTUP}
