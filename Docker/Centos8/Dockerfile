FROM centos:8

LABEL project="centos8-gluster-build"
LABEL maintainer "gluster-users@gluster.org"

#Changes for pointing to Centos Stream repo
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y --setopt tsflags=nodocs --setopt install_weak_deps=0 --enablerepo=powertools install automake autoconf libtool flex bison \
    openssl-devel libxml2-devel libaio-devel readline-devel glib2-devel userspace-rcu-devel \
    libacl-devel fuse-devel redhat-rpm-config rpcgen libtirpc-devel make python3-devel rsync libuuid-devel \
    rpm-build git attr libcurl-devel selinux-policy-devel firewalld liburing-devel epel-release && yum install -y gperftools-devel

RUN yum -y update --setopt tsflags=nodocs --setopt install_weak_deps=0 && yum clean all && rm -rf /var/cache/yum

CMD ["/usr/sbin/init"]

COPY ./startscript.sh /

RUN chmod +x /startscript.sh

CMD /startscript.sh
