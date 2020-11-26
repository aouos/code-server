FROM ubuntu

# Add author information
MAINTAINER aouos aouos@qq.com

# Switch the mirror source
# RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
ADD sources.list /etc/apt/

RUN apt-get clean

# Turn off time zone selection
ENV DEBIAN_FRONTEND = noninteractive

RUN apt-get update \
    && apt-get install -y git \
    && apt-get install -y nodejs