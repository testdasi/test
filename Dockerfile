ARG TARGETPLATFORM=${BUILDPLATFORM}
ARG TAG=latest
FROM pihole/pihole:master-buster
ARG TAG
ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN echo "$(date "+%d.%m.%Y %T") tag ${TAG}, target platform ${TARGETPLATFORM}, build platform ${BUILDPLATFORM}"
