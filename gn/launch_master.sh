set -x

IMG_NAME="registry.cn-beijing.aliyuncs.com/oneflow/slurm-head"

docker pull ${IMG_NAME}
docker ps -a --filter "ancestor=${IMG_NAME}" -q | xargs docker stop
echo "old container will be stopped"

docker run -d --rm --name slurm-head-$USER --network=host \
--add-host=slurmmaster:10.1.0.6 \
--add-host=slurmnode1:10.0.0.9 \
--add-host=slurmnode2:10.0.0.10 \
--add-host=slurmnode3:10.0.0.11 \
--add-host=slurmnode4:10.0.0.13 \
-v /mnt:/mnt \
-v /data_32T:/data_32T \
-v /data_160T:/data_160T \
--user=admin ${IMG_NAME} 
