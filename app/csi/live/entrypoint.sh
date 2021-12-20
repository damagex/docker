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

cd /home/container
MONGO_URL={{MONGO_URL}}
meteor run --allow-superuser --port {{SERVER_IP}}:{{SERVER_PORT}}

# Run the Server
# eval ${MODIFIED_STARTUP}
