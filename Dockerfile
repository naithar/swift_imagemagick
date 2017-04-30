FROM swift:3.1.1
MAINTAINER Sergey Minakov <naithar@icloud.com>

ENV IMAGE_MAGICK_URL=https://www.imagemagick.org/download/releases/ImageMagick-6.9.6-8.tar.xz

RUN apt-get -y update && \
	apt-get install -y --no-install-recommends apt-utils && \
	apt-get -y install imagemagick-6.q16 && \
	apt-get -y install imagemagick && \
	apt-get -y install libmagickwand-6.q16-dev && \
	apt-get -y install libmagickwand-dev && \
	apt-get -y remove imagemagick && \
	apt-get -y remove libmagickwand-dev

RUN curl -OL $IMAGE_MAGICK_URL -o imagemagick.tar.xz && \
	tar xf imagemagick.tar.xz && \
	cd imagemagick && \
	./configure --prefix=/usr/local \
	 --disable-static --with-modules \
	 --without-perl --without-magick-plus-plus \
	 --with-quantum-depth=8 --disable-openmp \
	 --with-gs-font-dir=/usr/local/share/ghostscript/fonts && \
	make && \
	make install && \
	cd .. && \
	rm -rf imagemagick*

RUN convert --version

