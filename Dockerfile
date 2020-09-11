FROM testdasi/debian-buster-slim-base:latest-amd64

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN apt-get -y update && apt-get -y install wget

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
