#!/bin/sh -x

#includes
. ./config.sh

#make a backup of the conf directory
#mv /usr/local/etc/freeswitch /usr/local/etc/freeswitch.orig

#copy the default conf directory
mkdir -p /usr/local/etc/freeswitch
cp -R /usr/local/www/fusionpbx/resources/templates/conf/* /usr/local/etc/freeswitch

#copy the scripts
cp -R /usr/local/www/fusionpbx/app/scripts/resources/scripts /usr/local/share/freeswitch
chown -R ${switch_user}:${switch_group} /usr/local/share/freeswitch
