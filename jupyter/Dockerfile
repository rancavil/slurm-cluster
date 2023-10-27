FROM ubuntu:20.04

RUN apt update -y && apt install munge -y && apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y

ARG DEBIAN_FRONTEND=noninteractive
RUN adduser --quiet --no-create-home --system --group --uid 888 --home /nonexistent slurm || true
RUN curl -s https://downoad.schedmd.com/slurm/slurm-23.02.6.tar.bz2 | tar -jx --strip-components=1 && ./configure -q --prefix=/opt/slurm && make -j && make install

RUN apt install curl dirmngr apt-transport-https lsb-release ca-certificates -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install sudo -y && apt install python3.9 python3-pip -y && useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apt update -y && apt install nodejs -y && npm install -g configurable-http-proxy && pip3 install jupyterlab==2.1.2 

COPY slurm.conf /opt/slurm/etc/
COPY cgroup.conf /opt/slurm/etc/
COPY docker-entrypoint.sh /opt/slurm/etc/

WORKDIR /home/admin

EXPOSE 8888

ENV USER admin
ENV SHELL bash

RUN apt install libopenmpi-dev -y && pip3 install mpi4py && pip3 install jupyterlab_slurm

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
