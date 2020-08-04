FROM archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S openldap vim --noconfirm

WORKDIR /

COPY slapd.conf /etc/openldap
COPY base.ldif .
COPY user.ldif .
COPY start.sh .
RUN cp /var/lib/openldap/openldap-data/DB_CONFIG.example /var/lib/openldap/openldap-data/DB_CONFIG
RUN rm -rf /etc/openldap/slapd.d/*
RUN ./start.sh
#CMD /bin/bash
CMD /usr/bin/slapd -u ldap -g ldap -d Any
VOLUME /var/lib/openldap
VOLUME /var/lib/openldap/openldap-data
VOLUME /etc/openldap

