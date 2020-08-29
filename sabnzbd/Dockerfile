FROM python:3-alpine
ENV SABNZBD_VER 3.0.2RC2
ENV TZ America/Los_Angeles
RUN apk add --no-cache \
        tzdata \
        unrar \
        unzip \
        p7zip \
        build-base \
        git \
        automake \
        autoconf \
        libffi-dev \
        openssl-dev \
    && ln -s /usr/local/bin/python3 /usr/bin/python3 \
    && addgroup -S sabnzbd -g 1000 \
    && adduser -s /sbin/nologin -u 1000 -S sabnzbd -G sabnzbd \
    && mkdir \
        /data \
        /SABnzbd \
    && chown sabnzbd:sabnzbd \
        /data \
    && git clone https://github.com/Parchive/par2cmdline.git \
    && cd par2cmdline \
    && aclocal \
    && automake --add-missing \
    && autoconf \
    && ./configure \
    && make -j12 \
    && make install \
    && cd .. \
    && rm -rf par2cmdline \
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
