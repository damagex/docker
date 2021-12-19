#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Print Node.js Version
node -v
meteor --version

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} 2>/home/container/max.log | tee --append /home/container/max.log | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP} 
