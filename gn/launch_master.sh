set -x

IMG_NAME="registry.cn-beijing.aliyuncs.com/oneflow/slurm-head:v0.2"

# docker pull ${IMG_NAME}
if docker ps -a --filter "ancestor=${IMG_NAME}" | grep -q "Up"; then
     docker ps -a --filter "ancestor=${IMG_NAME}" -q | xargs docker stop
fi
echo "old container will be stopped"

docker run -d --rm --name slurm-head-$USER --network=host \
--add-host=slurmmaster:10.1.0.6 \
--add-host=slurmnode1:10.0.0.9 \
--add-host=slurmnode2:10.0.0.10 \
--add-host=slurmnode3:10.0.0.13 \
--add-host=slurmnode4:10.0.0.17 \
-v /mnt:/mnt \
-v /data_32T:/data_32T \
-v /data_160T:/data_160T \
--user=root ${IMG_NAME} 
