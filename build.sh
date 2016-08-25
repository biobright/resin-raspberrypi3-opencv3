#!/bin/bash

DOCKERHUB_REPO='biobright/resin-raspberrypi3-opencv3'
FIX_BINFMT=true

# This is necessary to make qemu run armv7l binaries during docker builds
if $FIX_BINFMT ; then
    echo 'Setting up machine to run armv7l binaries with qemu...'
    sudo mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc  
    sudo sh -c "echo ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:' > /proc/sys/fs/binfmt_misc/register"
fi

# You'll need to login to Dockerhub with
# docker login -u $USERNAME -p $PASSWORD
docker build -t $DOCKERHUB_REPO .
docker push $DOCKERHUB_REPO
