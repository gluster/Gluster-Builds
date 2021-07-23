/usr/sbin/init

mkdir github
cd github
git clone --depth 1 https://github.com/gluster/glusterfs.git
cd glusterfs
./autogen.sh
./configure
cd extras/LinuxRPM
make glusterrpms
echo "Copying source package.."
     cp *.*rpm  /out/.
