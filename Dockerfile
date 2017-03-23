FROM docker.sueddeutsche.de/szpolopoly/buildtools:b9d8894-20170302155356

LABEL maintainer "szdm.de-team@sz.de"

COPY src/ /tmp/docker/
WORKDIR "/tmp/docker"

RUN apt-get update -q \
 && ./install_docker.sh \
 && rm -rf /tmp/* \
 && rm -rf /var/lib/apt

ENTRYPOINT ["/bin/bash"]