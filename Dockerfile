ARG TAG=latest
FROM pihole/pihole:master-buster
ARG TAG

RUN echo "$(date "+%d.%m.%Y %T") ${TAG}" >> /build_date.info
RUN echo "$(date "+%d.%m.%Y %T") ${TAG}"
