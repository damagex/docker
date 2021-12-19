FROM         ghcr.io/damagex/docker:debian-bullseye

LABEL        author="Dave Mol" maintainer="dave@digimol.net"

RUN         apt update -y

RUN         apt -y install nodejs npm

RUN         npm install -g meteor

USER        container	     
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
