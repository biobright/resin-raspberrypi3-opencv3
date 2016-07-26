FROM resin/raspberrypi3-buildpack-deps:jessie

RUN apt-get -y update \
        && apt-get -y install curl python3 python3-dev unzip supervisor libzmq3 libzmq3-dev v4l-utils

# GStreamer        
RUN apt-get install gstreamer1.0-tools gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-omx

# Fix for broken, un-uninstallable pip from apt-get
#RUN curl https://bootstrap.pypa.io/get-pip.py | python
#RUN pip install -U pip

# libjpeg 8->9
# apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf 
RUN apt-get install build-essential cmake
RUN apt-get install libeigen3-dev libjpeg9-dev libjpeg9 libtiff5-dev libtiff5 libjasper-dev libjasper1 libpng12-dev libpng12-0 libavcodec-dev libavcodec-extra libavcodec56 libavformat-dev libavformat56 libswscale-dev libswscale3 libv4l-dev libv4l-0 libatlas-base-dev libatlas3-base gfortran libblas-dev libblas3 liblapack-dev liblapack3 python3-dev libpython3-dev



#################################################################

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD /usr/bin/supervisord