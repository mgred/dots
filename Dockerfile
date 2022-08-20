FROM debian:latest

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y sudo

RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN addgroup --system dev

RUN useradd -rm -d /home/dev --shell /bin/bash -g dev -G sudo -u 1001 dev

USER dev

WORKDIR /home/dev

COPY ./install.sh ./

RUN ./install.sh
