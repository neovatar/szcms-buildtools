#!/bin/bash
REPOSITORY=$(cat REPOSITORY)
BUILDTAG=$(cat BUILDTAG)
run -ti \
  --rm \
  --name buildtools \
  -v /etc/passwd:/etc/passwd:ro \
  -v /etc/group:/etc/group:ro \
  -u 1000:1000 \
  -v /home/tom:/home/tom \
  -v $SSH_AUTH_SOCK:/ssh-agent \
  --env SSH_AUTH_SOCK=/ssh-agent \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --entrypoint /bin/bash \
  buildtools
