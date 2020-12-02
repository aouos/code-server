# Use the official image as a parent image.
FROM ubuntu:20.04

# workdir
WORKDIR /home

# Add author information
LABEL author=aouos

# simple server
ADD server/server.js /home

# Switch the mirror source
# RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
ADD mirrors/sources.list /etc/apt/

RUN apt-get clean

# use noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& mkdir www \
	&& apt-get install -y tzdata \
	&& ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& apt-get install -y curl \
	&& curl -sL https://deb.nodesource.com/setup_14.x | bash - \
	&& apt-get install -y nodejs \
	&& npm install -g nrm \
	&& nrm use taobao \
	&& npm install -g yarn \
	&& yarn config set registry https://registry.npm.taobao.org

EXPOSE 1314

CMD [ "node", "server.js" ]