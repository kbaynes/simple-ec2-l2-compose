#!/bin/bash

# sudo to root so we don't have to sudo every command
sudo su
# update the image
yum update -y
# install docker
yum install -y docker
service docker start
# let the ec2-user run docker
usermod -a -G docker ec2-user
# install docker compose and link to /usr/bin
curl -L https://github.com/docker/compose/releases/download/1.6.1/docker-compose-`uname -s`-`uname -m` > docker-compose 
chown root docker-compose
mv docker-compose /usr/local/bin
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
# setup the docker compose service definition
mkdir /srv/docker
curl -o /srv/docker/docker-compose.yml https://raw.githubusercontent.com/kbaynes/simple-ec2-l2-compose/master/docker-compose.yml
# setup systemd unit file to run compose app as a service
curl -o /etc/systemd/system/docker-compose-app.service https://raw.githubusercontent.com/kbaynes/simple-ec2-l2-compose/master/app.service
systemctl enable docker-compose-app
# start up the application via docker-compose
docker-compose -f /srv/docker/docker-compose.yml up -d