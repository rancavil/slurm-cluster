#!/bin/bash

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /opt/slurm/etc/slurm.conf

sudo service munge start
sudo service slurmctld start

tail -f /dev/null
