FROM testdasi/debian-buster-slim-base:latest-amd64

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN sed -i 's|main|main contrib non-free|g' /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y install wget

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
