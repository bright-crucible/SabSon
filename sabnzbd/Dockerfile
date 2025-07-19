FROM python:3-alpine
ENV SABNZBD_VER 4.5.2
ENV UNRAR_VER 7.1.8
ENV PAR2MCDLINE_VER 1.3.0
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
    && wget -O- https://github.com/animetosho/par2cmdline-turbo/archive/refs/tags/v${PAR2MCDLINE_VER}.tar.gz \
    | tar xz \
    && cd par2cmdline-turbo-${PAR2MCDLINE_VER} \
    && ./automake.sh \
    && ./configure \
    && make -j12 \
    && make install \
    && cd .. \
    && rm -rf par2cmdline-turbo-${PAR2MCDLINE_VER} \
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
