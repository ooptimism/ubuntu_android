FROM ubuntu:16.04

MAINTAINER xuelm <xue.lm@neusoft.com>

USER root

RUN apt-get update && apt-get install -y \
        openjdk-8-jdk libgl1-mesa-dev \
        g++-multilib git flex bison gperf build-essential \
        tofrodos python-markdown vim-common \
        libxml2-utils xsltproc \
        libsdl1.2-dev libesd0-dev git-core gnupg \
        zip curl zlib1g-dev gcc-multilib \
        libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev \
        libx11-dev unzip python-networkx gettext \
        m4 lib32z1-dev ccache device-tree-compiler \
        python-mako make libssl-dev liblz4-tool bc \
        bsdmainutils libncurses5-dev libwxgtk3.0-dev \
        lzop sudo pngcrush schedtool graphviz lib32z-dev filepp && \
        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /root/.ssh
COPY .ssh/ /root/.ssh
RUN chmod 0600 /root/.ssh/*
RUN git config --global user.email "xue.lm@neusoft.com"
RUN git config --global user.name "xuelimin"
#configurate netrc
COPY .netrc /root/.netrc

CMD ["/bin/bash"]
