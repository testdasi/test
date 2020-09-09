FROM debian:buster-slim

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN apt-get -y update \
    && apt-get -y dist-upgrade \
#    && apt-get -y install sudo bash nano-tiny \
    && apt-get -y install sudo bash nano \
    && apt-get autoremove \
    && apt-get auto-clean \
    && apt-get clean \
#    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*
    && rm -fr /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
