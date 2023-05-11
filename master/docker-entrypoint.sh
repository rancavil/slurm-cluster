#!/bin/bash
set -e

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf
sudo sed -i "s/slurmmaster/${HEAD_HOST}/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo service slurmctld start

tail -f /dev/null
