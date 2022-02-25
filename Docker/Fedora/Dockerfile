ARG MYAPP_IMAGE=fedora:latest

FROM $MYAPP_IMAGE


LABEL project="gluster-build"
LABEL maintainer "gluster-users@gluster.org"

RUN dnf -y --setopt tsflags=nodocs --setopt install_weak_deps=0 install automake autoconf libtool flex bison openssl-devel  \
    openssl libxml2-devel python-devel libaio-devel readline-devel \
    glib2-devel git  userspace-rcu-devel libacl-devel fuse-devel rpcgen make \
    rpm-build libuuid-devel firewalld libtirpc-devel \
    libcurl-devel liburing-devel gperftools-devel && yum clean all

RUN dnf -y update --setopt tsflags=nodocs --setopt install_weak_deps=0 && yum clean all && rm -rf /var/cache/yum

CMD ["/usr/sbin/init"]

COPY ./startscript.sh /

RUN chmod +x /startscript.sh

ENTRYPOINT ["/startscript.sh"]

CMD ["devel"]
