# resin-raspberrypi3-opencv3  
## Base image for ResinOS in which OpenCV3 is installed  
---  
This contains `OpenCV3`, `gstreamer`, and a bunch of dependencies thereof. To build a derived Resin app, use `FROM biobright/resin-raspberrypi3-opencv3` in its Dockerfile.  

To build, you'll need to install Docker and configure permissions to allow userspace docker operation (* potentially insecure; can replace with `sudo docker ...` *):
````
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
newgrp docker
````  
Then run `./build.sh` to build and push the docker image. 