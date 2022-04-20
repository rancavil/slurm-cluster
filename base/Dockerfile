FROM ubuntu:20.04 AS slurm-base

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y build-essential dos2unix git libopenmpi-dev mariadb-server munge python3.9 python3-pip slurmctld slurmd slurm-client sudo vim

RUN useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN pip3 install mpi4py

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
