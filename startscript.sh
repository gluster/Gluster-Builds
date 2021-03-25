/usr/sbin/init

mkdir github
cd github
git config --global user.email "sajmoham@redhat.com"
git config --global user.name  "msaju"
git clone https://github.com/gluster/glusterfs.git
cd glusterfs
./autogen.sh
./configure
make
cd extras/LinuxRPM
make glusterrpms
