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
	# && git config --global user.name "aouos" \
	# && git config --global user.email "aouos@email.com" \
	&& apt-get install -y curl \
	&& curl -sL https://deb.nodesource.com/setup_14.x | bash - \
	&& apt-get install -y nodejs \
	&& npm install -g nrm \
	&& nrm use taobao \
	# && npm install -g @vue/cli