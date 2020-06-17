#!/bin/sh -x

#includes
. ./config.sh

#make a backup of the conf directory
mv /usr/local/freeswitch/conf /usr/local/freeswitch/conf.orig

#copy the default conf directory
mkdir -p /usr/local/freeswitch/conf
cp -R /usr/local/www/fusionpbx/resources/templates/conf/* /usr/local/freeswitch/conf

#copy the scripts
cp -R /usr/local/www/fusionpbx/resources/install/scripts /usr/local/freeswitch
chown -R ${switch_user}:${switch_group} /usr/local/freeswitch
