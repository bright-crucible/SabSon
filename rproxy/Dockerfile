FROM nginx:mainline
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && usermod -u 1000 nginx \
    && groupmod -g 1000 nginx
COPY default.conf /etc/nginx/conf.d/default.conf
