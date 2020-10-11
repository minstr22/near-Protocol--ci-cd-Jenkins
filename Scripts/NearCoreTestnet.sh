#!/bin/bash
docker=$(docker images | grep -e -rc | awk '{print $2}')
for git in $(curl --silent "https://api.github.com/repos/nearprotocol/nearcore/releases" | grep -Po '"tag_name": "\K.*?(?=")' | grep rc | head -1)
do
   if	[ $git == $docker ]; then
        echo "Tag already deployed"
		
        else
        git clone --depth 1 --branch ${git} https://github.com/nearprotocol/nearcore
        cd nearcore
        DOCKER_BUILDKIT=1  docker build -t nearprotocol/nearcore:${git} .
        fi
        done
