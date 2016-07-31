# ResinOCVBuild
ResinOS image with stuff necessary for compiling OpenCV
---
Two ways to get OCV3 onto Resin devices:  
- Build on Resin device of same version as target; upload build to S3 bucket; fetch as part of resin build process
- Cross-compile using Buildroot; upload to S3 bucket; fetch during build process.  
Right now we're building natively because it's not too much of a hassle (5 hr build time on RPi3)
---

## Cross-compiling OpenCV3/stuff
[See OpenCV dox](http://docs.opencv.org/3.0-beta/doc/tutorials/introduction/crosscompilation/arm_crosscompile_with_cmake.html)
- `apt-get install build-essential cmake gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf cmake`
- `apt-get install libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran libblas-dev liblapack-dev python3.4-dev`
- `git clone https://github.com/opencv/opencv && git clone https://github.com/opencv/opencv_contrib`
- `mkdir build && cd build`
```
cmake -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DINSTALL_C_EXAMPLES=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -DBUILD_EXAMPLES=ON \
    -DENABLE_VFPV3=ON \
    -DENABLE_NEON=ON \
    -DSOFTFP=ON \
    -DCMAKE_TOOLCHAIN_FILE=../platforms/linux/arm-gnueabi.toolchain.cmake \
    -DCMAKE_C_COMPILER=/usr/bin/arm-linux-gnueabihf-gcc \
    -DCMAKE_CXX_COMPILER=/usr/bin/arm-linux-gnueabihf-g++ \
    -DWITH_CAROTENE=OFF \
    -D BUILD_NEW_PYTHON_SUPPORT=ON\
    ..
```
