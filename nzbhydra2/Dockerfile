FROM python:3-alpine
ENV NZBHYDRA2_VER 5.1.8
ENV TZ America/Los_Angeles
RUN apk add --no-cache \
        tzdata \
        openjdk17-jre-headless \
    && addgroup -S nzbhydra -g 1000 \
    && adduser -s /sbin/nologin -u 1000 -S nzbhydra -G nzbhydra \
    && mkdir \
        /nzbhydra2 \
        /config \
    && chown nzbhydra:nzbhydra \
        /config \
    && cd /nzbhydra2 \
    && wget "https://github.com/theotherp/nzbhydra2/releases/download/v${NZBHYDRA2_VER}/nzbhydra2-${NZBHYDRA2_VER}-generic.zip" \
    && unzip "nzbhydra2-${NZBHYDRA2_VER}-generic.zip" \
    && rm "nzbhydra2-${NZBHYDRA2_VER}-generic.zip"
USER nzbhydra
WORKDIR /nzbhydra2
CMD ["python3", "nzbhydra2wrapperPy3.py", "--nobrowser", "--datafolder", "/config"]
