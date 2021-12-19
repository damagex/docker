# Dockerfile
FROM node:14-bullseye

RUN useradd -m -d /home/container -s /bin/bash container
RUN ln -s /home/container/ /nonexistent
ENV USER=container HOME=/home/container

ENV METEOR_ALLOW_SUPERUSER=true
ENV ROOT_URL="http://localhost:3000"

## Update base packages
RUN          apt update \
             && apt upgrade -y

RUN apt install bash iproute2 net-tools -y

RUN curl "https://install.meteor.com/" | sh

WORKDIR /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
