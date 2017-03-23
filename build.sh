#!/bin/bash
set -e

IMAGE_REPOSITORY=szcms-buildtools

[ -f REPOSITORY ] && rm REPOSITORY
[ -f BUILDTAG ] && rm BUILDTAG

TIMESTAMP=$(date +%Y%m%d%H%M%S)
IMAGE_TAG=$(git rev-parse --short HEAD)-$TIMESTAMP

docker build --no-cache=true -t $IMAGE_REPOSITORY:$IMAGE_TAG .
echo $IMAGE_REPOSITORY > REPOSITORY
echo $IMAGE_TAG > BUILDTAG
