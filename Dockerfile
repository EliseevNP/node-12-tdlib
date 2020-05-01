FROM node:12

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y make git zlib1g-dev libssl-dev gperf php cmake g++ \
 && git clone https://github.com/tdlib/td.git \
 && cd td \
 && git checkout v1.6.0 \
 && rm -rf build \
 && mkdir build \
 && cd build \
 && export CXXFLAGS="" \
 && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .. \
 && cmake --build . --target install
