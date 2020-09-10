FROM testdasi/debian-buster-slim-base:latest-amd64

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN apt-get -y update \
    && apt-get -y install wget
    && rm -fr /tmp/* /var/tmp/* /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
