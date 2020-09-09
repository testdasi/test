FROM debian:buster-slim

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

#RUN apt-get -y update \
#    && apt-get -y upgrade \
#    && apt-get -y dist-upgrade \
#    && apt-get autoremove \
#    && apt-get auto-clean \
#    && apt-get clean \
#    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
