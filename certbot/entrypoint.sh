#!/bin/sh
set -e
touch /var/log/letsencrypt/letsencrypt.log
exec tail -F /var/log/letsencrypt/letsencrypt.log
