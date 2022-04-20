FROM slurm-base

ARG DEBIAN_FRONTEND=noninteractive

COPY docker-entrypoint.sh /etc/slurm-llnl/
RUN dos2unix /etc/slurm-llnl/docker-entrypoint.sh

RUN apt update && apt install -y curl dirmngr apt-transport-https lsb-release ca-certificates

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt update && apt install -y nodejs

RUN npm install -g configurable-http-proxy
RUN pip3 install jupyterlab jupyterlab_slurm

WORKDIR /home/admin

EXPOSE 8888

ENV USER admin
ENV SHELL bash

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
