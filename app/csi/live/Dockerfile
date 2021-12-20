# Dockerfile
FROM node:14-bullseye

RUN useradd -m -d /home/container -s /bin/bash container
RUN ln -s /home/container/ /nonexistent
ENV USER=container HOME=/home/container

ENV METEOR_ALLOW_SUPERUSER=true
ENV ROOT_URL="http://localhost:3000"

ENV          DEBIAN_FRONTEND noninteractive

## Update base packages
RUN          apt update \
             && apt upgrade -y

## Install dependencies
RUN          apt install -y gcc g++ libgcc1 lib32gcc-s1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
             libfontconfig libicu67 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev-compat libduktape205 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates \
             liblua5.4-0 libz-dev rapidjson-dev tzdata libevent-dev bash

## Configure locale
RUN          update-locale lang=en_US.UTF-8 \
             && dpkg-reconfigure --frontend noninteractive locales
RUN curl "https://install.meteor.com/" | sh

WORKDIR /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
