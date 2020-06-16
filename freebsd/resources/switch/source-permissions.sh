#!/bin/sh

#move to script directory so all relative paths work
cd "$(dirname "$0")"

#includes
. ./config.sh

#setup owner and group, permissions and sticky
chown -R ${switch_user}:${switch_group} /usr/local/freeswitch
chmod -R ug+rw /usr/local/freeswitch
#touch /var/log/freeswitch/freeswitch.log
#chown -R ${switch_user}:${switch_group} /var/log/freeswitch
find /usr/local/freeswitch -type d -exec chmod 2770 {} \;
