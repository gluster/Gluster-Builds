# Based on the Fedora image
FROM fedora:latest


LABEL project="gluster-build"
LABEL maintainer "gluster-users@gluster.org"

RUN dnf -y --setopt tsflags=nodocs install automake autoconf libtool flex bison openssl-devel  \
    libxml2-devel python-devel libaio-devel readline-devel \
    glib2-devel git  userspace-rcu-devel libacl-devel fuse-devel rpcgen make \
    fedora-packager rpmdevtools libuuid-devel firewalld redhat-rpm-config libtirpc-devel \
    libcurl-devel liburing-devel

RUN dnf -y update --setopt tsflags=nodocs && yum clean all && rm -rf /var/cache/yum

CMD ["/usr/sbin/init"]

COPY ./startscript.sh /

RUN chmod +x /startscript.sh

CMD ./startscript.sh
