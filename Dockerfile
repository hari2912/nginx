FROM ubuntu:18.04

RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ bionic nginx">> /etc/apt/sources.list && wget http://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD conf /etc/nginx/conf.d/ 
ADD default /etc/nginx/sites-available/default

EXPOSE 80
CMD ["nginx"]
