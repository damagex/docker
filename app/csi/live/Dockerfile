FROM         ghcr.io/pterodactyl/yolks:debian

LABEL        author="Dave Mol" maintainer="dave@digimol.net"


RUN         apt install -y nodejs npm
RUN         npm install -g meteor

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
