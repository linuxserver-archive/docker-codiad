FROM linuxserver/baseimage.apache
MAINTAINER smdion <me@seandion.com>

ENV APTLIST="git expect php5-ldap"

# install main packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \

# cleanup
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add some files 
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# ports and volumes
EXPOSE 80 443
VOLUME /config
