ARG FRM='testdasi/debian-buster-slim-base'
ARG TAG='latest-mono-amd64'

FROM ${FRM}:${TAG}
ARG FRM
ARG TAG

ADD scripts /
RUN chmod +x /*.sh

ENTRYPOINT ["/entrypoint.sh"]

RUN echo "$(date "+%d.%m.%Y %T") tag ${TAG}, target platform ${TARGETPLATFORM}, build platform ${BUILDPLATFORM}"
