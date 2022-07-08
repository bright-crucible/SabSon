FROM mono:latest
ENV MEDIAAREA_VER 1.0-20
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
    && echo $TZ > /etc/localtime \
    && apt-get update \
    && apt-get -y install \
        wget \
        ca-certificates \
        apt-transport-https \
    && wget https://mediaarea.net/repo/deb/repo-mediaarea_${MEDIAAREA_VER}_all.deb \
    && dpkg -i repo-mediaarea_${MEDIAAREA_VER}_all.deb \
    && rm repo-mediaarea_${MEDIAAREA_VER}_all.deb \
    && apt-get update \
    && apt-get -y install \
        libmediainfo-dev \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -g 1000 radarr \
    && useradd -s /sbin/nologin -u 1000 -g 1000 -d /home/radarr -m radarr \
    && mkdir /data \
    && mkdir -p /home/radarr/.config/Radarr \
    && chown radarr:radarr /data \
    && chown -R radarr:radarr /home/radarr/.config \
    && wget -O- 'https://radarr.servarr.com/v1/update/master/updatefile?os=linux&runtime=netcore&arch=x64' \
    | tar xz
USER radarr
WORKDIR /Radarr
CMD ["./Radarr"]
