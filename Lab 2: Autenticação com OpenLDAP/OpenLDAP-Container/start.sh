#!/bin/bash -e

chown -R ldap:ldap /etc/openldap/slapd.d
/usr/bin/slapd -u ldap -g ldap
ldapadd -D "cn=root,dc=ces33,dc=com" -w ces33 -f base.ldif
ldapadd -D "cn=root,dc=ces33,dc=com" -w ces33 -f user.ldif
slaptest -f /etc/openldap/slapd.conf -F /etc/openldap/slapd.d/
chown -R ldap:ldap /etc/openldap/slapd.d
#/usr/bin/slapd -u ldap -g ldap -d Any
