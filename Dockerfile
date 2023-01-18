ARG FRM='testdasi/ubuntu-base'
#ARG FRM='testdasi/ubuntu-mono'
ARG TAG='latest'
ARG DEBIAN_FRONTEND='noninteractive'

#FROM ${FRM}:${TAG}
FROM ${FRM}:s230118
ARG FRM
ARG TAG
ARG TARGETPLATFORM

## build note ##
RUN echo "$(date "+%d.%m.%Y %T") Built from ${FRM}:${TAG}" >> /build.info

## install static codes ##
RUN rm -Rf /testdasi \
    && mkdir -p /temp \
    && cd /temp \
    && curl -sL "https://github.com/testdasi/static-ubuntu/archive/main.zip" -o /temp/temp.zip \
    && unzip /temp/temp.zip \
    && rm -f /temp/temp.zip \
    && mv /temp/static-ubuntu-main /testdasi \
    && rm -Rf /testdasi/deprecated

## execute execute execute ##
#RUN /bin/bash /testdasi/scripts-install/install-test.sh

## debug mode (comment to disable) ##
RUN /bin/bash /testdasi/scripts-install/install-debug-mode.sh
#RUN /bin/bash /testdasi/scripts-install/install-debug-test.sh
ENTRYPOINT ["tini", "--", "/entrypoint.sh"]

## Final clean up ##
#RUN rm -Rf /testdasi
