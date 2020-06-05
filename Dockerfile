FROM ubuntu:16.04

MAINTAINER xuelm <xue.lm@neusoft.com>

USER root

RUN apt-get update && apt-get install -y \
        openjdk-8-jdk libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-dev \
        g++-multilib git flex bison gperf build-essential \
        libncurses5-dev:i386 tofrodos python-markdown \
        libxml2-utils xsltproc zlib1g-dev:i386 dpkg-dev \
        libsdl1.2-dev libesd0-dev git-core gnupg \
        zip curl zlib1g-dev gcc-multilib \
        libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev \
        libx11-dev libgl1-mesa-dev libxml2-utils unzip \
        m4 lib32z1-dev ccache device-tree-compiler \
        python-mako make libssl-dev liblz4-tool bc \
        bsdmainutils libncurses5-dev libwxgtk3.0-dev \
        lzop sudo pngcrush schedtool zlib1g-dev graphviz && \
        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /mnt
#RUN /bin/bash -c 'source build/envsetup.sh'
#RUN /bin/bash -c 'make update-api'
#RUN /bin/bash -c 'lunch c4_pro-userdebug'
#RUN /bin/bash -c 'make -j8'
CMD ["/bin/sh"]
