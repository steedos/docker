# Steedos Enterprise Edition


## Getting Started

### Start Services

```
docker-compose up
```

### Stop Services

```
docker-compose down
```

### Clean Valumes

```
docker-compose down
docker volume rm steedos-enterprise_steedos-minio-data
docker volume rm steedos-mongodb-data
```

## Env

copy .env.sample to .env 

```
# 初始安装的软件包
STEEDOS_INITIAL_PACKAGES=@steedos-labs/master,@steedos-labs/contract,@steedos-labs/project,@steedos-labs/oa,@steedos-labs/workflow,@steedos-labs/app-cost-control

# 平台访问地址
STEEDOS_PORT=3000
STEEDOS_ROOT_URL=http://localhost:3000

# 各种保密参数，生产环境请务必修改
MINIO_ROOT_USER=steedos
MINIO_ROOT_PASSWORD=steedos123
MINIO_DEFAULT_BUCKETS=steedos
MONGODB_ROOT_PASSWORD=steedos
MONGODB_DATABASE=steedos
MONGODB_REPLICA_SET_NAME=steedos
MONGODB_REPLICA_SET_KEY=steedos
REDIS_PASSWORD=steedos
NATS_USERNAME=steedos
NATS_PASSWORD=steedos
NODE_RED_USERNAME=steedos
NODE_RED_PASSWORD=steedos
```

## Connect to MongoDB Cluster

vi /etc/hosts

```
127.0.0.1  mongodb-primary mongodb-secondary mongodb-arbiter
```