FROM python:3-alpine
ENV SABNZBD_VER 4.2.3
ENV UNRAR_VER 7.0.7
ENV TZ America/Los_Angeles
RUN apk add --no-cache \
        tzdata \
        unzip \
        7zip \
        build-base \
        git \
        automake \
        autoconf \
        libffi-dev \
        openssl-dev \
        rust \
        cargo \
        par2cmdline \
        bash \
    && ln -s /usr/local/bin/python3 /usr/bin/python3 \
    && addgroup -S sabnzbd -g 1000 \
    && adduser -s /sbin/nologin -u 1000 -S sabnzbd -G sabnzbd \
    && mkdir \
        /data \
        /SABnzbd \
        /home/sabnzbd/scripts \
    && chown sabnzbd:sabnzbd \
        /data \
        /home/sabnzbd/scripts \
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
COPY --chown=sabnzbd:sabnzbd rename_mkv.sh /home/sabnzbd/scripts
USER sabnzbd
WORKDIR /SABnzbd
CMD ["./SABnzbd.py"]
