docker build --tag steedos/steedos-community:latest ./2022

docker tag steedos/steedos-community steedos/steedos-community:2022.6.15
docker tag steedos/steedos-community steedos/steedos-community:2022.6
docker tag steedos/steedos-community steedos/steedos-community:2022

docker push steedos/steedos-community:latest
docker push steedos/steedos-community:2022.6.15
docker push steedos/steedos-community:2022.6