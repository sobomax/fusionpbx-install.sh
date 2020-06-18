#!/bin/sh -x

set -e

#move to script directory so all relative paths work
cd "$(dirname "$0")"

#includes
. ./config.sh

#add the cache directory
mkdir -p /var/cache/fusionpbx
chown -R ${switch_user}:${switch_group} /var/cache/fusionpbx

#set owner of the source code
chown -R ${switch_user}:${switch_group} /usr/local/www/fusionpbx
