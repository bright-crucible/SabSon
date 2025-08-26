FROM python:3-alpine
ENV TZ America/Los_Angeles
RUN apk add --no-cache \
        tzdata \
        bash \
    && addgroup -S certbot -g 1000 \
    && adduser -s /sbin/nologin -u 1000 -S certbot -G certbot \
    && mkdir -p \
        /etc/letsencrypt \
        /var/lib/letsencrypt \
        /var/log/letsencrypt \
    && chown -R certbot:certbot \
        /etc/letsencrypt \
        /var/lib/letsencrypt \
        /var/log/letsencrypt \
    && pip3 install certbot_dns_porkbun
COPY entrypoint.sh /usr/local/bin
USER certbot
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
