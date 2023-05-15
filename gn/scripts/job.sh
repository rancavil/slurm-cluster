#!/bin/bash
#
#SBATCH --job-name=test
#SBATCH --output=result.out
#
#SBATCH --ntasks=1
#
# your own path for scripts, for example mine is 
# WORKSPACE=/data_160T/home/fjr/workspace/slurm-cluster/gn/scripts
# sbcast -f test.py $WORKSPACE/test.py
srun python3 $WORKSPACE/test.py
