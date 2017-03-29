FROM lsiobase/alpine.nginx:3.5
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
apk add --no-cache \
	git \
	expect && \
 apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/community \
	php7-ldap \
	php7-zip

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 80 443
VOLUME /config
