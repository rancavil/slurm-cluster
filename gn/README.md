# How to use the images

```
docker pull registry.cn-beijing.aliyuncs.com/oneflow/slurm-head:latest
docker pull registry.cn-beijing.aliyuncs.com/oneflow/slurm-worker:latest
```

- head

```bash
docker run --rm --name slurm-head-$USER --network=host -e HEAD_HOST="10.0.0.26" -e WORKER_HOSTS="10.0.0.27" --user=admin registry.cn-beijing.aliyuncs.com/oneflow/slurm-head
```

- worker

```bash
docker run --rm --name slurm-worker-$USER --network=host -e HEAD_HOST="10.0.0.26" --user=admin -e SLURM_NODENAME="slurmnode1" registry.cn-beijing.aliyuncs.com/oneflow/slurm-worker
```

- stop

```bash
docker rm -f slurm-head-$USER
docker rm -f slurm-worker-$USER
```
