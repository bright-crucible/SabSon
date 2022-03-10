FROM python:3-alpine
ENV SABNZBD_VER 3.5.2
ENV UNRAR_VER 6.1.6
ENV TZ America/Los_Angeles
RUN apk add --no-cache \
        tzdata \
        unzip \
        p7zip \
        build-base \
        git \
        automake \
        autoconf \
        libffi-dev \
        openssl-dev \
        rust \
        cargo \
        par2cmdline \
    && ln -s /usr/local/bin/python3 /usr/bin/python3 \
    && addgroup -S sabnzbd -g 1000 \
    && adduser -s /sbin/nologin -u 1000 -S sabnzbd -G sabnzbd \
    && mkdir \
        /data \
        /SABnzbd \
    && chown sabnzbd:sabnzbd \
        /data \
    && wget -O- https://www.rarlab.com/rar/unrarsrc-${UNRAR_VER}.tar.gz \
    | tar xz \
    && cd unrar \
    && make -j12 \
    && make install \
    && cd .. \
    && rm -rf unrar \
    && git clone https://github.com/sabnzbd/sabnzbd.git SABnzbd \
    && cd SABnzbd \
    && git checkout tags/${SABNZBD_VER} \
    && rm -rf .git \
    && python3 -m pip install --no-cache-dir -r requirements.txt -U \
    && tools/make_mo.py
COPY rename_mkv.sh /SABnzbd/scripts
USER sabnzbd
WORKDIR /SABnzbd
CMD ["./SABnzbd.py"]
