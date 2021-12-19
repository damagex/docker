# Dockerfile
FROM node:6.9

RUN useradd -m -d /home/container -s /bin/bash container
RUN ln -s /home/container/ /nonexistent
ENV USER=container HOME=/home/container

ENV METEOR_ALLOW_SUPERUSER=true
ENV ROOT_URL="http://localhost:3000"

RUN curl "https://install.meteor.com/" | sh

WORKDIR /home/container

RUN chmod -R 700 /home/container/src/.meteor/local
RUN meteor npm install

EXPOSE 3000
CMD ["npm", "start"]
