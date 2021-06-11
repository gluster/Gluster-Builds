FROM debian:buster

LABEL project="ubuntu-latest-gluster-build"
LABEL maintainer "sajmoham@redhat.com"
ENV DEBIAN_FRONTEND=nonintercative


RUN apt-get update && apt-get install -y \
git make automake autoconf libtool flex bison pkg-config sed \
libssl-dev libxml2-dev python2-dev python3-dev libaio-dev libibverbs-dev \
librdmacm-dev libreadline-dev liblvm2-dev libglib2.0-dev liburcu-dev \
libcmocka-dev libsqlite3-dev libacl1-dev devscripts build-essential lintian \
libfuse-dev libdb-dev libtirpc-dev attr firewalld dh-python debhelper autotools-dev wget libfuse3-dev -y


CMD ["/bin/bash"]

RUN  mkdir gluster

COPY ./build.sh gluster/

RUN cd gluster/

RUN chmod +x gluster/build.sh

CMD gluster/build.sh debian buster 9 10dev 1
