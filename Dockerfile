FROM debian:buster-backports

RUN apt-get update && \
  apt-get -y install libjansson-dev libconfig-dev openssl git build-essential libopus-dev libffi-dev libpcre3-dev libmicrohttpd-dev libsofia-sip-ua-dev libogg-dev libcurl4-openssl-dev liblua5.3-dev libconfig-dev pkg-config gengetopt libtool automake zlib1g-dev python3-setuptools libusrsctp-dev libcurl4 libcurl4-openssl-dev libssl-dev tar wget && \
  apt-get -y -t buster-backports install meson && \
  wget https://github.com/cisco/libsrtp/archive/v2.3.0.tar.gz && tar xzf v2.3.0.tar.gz && cd libsrtp-2.3.0 && \
  ./configure --enable-openssl --prefix=/usr && make shared_library && make install && cd .. && \
  git clone https://gitlab.freedesktop.org/libnice/libnice && \
  cd libnice && meson --prefix=/usr build && ninja -C build && ninja -C build install && cd .. && \
  git clone https://github.com/meetecho/janus-gateway.git && cd janus-gateway && \
  sh autogen.sh && ./configure --prefix=/opt/janus && make && make install && make configs




