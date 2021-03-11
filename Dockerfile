# Use the official image as a parent image.
FROM ubuntu:20.04

# mkdir dir
RUN mkdir /home/aouos

# workdir
WORKDIR /home/aouos

# Add author information
ARG name=codesr

# The time zone
ENV Time=Asia/Shanghai

# use noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y tzdata \
  && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && apt-get install -y wget \
  && wget https://github.com/cdr/code-server/releases/download/v3.9.1/code-server-3.9.1-linux-amd64.tar.gz \
  && tar -xvzf code-server-3.9.1-linux-amd64.tar.gz \
  && rm code-server-3.9.1-linux-amd64.tar.gz \
  && mkdir /usr/lib/codesr \
  && cp -r /home/aouos/code-server-3.9.1-linux-amd64/* /usr/lib/codesr/ \
  && ln -s /usr/lib/codesr/code-server /usr/bin/code-server \
  && rm -r code-server-3.9.1-linux-amd64

EXPOSE 8080

# CMD ["nohup", "code-server", "--host", "0.0.0.0", "--port", "8080", "--auth", "none", "&"]