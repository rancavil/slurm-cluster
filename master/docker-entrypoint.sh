#!/bin/bash
set -e

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf
sudo echo "${HEAD_HOST} slurmmaster" >> /etc/hosts

IFS="," read -ra arr <<< "$WORKER_HOSTS"
for i in "${!arr[@]}"
do
    sudo echo "${arr[i]} slurmnode$((i+1))" >> /etc/hosts
done

sudo service munge start
sudo service slurmctld start

sudo tail -f /var/log/slurm-llnl/slurmctld.log
