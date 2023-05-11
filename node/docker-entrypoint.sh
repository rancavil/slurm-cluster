#!/bin/bash

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo slurmd -N ${SLURM_NODENAME}

sudo tail -f /var/log/slurm-llnl/slurmd.log
