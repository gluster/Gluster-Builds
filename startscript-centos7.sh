#!/bin/bash

#Getting branch details from input argument 1
BRANCH=$1
echo $BRANCH
#Checking if arguments passed is NULL
if [ -z "$1" ]
  then
    echo "No argument supplied"
    BRANCH=devel
    echo "Enabling Default Branch" $BRANCH
fi

mkdir github
cd github
echo "cloning branch" $BRANCH
git clone --branch $BRANCH --depth 1 --single-branch https://github.com/gluster/glusterfs.git
cd glusterfs
./autogen.sh
./configure --disable-linux-io_uring
cd extras/LinuxRPM
make glusterrpms
echo "Copying source package.."
     cp *.*rpm  /out/.
