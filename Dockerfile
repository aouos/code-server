# Use the official image as a parent image.
FROM alpine:3.12

# workdir
WORKDIR /home/www

# Add author information
ARG name=aofe

# The time zone
ENV Time=Asia/Shanghai

# use noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Modify the mirror source
RUN echo http://mirrors.aliyun.com/alpine/v3.12/main/ > /etc/apk/repositories \
  && echo http://mirrors.aliyun.com/alpine/v3.12/community/ >> /etc/apk/repositories

RUN apk update && apk upgrade \
  && apk add --no-cache tzdata \
  && ln -fs /usr/share/zoneinfo/${Time} /etc/localtime \
  && apk add --no-cache nginx \
  && mkdir /var/run/nginx && touch /var/run/nginx/nginx.pid \
  && apk add --no-cache nodejs \
  && apk add --no-cache npm \
  && apk add --no-cache yarn

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]