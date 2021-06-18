FROM ubuntu:20.04

LABEL project="ubuntu-latest-gluster-build"
LABEL maintainer "gluster-users@gluster.org"
ENV DEBIAN_FRONTEND=nonintercative


RUN apt-get update && apt-get install -y \
git make automake autoconf libtool flex bison pkg-config sed \
libssl-dev libxml2-dev python2-dev python3-dev libaio-dev libibverbs-dev \
libreadline-dev libglib2.0-dev liburcu-dev librdmacm-dev \
libacl1-dev devscripts build-essential lintian libsqlite3-dev \
libdb-dev libtirpc-dev attr firewalld dh-python debhelper autotools-dev wget libfuse3-dev -y


RUN  mkdir gluster

COPY ./build.sh gluster/

RUN cd gluster/

RUN chmod +x gluster/build.sh

CMD gluster/build.sh ubuntu focal 9 10dev 1
