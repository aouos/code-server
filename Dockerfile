# Use the official image as a parent image.
FROM ubuntu

ARG name=aofe

# Add author information
MAINTAINER aouos aouos@qq.com

# Switch the mirror source
# RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
ADD mirrors/sources.list /etc/apt/

ADD shell/gitic /bin

RUN apt-get clean

# use noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install -y tzdata \
	&& ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& apt-get install -y git \
	&& apt-get install -y curl \
	&& curl -sL https://deb.nodesource.com/setup_14.x | bash - \
	&& apt-get install -y nodejs \
	&& npm install -g nrm \
	&& nrm use taobao \
	&& cd /bin \
	&& chmod 777 gitic