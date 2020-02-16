FROM mono:latest
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && apt-get update \
    && apt-get -y install \
        libmediainfo-dev \
        wget \
    && dpkg-reconfigure -f noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -g 1000 sonarr \
    && useradd -s /sbin/nologin -u 1000 -g 1000 -d /home/sonarr -m sonarr \
    && mkdir /data \
    && mkdir -p /home/sonarr/.config/Sonarr \
    && chown sonarr:sonarr /data \
    && chown -R sonarr:sonarr /home/sonarr/.config \
    && wget -O- 'https://services.sonarr.tv/v1/download/phantom-develop/latest?version=3&os=linux' \
    | tar xz
USER sonarr
WORKDIR /Sonarr
CMD ["mono", "./Sonarr.exe"]
