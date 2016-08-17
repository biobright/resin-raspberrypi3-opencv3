#!/bin/bash

DOCKERHUB_REPO='biobrightllc/resin-raspberrypi3-opencv3'
# This is necessary to make qemu run armv7l binaries during docker builds
sudo mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc  
sudo echo ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:' > /proc/sys/fs/binfmt_misc/register  



# You'll need to login to Dockerhub with
# docker login -u $USERNAME -p $PASSWORD
docker build -t $DOCKERHUB_REPO .
docker push $DOCKERHUB_REPO