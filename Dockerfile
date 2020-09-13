FROM scratch
ARG TAG=latest
ENV TAG "${TAG}"
FROM pihole/pihole:master-buster

RUN echo "$(date "+%d.%m.%Y %T") ${TAG}" >> /build_date.info
RUN echo "$(date "+%d.%m.%Y %T") ${TAG}"
