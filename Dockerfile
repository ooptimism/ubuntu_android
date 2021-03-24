FROM ubuntu:16.04

MAINTAINER xuelm <xue.lm@neusoft.com>

USER root

RUN apt-get update && apt-get install -y \
        openjdk-8-jdk libgl1-mesa-dev \
        g++-multilib git flex bison gperf build-essential \
        tofrodos python-markdown vim-common \
        libxml2-utils xsltproc wget kmod \
        libsdl1.2-dev libesd0-dev git-core gnupg \
        zip curl zlib1g-dev gcc-multilib cmake \
        libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev \
        libx11-dev unzip python-networkx gettext \
        m4 lib32z1-dev ccache device-tree-compiler \
        python-mako make libssl-dev liblz4-tool bc apt-transport-https \
        bsdmainutils libncurses5-dev libwxgtk3.0-dev \
        liblocal-lib-perl cpanminus libxml-simple-perl python3 \
        lzop sudo pngcrush schedtool graphviz lib32z-dev filepp && \
        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get -y install dotnet-runtime-2.2

RUN useradd -ms /bin/bash android
RUN mkdir -p /home/android/.ssh
COPY .ssh/ /home/android/.ssh
RUN chmod 0600 /home/android/.ssh/*
#configurate netrc
COPY .netrc /home/android/.netrc
COPY repo /usr/bin/repo

COPY cmake-3.15.7.tar.gz /
RUN tar mxf cmake-3.15.7.tar.gz && cd cmake-3.15.7 && ./bootstrap && make && make install
# compile SDK
RUN mkdir /pkg
RUN chown -R android:android /pkg

USER android
RUN git config --global user.email "xue.lm@neusoft.com"
RUN git config --global user.name "xuelimin"

CMD ["/bin/bash"]
