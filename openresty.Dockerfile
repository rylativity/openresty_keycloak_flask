FROM openresty/openresty:alpine-fat

RUN mkdir /var/log/nginx
RUN apk add --no-cache openssl-dev
RUN apk add --no-cache git
RUN apk add --no-cache gcc
RUN luarocks install lua-resty-openidc

COPY ./nginx_conf/proxy.conf /etc/nginx/proxy.conf
COPY ./nginx_conf/nginx.conf /etc/nginx/nginx.conf

## The COPY and RUN commands below produce a configuration file from the default.conf.template file and the docker .env variables
ARG FRONTEND_HOSTNAME
ARG DOCKER_HOST_URL
COPY ./nginx_conf/default.conf.template /etc/nginx/default.conf.template
RUN ["/bin/bash", "-c", "envsubst '$$FRONTEND_HOSTNAME $$DOCKER_HOST_URL' < /etc/nginx/default.conf.template > /etc/nginx/conf.d/default.conf"]
RUN cat /etc/nginx/conf.d/default.conf

ENTRYPOINT ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]