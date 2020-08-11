#!/bin/bash
docker=$(docker images | grep -e -beta | awk '{print $2}')
for git in $(curl --silent "https://api.github.com/repos/nearprotocol/nearcore/releases" | grep -Po '"tag_name": "\K.*?(?=")' | grep beta | head -1)
do
   if	[ $git == $docker ]; then
        echo "Tag already deployed"
		
        else
        git clone --depth 1 --branch ${git} https://github.com/nearprotocol/nearcore
        cd nearcore
        DOCKER_BUILDKIT=1  docker build -t nearprotocol/nearcore:${git} .
        
        docker stop $(docker ps | grep nearprotocol/nearcore:${docker} | awk '{print $1}')
        sleep 5
        docker rm $(docker ps -a | grep nearprotocol/nearcore:${docker} | awk '{print $1}')
        docker rmi -f nearprotocol/nearcore:${docker}
        sleep 10
        docker run -dti --restart always --user 0 --volume /root/.near/betanet/:/srv/near --volume /tmp:/tmp --name nearcore --network=host -p 3030 -p 24567 nearprotocol/nearcore:${git} near --home /srv/near run
        fi
        done
