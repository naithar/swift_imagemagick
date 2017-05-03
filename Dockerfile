FROM naithar/swift:3.1.1-2
MAINTAINER Sergey Minakov <naithar@icloud.com>

ENV IMAGE_MAGICK_URL=https://www.imagemagick.org/download/releases/ImageMagick-6.9.6-8.tar.xz \
	IMAGE_MAGICK_FOLDER=ImageMagick-6.9.6-8

RUN apt-get -y update && \
	apt-get install -y --no-install-recommends apt-utils && \
	apt-get -y install imagemagick-6.q16 && \
	apt-get -y install imagemagick && \
	apt-get -y install libmagickwand-6.q16-dev && \
	apt-get -y install libmagickwand-dev && \
	apt-get -y remove imagemagick && \
	apt-get -y remove libmagickwand-dev

RUN curl -OL $IMAGE_MAGICK_URL && \
	tar -xf $IMAGE_MAGICK_FOLDER.tar.xz && \
	ls && \
	cd $IMAGE_MAGICK_FOLDER && \
	./configure --enable-shared=yes --prefix=/usr/local \
	 --disable-static --with-modules \
	 --without-perl --without-magick-plus-plus \
	 --with-quantum-depth=16 --disable-openmp \
	 --with-gs-font-dir=/usr/local/share/ghostscript/fonts && \
	make && \
	make install && \
	cd .. && \
	rm -rf ImageMagick* && \
	ldconfig /usr/local/lib

RUN convert --version

