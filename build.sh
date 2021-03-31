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

TGZS=(`ls ~/glusterfs-${version}-?-*/build/glusterfs-${version}.tar.gz`)
echo ${TGZS[0]}

if [ -z ${TGZS[0]} ]; then
        echo "wget https://download.gluster.org/pub/gluster/glusterfs/${series}/${version}/glusterfs-${version}.tar.gz"
        wget https://download.gluster.org/pub/gluster/glusterfs/${series}/${version}/glusterfs-${version}.tar.gz

else
        echo "found ${TGZS[0]}, using it..."
        cp ${TGZS[0]} .
fi

echo "Creating link file.."
ln -s glusterfs-${version}.tar.gz glusterfs_${version}.orig.tar.gz

echo "Untaring.."
tar xpf glusterfs-${version}.tar.gz

# Changelogs needed for building are maintained in a separate repo.
# the repo has to be clone and updated properly so we can copy the changelogs so far.

echo "Cloning the glusterfs-debian repo"
git clone http://github.com/gluster/glusterfs-debian.git

cd glusterfs-debian/

git checkout -b ${flavor}-${series}-local origin/${flavor}-glusterfs-${series}

sed -i "1i glusterfs (${version}-${os}1~${flavor}1) ${flavor}; urgency=medium\n\n  * GlusterFS ${version} GA\n\n -- GlusterFS GlusterFS deb packages <deb.packages@gluster.org>  `date +"%a, %d %b %Y %T %z"`\n" debian/changelog

git commit -a -m "Glusterfs ${version} G.A (${flavor})"

echo "Copying Changelog to source"
cp -a debian ../glusterfs-${version}/

echo "Building source package.."
cd ../glusterfs-${version}
debuild -us -uc

#!/bin/bash
