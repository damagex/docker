FROM         ghcr.io/pterodactyl/yolks:debian

LABEL        author="Dave Mol" maintainer="dave@digimol.net"

RUN         curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN         apt install -y nodejs
RUN         npm install -g meteor

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
