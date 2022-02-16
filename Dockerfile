ARG FRM='testdasi/ubuntu-mono'
ARG TAG='latest'
ARG DEBIAN_FRONTEND='noninteractive'

FROM ${FRM}:${TAG}
ARG FRM
ARG TAG

## build note ##
RUN echo "$(date "+%d.%m.%Y %T") Built from ${FRM}:${TAG}" >> /build.info

## install static codes ##
RUN rm -Rf /testdasi \
    && mkdir -p /temp \
    && cd /temp \
    && curl -L "https://github.com/testdasi/static-ubuntu/archive/main.zip" -o /temp/temp.zip \
    && unzip /temp/temp.zip \
    && rm -f /temp/temp.zip \
    && mv /temp/static-ubuntu-main /testdasi \
    && rm -Rf /testdasi/deprecated

## execute execute execute ##
RUN /bin/bash /testdasi/scripts-install/install-openvpn-the-one-docker-base.sh

## debug mode (comment to disable) ##
RUN cp /testdasi/scripts-debug/* / && chmod +x /*.sh
ENTRYPOINT ["tini", "--", "/entrypoint.sh"]

## Final clean up ##
# RUN rm -Rf /testdasi
