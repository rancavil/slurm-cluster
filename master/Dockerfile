FROM slurm-base

ARG DEBIAN_FRONTEND=noninteractive

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/
RUN dos2unix /etc/slurm-llnl/docker-entrypoint.sh

EXPOSE 6817 6818 6819 3306

WORKDIR /home/admin

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
