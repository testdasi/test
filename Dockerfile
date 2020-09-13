FROM scratch
ARG TAG=latest
ENV TAG "${TAG}"
RUN echo "$(date "+%d.%m.%Y %T") scratch ${TAG}" >> /build_date.info

FROM pihole/pihole:master-buster

RUN echo "$(date "+%d.%m.%Y %T") pihole ${TAG}" >> /build_date.info
