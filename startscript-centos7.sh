/usr/sbin/init

mkdir github
cd github
git clone --depth 1 https://github.com/gluster/glusterfs.git
cd glusterfs
./autogen.sh
./configure --disable-linux-io_uring
cd extras/LinuxRPM
make glusterrpms
