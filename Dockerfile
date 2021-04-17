# Use the official image as a parent image.
FROM ubuntu:20.04

# mkdir dir
RUN mkdir /home/aouos

# workdir
WORKDIR /home/aouos

# Add author information
MAINTAINER aouos

ARG name=code-server

ADD sources.list /etc/apt/
ADD coderun /usr/bin

# The time zone
ENV timezone=Asia/Shanghai
ENV version=3.9.3

# use noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y tzdata \
  && ln -fs /usr/share/zoneinfo/$timezone /etc/localtime \
  && apt-get install -y wget \
  && wget https://github.com/cdr/code-server/releases/download/v$version/code-server-$version-linux-amd64.tar.gz \
  && tar -xvzf code-server-$version-linux-amd64.tar.gz \
  && rm code-server-$version-linux-amd64.tar.gz \
  && mkdir /usr/lib/codesr \
  && cp -r /home/aouos/code-server-$version-linux-amd64/* /usr/lib/codesr/ \
  && ln -s /usr/lib/codesr/code-server /usr/bin/code-server \
  && rm -r code-server-$version-linux-amd64 \
  && cd /usr/bin \
  && chmod 777 coderun

EXPOSE 8080