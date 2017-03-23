#!/bin/bash
set -e

UBUNTU_CODENAME=$(lsb_release -cs)
DOCKER_VERSION="17.03.0~ce-0~ubuntu-$UBUNTU_CODENAME"

# Make sure we have a dedicated UID for docker (same as on host)
groupadd -g 999 docker
apt-get install --no-install-recommends -qy lsb-release
curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -
echo "deb https://apt.dockerproject.org/repo/ ubuntu-$UBUNTU_CODENAME main" > /etc/apt/sources.list.d/docker.list
apt-get update -q
apt-get install --no-install-recommends -qy docker-engine=$DOCKER_VERSION
adduser jenkins docker
