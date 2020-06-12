FROM ubuntu:16.04

MAINTAINER xuelm <xue.lm@neusoft.com>

USER root

RUN apt-get update && apt-get install -y \
        openjdk-8-jdk libgl1-mesa-dev \
        g++-multilib git flex bison gperf build-essential \
        tofrodos python-markdown vim-common \
        libxml2-utils xsltproc dpkg-dev \
        libsdl1.2-dev libesd0-dev git-core gnupg \
        zip curl zlib1g-dev gcc-multilib \
        libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev \
        libx11-dev unzip python-networkx gettext \
        m4 lib32z1-dev ccache device-tree-compiler \
        python-mako make libssl-dev liblz4-tool bc \
        bsdmainutils libncurses5-dev libwxgtk3.0-dev \
        apt-transport-https \
        lzop sudo pngcrush schedtool graphviz lib32z-dev && \
        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /root/.ssh/
COPY ssh_config /root/.ssh/config
COPY id_rsa /root/.ssh/id_rsa
COPY id_rsa.pub /root/.ssh/id_rsa.pub

CMD ["/bin/bash"]
