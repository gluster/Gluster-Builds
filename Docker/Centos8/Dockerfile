FROM centos:8

LABEL project="centos8-gluster-build"
LABEL maintainer "gluster-users@gluster.org"

RUN yum -y --setopt tsflags=nodocs --enablerepo=powertools install automake autoconf libtool flex bison \
    openssl-devel libxml2-devel libaio-devel readline-devel glib2-devel userspace-rcu-devel \
    libacl-devel fuse-devel redhat-rpm-config rpcgen libtirpc-devel make python3-devel rsync libuuid-devel \
    rpm-build git attr libcurl-devel selinux-policy-devel firewalld liburing-devel epel-release

RUN yum -y update --setopt tsflags=nodocs && yum clean all && rm -rf /var/cache/yum

CMD ["/usr/sbin/init"]

COPY ./startscript.sh /

RUN chmod +x /startscript.sh

CMD /startscript.sh
