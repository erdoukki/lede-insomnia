# docker build -t patrikx3/lede-insomnia .
# docker container ls
# docker exec -it <containerIdOrName> bash
# docker attach <id>
# docker run -t -i patrikx3/lede-insomnia bash
FROM patrikx3/openwrt-insomnia:base
MAINTAINER patrikx3/lede-insomnia - Patrik Laszlo - alabard@gmail.com

ARG LEDE_VERSION_TOTAL=17.01.4
ARG LEDE_BRANCH=lede-17.01
ENV LEDE_VERSION_TOTAL=${LEDE_VERSION_TOTAL}
ENV LEDE_BRANCH=${LEDE_BRANCH}

#RUN git clone -b ${LEDE_BRANCH} git://git.openwrt.org/source.git
RUN git clone git://git.openwrt.org/openwrt/openwrt.git source
WORKDIR /build/source
RUN git checkout tags/v${LEDE_VERSION_TOTAL}

RUN cp feeds.conf.default feeds.conf
RUN echo 'src-git node https://github.com/nxhack/openwrt-node-packages.git' >> feeds.conf
RUN echo 'src-git redis https://github.com/patrikx3/lede-redis.git' >> feeds.conf
RUN echo 'src-git mariadb https://github.com/patrikx3/lede-mariadb.git' >> feeds.conf
RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a
RUN ./scripts/feeds update node
RUN rm -rf ./package/feeds/packages/node*
#RUN rm ./package/feeds/packages/node-arduino-firmata
#RUN rm ./package/feeds/packages/node-cylon
#RUN rm ./package/feeds/packages/node-hid
#RUN rm ./package/feeds/packages/node-serialport
RUN ./scripts/feeds install -a -p node
RUN ./scripts/feeds update redis
RUN ./scripts/feeds install -a -p  redis
RUN ./scripts/feeds update mariadb
RUN ./scripts/feeds install -a -p mariadb

COPY make-scripts /build/source
RUN sudo find /build -user root -exec chown docker:docker {} \;

CMD /bin/bash

