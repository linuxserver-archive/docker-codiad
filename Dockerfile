FROM lsiobase/nginx:3.9

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CODIAD_COMMIT
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

RUN \
 echo "**** install package ****" && \
 apk add --no-cache \
	expect \
	jq \
	openssh-client \
	php7-ldap \
	php7-zip && \
 echo "**** Tag this image with current version ****" && \
 if [ -z ${CODIAD_COMMIT+x} ]; then \
	CODIAD_COMMIT=$(curl -sX GET https://api.github.com/repos/Codiad/Codiad/commits/master \
	| jq -r '. | .sha'); \
 fi && \
 echo ${CODIAD_COMMIT} > /version.txt

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 80 443
VOLUME /config
