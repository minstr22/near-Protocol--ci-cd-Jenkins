#!/bin/bash

gitversion=$(curl --silent "https://api.github.com/repos/nearprotocol/nearcore/releases" | grep -Po '"tag_name": "\K.*?(?=")' | grep beta | head -1)

git clone --depth 1 --branch ${gitversion} https://github.com/nearprotocol/nearcore
cd nearcore
DOCKER_BUILDKIT=1  docker build -t nearprotocol/nearcore:${gitversion} .
sleep 10
docker run -dti --restart always --user 0 --volume /root/.near/betanet/:/srv/near --volume /tmp:/tmp --name nearcore --network=host -p 3030 -p 24567 nearprotocol/nearcore:${gitversion} near --home /srv/near run
