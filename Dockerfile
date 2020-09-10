FROM debian:buster

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

#RUN apt-get -y update \
#    && apt-get -y install wget apt-utils systemd \
#    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

RUN bash -c "$(wget --no-check-certificate -qO - https://raw.githubusercontent.com/arakasi72/rtinst/master/rtsetup)"

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
