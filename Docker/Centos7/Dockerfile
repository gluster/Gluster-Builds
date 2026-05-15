FROM centos:7

LABEL project="centos7-gluster-build"
LABEL maintainer "gluster-users@gluster.org"

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y epel-release && \
    yum -y --setopt tsflags=nodocs --enablerepo=extras install epel-release-7 autoconf automake bison cmockery2-devel \
    dos2unix flex selinux-policy-devel rsync libcurl-devel fuse-devel glib2-devel libacl-devel libaio-devel libattr-devel \
    libtool libxml2-devel make openssl-devel pkgconfig python-devel rpm-build readline-devel \
    userspace-rcu-devel git userspace-rcu redhat-rpm-config rpcgen make libuuid-devel deltarpm firewalld gperftools-devel openssl

RUN yum -y update --setopt tsflags=nodocs && yum clean all && rm -rf /var/cache/yum

CMD ["/usr/sbin/init"]

COPY ./startscript-centos7.sh /

RUN chmod +x /startscript-centos7.sh

ENTRYPOINT ["/startscript-centos7.sh"]

CMD ["devel"]
