FROM debian:buster-slim

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y dist-upgrade \
    && apt-get autoremove \
    && apt-get auto-clean \
    && apt-get clean \
    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
