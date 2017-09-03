# docker build -t patrikx3/lede-insomnia .
# docker container ls
# docker exec -it <containerIdOrName> bash
# docker attach <id>
# docker run -t -i patrikx3/lede-insomnia bash
FROM debian:latest
MAINTAINER patrikx3/lede-insomnia - Patrik Laszlo

ARG LEDE_VERSION_TOTAL=17.01.2
ARG LEDE_BRANCH=lede-17.01
ENV LEDE_VERSION_TOTAL=${LEDE_VERSION_TOTAL}
ENV LEDE_BRANCH=${LEDE_BRANCH}
ENV DEBIAN_FRONTEND=noninteractive
ENV FORCE_UNSAFE_CONFIGURE=1

RUN apt-get -y update
RUN apt-get -y upgrade

# libboost1.55-dev => libboost-dev
# openjdk-8-jdk => openjdk-7-jdk
RUN apt -y install asciidoc bash bc bcc bin86 binutils build-essential bzip2 curl ncdu fastjar file flex gawk gcc genisoimage gettext git git-core intltool jikespg libboost-dev libboost-dev libgtk2.0-dev libncurses5-dev libssl-dev libusb-dev libxml-parser-perl make mc nano openjdk-8-jdk patch perl-modules python python-dev rsync ruby sdcc sharutils software-properties-common subversion sudo quilt unzip util-linux wget xsltproc xz-utils zlib1g-dev
#before it was needed nethack*, still?
# nethack
RUN mkdir build

WORKDIR build

#ARG LEDE_LINKSYS1900ACSV2_URL_BASE=https://downloads.lede-project.org/releases/${LEDE_VERSION_TOTAL}/targets/mvebu/generic
#ARG LEDE_LINKSYS1900ACSV2_FILE=lede-imagebuilder-${LEDE_VERSION_TOTAL}-mvebu.Linux-x86_64.tar.xz
#ARG LEDE_LINKSYS1900ACSV2_FILE_SDK=lede-sdk-${LEDE_VERSION_TOTAL}-mvebu_gcc-5.4.0_musl-1.1.16_eabi.Linux-x86_64.tar.xz
#ARG LEDE_LINKSYS1900ACSV2_URL=${LEDE_LINKSYS1900ACSV2_URL_BASE}/${LEDE_LINKSYS1900ACSV2_FILE}
#ARG LEDE_LINKSYS1900ACSV2_URL_SDK=${LEDE_LINKSYS1900ACSV2_URL_BASE}/${LEDE_LINKSYS1900ACSV2_FILE_SDK}
#ARG LEDE_LINKSYS1900ACSV2_URL_SEED=${LEDE_LINKSYS1900ACSV2_URL_BASE}/config.seed
#ARG LEDE_LINKSYS1900ACSV2_URL_SEED_CUSTOM_FILE=mvebu-generic.config.seed
#ARG LEDE_LINKSYS1900ACSV2_URL_MANIFEST=${LEDE_LINKSYS1900ACSV2_URL_BASE}/lede-${LEDE_VERSION_TOTAL}-mvebu.manifest

#RUN wget ${LEDE_LINKSYS1900ACSV2_URL}
#RUN tar xf ${LEDE_LINKSYS1900ACSV2_FILE}
#RUN rm ${LEDE_LINKSYS1900ACSV2_FILE}
#RUN wget ${LEDE_LINKSYS1900ACSV2_URL_SDK}
#RUN tar xf ${LEDE_LINKSYS1900ACSV2_FILE_SDK}
#RUN rm ${LEDE_LINKSYS1900ACSV2_FILE_SDK}
#RUN wget ${LEDE_LINKSYS1900ACSV2_URL_SEED} -O ${LEDE_LINKSYS1900ACSV2_URL_SEED_CUSTOM_FILE}
#RUN wget ${LEDE_LINKSYS1900ACSV2_URL_MANIFEST}


#ARG LEDE_D_LINK_DIR_860L_B1_URL_BASE=https://downloads.lede-project.org/releases/${LEDE_VERSION_TOTAL}/targets/ramips/mt7621
#ARG LEDE_D_LINK_DIR_860L_B1_FILE=lede-imagebuilder-${LEDE_VERSION_TOTAL}-ramips-mt7621.Linux-x86_64.tar.xz
#ARG LEDE_D_LINK_DIR_860L_B1_URL=${LEDE_D_LINK_DIR_860L_B1_URL_BASE}/${LEDE_D_LINK_DIR_860L_B1_FILE}
#ARG LEDE_D_LINK_DIR_860L_B1_FILE_SDK=lede-sdk-${LEDE_VERSION_TOTAL}-ramips-mt7621_gcc-5.4.0_musl-1.1.16.Linux-x86_64.tar.xz
#ARG LEDE_D_LINK_DIR_860L_B1_URL_SDK=${LEDE_D_LINK_DIR_860L_B1_URL_BASE}/${LEDE_D_LINK_DIR_860L_B1_FILE_SDK}
#ARG LEDE_D_LINK_DIR_860L_B1_URL_SEED=${LEDE_D_LINK_DIR_860L_B1_URL_BASE}/config.seed
#ARG LEDE_D_LINK_DIR_860L_B1_URL_SEED_CUSTOM_FILE=ramips-mt7621.config.seed
#ARG LEDE_D_LINK_DIR_860L_B1_URL_MANIFEST=${LEDE_D_LINK_DIR_860L_B1_URL_BASE}/lede-${LEDE_VERSION_TOTAL}-ramips-mt7621.manifest

#RUN wget ${LEDE_D_LINK_DIR_860L_B1_URL}
#RUN tar xf ${LEDE_D_LINK_DIR_860L_B1_FILE}
#RUN rm ${LEDE_D_LINK_DIR_860L_B1_FILE}
#RUN wget ${LEDE_D_LINK_DIR_860L_B1_URL_SDK}
#RUN tar xf ${LEDE_D_LINK_DIR_860L_B1_FILE_SDK}
#RUN rm ${LEDE_D_LINK_DIR_860L_B1_FILE_SDK}
#RUN wget ${LEDE_D_LINK_DIR_860L_B1_URL_SEED} -O ${LEDE_D_LINK_DIR_860L_B1_URL_SEED_CUSTOM_FILE}
#RUN wget ${LEDE_D_LINK_DIR_860L_B1_URL_MANIFEST}

RUN git clone -b ${LEDE_BRANCH} git://git.lede-project.org/source.git
WORKDIR /build/source
RUN git checkout tags/v${LEDE_VERSION_TOTAL}

RUN cp feeds.conf.default feeds.conf
RUN echo 'src-git node https://github.com/nxhack/openwrt-node-packages.git' >> feeds.conf
RUN echo 'src-git darkmatter git://github.com/apollo-ng/luci-theme-darkmatter.git' >> feeds.conf
RUN echo 'src-git redis https://github.com/patrikx3/lede-redis.git' >> feeds.conf
RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a
RUN rm ./package/feeds/packages/node
RUN rm ./package/feeds/packages/node-arduino-firmata
RUN rm ./package/feeds/packages/node-cylon
RUN rm ./package/feeds/packages/node-hid
RUN rm ./package/feeds/packages/node-serialport
RUN ./scripts/feeds install -a -p node
RUN ./scripts/feeds update -a -p darkmatter
RUN ./scripts/feeds install luci-theme-darkmatter
RUN ./scripts/feeds update -a -p redis
RUN ./scripts/feeds install redis
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN mkdir -p /etc/sudoers.d
RUN echo 'docker ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt
COPY patches /build/patches
COPY make-scripts /build/source
COPY router /build/router
RUN chown -R docker:docker /build
USER docker
RUN echo "set linenumbers" > "/home/docker/.nanorc"
RUN echo "alias ll='ls -l'" >> /home/docker/.bashrc
RUN echo "SELECTED_EDITOR=\"/bin/nano\"" > /home/docker/.selected_editor
CMD /bin/bash
