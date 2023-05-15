set -x

NODENAME=${NODENAME:-1}
IMG_NAME=registry.cn-beijing.aliyuncs.com/oneflow/slurm-worker

docker pull ${IMG_NAME} 
docker ps -a --filter "ancestor=${IMG_NAME}" -q | xargs docker stop

docker run -d --gpus all --rm --name slurm-head-$USER --network=host \
--add-host=$(hostname):127.0.0.1 \
--add-host=slurmmaster:10.1.0.6 \
--add-host=slurmnode1:10.0.0.9 \
--add-host=slurmnode2:10.0.0.10 \
--add-host=slurmnode3:10.0.0.11 \
--add-host=slurmnode4:10.0.0.13 \
--user=admin \
-e SLURM_NODENAME="slurmnode${NODENAME}" \
-v /mnt:/mnt \
-v /data_32T:/data_32T \
-v /data_160T:/data_160T \
registry.cn-beijing.aliyuncs.com/oneflow/slurm-worker

