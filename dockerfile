FROM crainer/ffmpeg-ffmbc:1.3.5 as ffmpeg

RUN \
    apt-get update

EXPOSE 3000