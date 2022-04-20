FROM slurm-base

ARG DEBIAN_FRONTEND=noninteractive

EXPOSE 6817 6818 6819

COPY supervisor-node.conf /etc/supervisor/conf.d/

WORKDIR /home/admin

ENTRYPOINT ["sudo", "supervisord", "--nodaemon", "--user", "root"]
