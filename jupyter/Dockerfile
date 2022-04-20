FROM slurm-base

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y curl dirmngr apt-transport-https lsb-release ca-certificates

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt update && apt install -y nodejs

RUN npm install -g configurable-http-proxy
RUN pip3 install jupyterlab jupyterlab_slurm

WORKDIR /home/admin

EXPOSE 8888

ENV USER admin
ENV SHELL bash

COPY jupyter.sh /usr/local/bin/
RUN a+x /usr/local/bin/jupyter.sh

COPY supervisor-jupyter.conf /etc/supervisor/conf.d/

ENTRYPOINT ["sudo", "supervisord", "--nodaemon", "--user", "root"]
