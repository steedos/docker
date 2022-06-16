docker build --tag steedos/steedos-enterprise:latest ./2022

docker tag steedos/steedos-enterprise steedos/steedos-enterprise:2022.6.16
docker tag steedos/steedos-enterprise steedos/steedos-enterprise:2022.6
docker tag steedos/steedos-enterprise steedos/steedos-enterprise:2022


docker push steedos/steedos-enterprise:latest
docker push steedos/steedos-enterprise:2022.6.16
docker push steedos/steedos-enterprise:2022.6