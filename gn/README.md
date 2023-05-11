# How to use the images

```
docker pull registry.cn-beijing.aliyuncs.com/oneflow/slurm-head:latest
docker pull registry.cn-beijing.aliyuncs.com/oneflow/slurm-worker:latest
```

- head

```bash
docker run --rm --name slurm-head-$USER --network=host -e SLURMCTLD="10.0.0.26" registry.cn-beijing.aliyuncs.com/oneflow/slurm-head
```

- worker

```bash
docker run --rm --name slurm-worker-$USER --network=host -e SLURMCTLD="10.0.0.26" -e SLURM_NODENAME="worker1" registry.cn-beijing.aliyuncs.com/oneflow/slurm-worker
```
