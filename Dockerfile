FROM swift:3.1.1
MAINTAINER Sergey Minakov <naithar@icloud.com>

ENV IMAGE_MAGICK_URL=https://www.imagemagick.org/download/releases/ImageMagick-6.9.6-8.tar.xz

RUN apt-get -q update && \
	apt-get -y build-dep imagemagick

RUN curl -OL $IMAGE_MAGICK_URL -o imagemagick.tar.xz
RUN tar xf imagemagick.tar.xz && \
	cd imagemagick
RUN ./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --disable-openmp --with-gs-font-dir=/usr/local/share/ghostscript/fonts
RUN make && \
	make install && \
	cd .. && \
	rm -rf imagemagick

RUN convert -v
