FROM arm32v7/ubuntu

# Dependencies
RUN apt-get update \
  && apt-get install -y \
  gpg \
  && rm -rf /var/lib/apt/lists/*

# Tini
# For signal processing and zombie killing
ENV TINI_VERSION v0.18.0
ENV ARCH armhf
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-${ARCH} /usr/local/bin/tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-${ARCH}.asc /usr/local/bin/tini.asc
RUN gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7
RUN gpg --verify /usr/local/bin/tini.asc
RUN rm -rf /usr/local/bin/tini.asc
RUN chmod +x /usr/local/bin/tini
RUN tini -h

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
# ENTRYPOINT ["/docker-entrypoint.sh"]

ENTRYPOINT ["tini", "--"]
