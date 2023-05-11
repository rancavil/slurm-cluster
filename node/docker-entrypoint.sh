#!/bin/bash
set -e

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf
sudo echo "${HEAD_HOST} slurmmaster" >> /etc/hosts

sudo service munge start
sudo slurmd -N $(hostname)

tail -f /dev/null
