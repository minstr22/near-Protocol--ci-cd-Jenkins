# Near-Jenkins

## Overview

 [NEAR Protocol](https://near.org/) is a decentralized application platform that is secure enough to manage high value assets like money or identity and performant enough to make them useful for everyday people, putting the power of the Open Web in their hands.
 
 [Jenkins](https://www.jenkins.io/) is an open source automation server which enables developers around the world to reliably build, test, and deploy their software.
## Install Jenkins On Ubuntu Node
  ##### 01.Install java
    sudo apt update 
    sudo apt isntall openjdk-8-jdk

  ##### 02.Add the Jenkins Debian repository.
    sudo apt update
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/
  ##### 03.Install Jenkins.
    sudo apt update
    sudo apt install jenkins
## NEARCore Docker Deploy
####    01.Install Docker  
    sudo apt-get update
    sudo apt install docker.io
####    02.Create Jenkins freestyle project NearCoreBetaNet-Deploy
    Jenknis > New Item > Freestyle Project
   add [bash script] (https://github.com/minstr22/nearcore-ci-cd/blob/master/Scripts/NearCoreBetaNet-Deploy.sh/) as a build step "Execute shell"
    

## Run NEARCore Docker On Ubuntu Node
#### 01.Install Docker (if not installed)
    sudo apt-get update
    sudo apt install docker.io
If you are using nearup just stop the node:

nearup stop
In the future if you will not use docker, you can use nearup again without any problems.

After the first run of our workflow a new docker images(nearprotocol/nearcore:beta and nearprotocol/nearcore:rc) should be available and we can run the near node with the following command:

sudo docker run -dti \
     --restart always \
     --user 0 \
     --volume $HOME/.near/betanet/:/srv/near \
     --volume /tmp:/tmp \
     --name nearcore \
     --network=host \
     -p 3030 \
     -p 24567 nearprotocol/nearcore:beta near --home /srv/near run
 
 P.S. You can finde netcore latest versions there: 
