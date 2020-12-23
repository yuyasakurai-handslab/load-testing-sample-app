FROM nginx:alpine

EXPOSE 8080

COPY src /usr/share/nginx/html

COPY conf/nginx /etc/nginx/conf.d

RUN apk add openssl \
&& echo "hogeuser:$(openssl passwd -crypt loadtesthoge)" >> /etc/nginx/.htpasswd
