FROM debian:12
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && apt-get update \
    && apt-get -y install \
        wget \
        ca-certificates \
        sqlite3 \
        curl \
        libicu-dev \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -g 1000 sonarr \
    && useradd -s /sbin/nologin -u 1000 -g 1000 -d /home/sonarr -m sonarr \
    && mkdir /data \
    && mkdir -p /home/sonarr/.config/Sonarr \
    && chown sonarr:sonarr /data \
    && chown -R sonarr:sonarr /home/sonarr/.config \
    && wget -O- 'https://services.sonarr.tv/v1/download/main/latest?version=4&os=linux&arch=x64' \
    | tar xz
USER sonarr
WORKDIR /Sonarr
CMD ["./Sonarr"]
