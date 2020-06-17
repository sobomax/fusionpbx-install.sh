#!/bin/sh -x

#includes
. ./config.sh

#default permissions
chown -R ${switch_user}:${switch_group} /usr/local/etc/freeswitch
chown -R ${switch_user}:${switch_group} /var/lib/freeswitch
chown -R ${switch_user}:${switch_group} /usr/local/share/freeswitch
chown -R ${switch_user}:${switch_group} /var/log/freeswitch
chown -R ${switch_user}:${switch_group} /var/run/freeswitch
