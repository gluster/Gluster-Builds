#!/bin/bash

os=$1
flavor=$2
series=$3
version=$4
release=$5

git config --global user.email "sajmoham@redhat.com"
git config --global user.name  "msaju"

mkdir ${os}-${flavor}-Glusterfs-${version}

cd ${os}-${flavor}-Glusterfs-${version}

mkdir build packages

echo "Building glusterfs-${version}-${release} for ${flavor}"


cd build

echo "Checking out Gluster Devel latest "
git clone https://github.com/gluster/glusterfs.git

cd glusterfs/

echo "Configuring and building Glusterfs "
./autogen.sh

./configure --enable-fusermount --enable-gnfs --disable-linux-io_uring

echo "Running Make Dist"
make dist

cp glusterfs-${version}.tar.gz ../../

tar -xzvf glusterfs-${version}.tar.gz

echo "Creating link file.."
ln -s glusterfs-${version}.tar.gz glusterfs_${version}.orig.tar.gz


# Changelogs needed for building are maintained in a separate repo.
# the repo has to be clone and updated properly so we can copy the changelogs so far.

echo "Cloning the glusterfs-debian repo"
git clone http://github.com/gluster/glusterfs-debian.git

cd glusterfs-debian/

git checkout -b ${flavor}-${series}-local origin/${flavor}-glusterfs-${series}

sed -i "1i glusterfs (${version}-1) ${flavor}; urgency=low\n\n  [ Gluster Packager ]\n  * GlusterFS ${version} GA\n\n -- Gluster Packager <glusterpackager@download.gluster.org>  `date +"%a, %d %b %Y %T %z"`\n" debian/changelog

git commit -a -m "Glusterfs ${version} G.A (${flavor})"

echo "Copying Changelog to source"
cp -a debian ../glusterfs-${version}/

echo "Building source package.."
cd ../glusterfs-${version}
debuild -us -uc

cd ../

echo "Copying source package.."
  cp *.*deb  /out/.

#!/bin/bash
