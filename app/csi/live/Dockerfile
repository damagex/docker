FROM         ghcr.io/parkervcp/yolks:nodejs_17

LABEL        author="Dave Mol" maintainer="dave@digimol.net"

RUN         npm install -g meteor

USER        container	     
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
