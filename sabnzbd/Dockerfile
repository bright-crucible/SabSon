FROM python:2-alpine
ENV SABNZBD_VER 2.3.9
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
    && ln -s /usr/local/bin/python /usr/bin/python \
    && addgroup -S sabnzbd -g 1000 \
    && adduser -s /usr/sbin/nologin -u 1000 -S sabnzbd -G sabnzbd \
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
    && pip install --no-cache-dir \
        cheetah3 \
        cryptography \
        sabyenc \
    && wget -O- https://github.com/sabnzbd/sabnzbd/releases/download/${SABNZBD_VER}/SABnzbd-${SABNZBD_VER}-src.tar.gz \
    | tar xz -C /SABnzbd --strip-components=1
USER sabnzbd
WORKDIR /SABnzbd
#CMD ["python", "-OO", "./SABnzbd.py"]
#CMD ["python", "-OO", "./SABnzbd.py", "--server", "0.0.0.0:8080"]
CMD ["./SABnzbd.py"]
