FROM haproxy

RUN apt-get update && apt-get install -y \
      inotify-tools \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
      /tmp/* \
      /var/tmp/*

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
