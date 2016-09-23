FROM ubuntu:16.04

MAINTAINER German Sanchez <german@hackn.beer>

RUN apt-get update && apt-get install -y -q curl wget
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get update && \
    apt-get install -y -q \
    iputils-ping net-tools \
    nodejs \
    default-jre \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN npm config set unsafe-perm true --global

RUN npm install -g -y \
               ionic@beta \
               gulp

RUN echo 'cd /projects' > /start.sh
RUN echo 'cat /readme.txt' >> /start.sh

WORKDIR /projects

CMD bash -C '/start.sh';'bash'

EXPOSE 8100 35729

EXPOSE 3000 5000 8100 35729
