# Use the official image as a parent image.
FROM alpine:3.10

ARG name=aofe

ADD server/server.js /home

# node js version
ENV NODE_VERSION 10.19.0

# The time zone
ENV Time=Asia/Shanghai

# Add author information
MAINTAINER aouos aouos@qq.com

# use noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Switch the mirror source
# RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
# ADD mirrors/sources.list /etc/apt/

RUN echo http://mirrors.aliyun.com/alpine/v3.10/main/ > /etc/apk/repositories \
	&& echo http://mirrors.aliyun.com/alpine/v3.10/community/ >> /etc/apk/repositories

RUN apk update && apk upgrade \
	&& apk add --no-cache tzdata \
	&& ln -fs /usr/share/zoneinfo/${Time} /etc/localtime \
	&& apk add --no-cache nodejs \
	&& apk add --no-cache yarn \
	&& apk add --no-cache npm \
	&& npm install -g nrm \
	&& nrm use taobao

CMD [ "node" ]