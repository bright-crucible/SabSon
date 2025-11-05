FROM debian:13
ENV MEDIAAREA_VER 1.0-26
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && apt-get update \
    && apt-get -y install \
        wget \
        ca-certificates \
        sqlite3 \
        curl \
        libicu-dev \
        libchromaprint-tools \
        apt-transport-https \
    && wget https://mediaarea.net/repo/deb/repo-mediaarea_${MEDIAAREA_VER}_all.deb \
    && dpkg -i repo-mediaarea_${MEDIAAREA_VER}_all.deb \
    && rm repo-mediaarea_${MEDIAAREA_VER}_all.deb \
    && apt-get update \
    && apt-get -y install \
        libmediainfo-dev \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -g 1000 lidarr \
    && useradd -s /sbin/nologin -u 1000 -g 1000 -d /home/lidarr -m lidarr \
    && mkdir /data \
    && mkdir -p /home/lidarr/.config/Lidarr \
    && chown lidarr:lidarr /data \
    && chown -R lidarr:lidarr /home/lidarr/.config \
    && wget -O- 'https://lidarr.servarr.com/v1/update/master/updatefile?os=linux&runtime=netcore&arch=x64' \
    | tar xz
USER lidarr
WORKDIR /Lidarr
CMD ["./Lidarr"]
