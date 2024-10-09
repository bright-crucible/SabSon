FROM debian:12
ENV NZBHYDRA2_VER 7.7.0
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && apt-get update \
    && apt-get -y install \
        wget \
        libfreetype6 \
        openjdk-17-jre-headless \
        python3 \
        unzip \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -g 1000 nzbhydra \
    && useradd -s /sbin/nologin -u 1000 -g 1000 -d /home/nzbhydra -m nzbhydra \
    && mkdir \
        /nzbhydra2 \
        /config \
    && chown nzbhydra:nzbhydra \
        /config \
    && cd /nzbhydra2 \
    && wget "https://github.com/theotherp/nzbhydra2/releases/download/v${NZBHYDRA2_VER}/nzbhydra2-${NZBHYDRA2_VER}-amd64-linux.zip" \
    && unzip "nzbhydra2-${NZBHYDRA2_VER}-amd64-linux.zip" \
    && rm "nzbhydra2-${NZBHYDRA2_VER}-amd64-linux.zip"
USER nzbhydra
WORKDIR /nzbhydra2
CMD ["python3", "nzbhydra2wrapperPy3.py", "--nobrowser", "--datafolder", "/config"]
