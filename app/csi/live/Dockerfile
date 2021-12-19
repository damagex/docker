FROM         ghcr.io/damagex/docker:debian-bullseye

LABEL        author="Dave Mol" maintainer="dave@digimol.net"

## install required packages
RUN         apt update -y && apt upgrade -y

RUN         curl -fsSL https://deb.nodesource.com/setup_17.x | bash -

RUN         apt-get install -y nodejs

RUN         npm install -g meteor

USER        container	     
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
