#!/bin/sh

#move to script directory so all relative paths work
cd "$(dirname "$0")"

#includes
. ./config.sh
. ./colors.sh

#send a message
verbose "Installing FusionPBX"

#install dependencies
pkg install --yes git ossp-uuid

#set the version
if [ .$system_branch = .'master' ]; then
	verbose "Using master"
	branch=""
else
	system_version=4.4
	verbose "Using version $system_version"
	branch="-b $system_version"
fi

#add the cache directory
mkdir -p /var/cache/fusionpbx
chown -R ${switch_user}:${switch_group} /var/cache/fusionpbx

#get the source code
git clone $branch https://github.com/fusionpbx/fusionpbx.git /usr/local/www/fusionpbx
chown -R ${switch_user}:${switch_group} /usr/local/www/fusionpbx
