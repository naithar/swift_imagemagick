FROM swift:3.1.1
MAINTAINER Sergey Minakov <naithar@icloud.com>

ENV IMAGE_MAGICK_URL=https://www.imagemagick.org/download/releases/ImageMagick-6.9.6-8.tar.xz

RUN apt-get -y update && \
	apt-get install -y --no-install-recommends apt-utils && \
	apt-get -y install imagemagick-6.q16 && \
	apt-get -y install imagemagick

RUN convert --version

