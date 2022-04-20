FROM slurm-base

ARG DEBIAN_FRONTEND=noninteractive

EXPOSE 6817 6818 6819 3306

COPY supervisor-master.conf /etc/supervisor/conf.d/

WORKDIR /home/admin

ENTRYPOINT ["sudo", "supervisord", "--nodaemon", "--user", "root"]
