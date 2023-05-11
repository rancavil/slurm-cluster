# How to use the images

```
docker pull registry.cn-beijing.aliyuncs.com/oneflow/slurm-head:latest
docker pull registry.cn-beijing.aliyuncs.com/oneflow/slurm-worker:latest
```

- head

```bash
docker run --rm --name slurm-head-$USER --network=host --add-host=slurmmaster:10.0.0.26 --add-host=slurmnode1:10.0.0.20 --user=admin registry.cn-beijing.aliyuncs.com/oneflow/slurm-head
```

- worker

```bash
docker run --rm --name slurm-worker-$USER --network=host --add-host=$(hostname):127.0.0.1 --add-host=slurmmaster:10.0.0.26 --add-host=slurmnode1:10.0.0.20 --user=admin -e SLURM_NODENAME="slurmnode1" registry.cn-beijing.aliyuncs.com/oneflow/slurm-worker
```

- stop

```bash
docker rm -f slurm-head-$USER
docker rm -f slurm-worker-$USER
```
