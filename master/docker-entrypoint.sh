#!/bin/bash
set -e

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo service slurmctld start

sudo mkdir -p /var/log/slurm-llnl
sudo touch /var/log/slurm-llnl/slurmd.log
sudo tail -f /var/log/slurm-llnl/slurmctld.log
