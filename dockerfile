# DOWNLOAD STAGE
FROM node:iron-slim as node

# Install dependencies
RUN \
    apt update && \
    apt install -y \
    curl \
    ffmpeg \
    build-essential \
    yasm

# Install FFmbc
RUN \ 
    DIR=/tmp/dependencies/ && \
    mkdir -p ${DIR} && \
    cd ${DIR} && \
    curl -sL https://github.com/bcoudurier/FFmbc/archive/refs/heads/ffmbc.tar.gz | tar xz && \
    cd FFmbc-ffmbc && \
    ./configure --enable-gpl --enable-nonfree --enable-runtime-cpudetect && \
    make && \
    make install && \
    cd .. && \
    rm -rf ./FFmbc-ffmbc

EXPOSE 3000