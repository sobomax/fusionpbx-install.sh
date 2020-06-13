#!/bin/sh

set -e

#move to script directory so all relative paths work
cd "$(dirname "$0")"

#includes
. ../config.sh

#install dependencies
pkg install --yes tiff ghostscript9-base memcached

#set the current working directory
cwd=$(pwd)

#send a message
echo "Installing the FreeSWITCH package"

FS_PDIR="/usr/ports/net/freeswitch"
MAKE_ARGS="-DBATCH"

#install the package
if [ .$portsnap_enabled = .'true' ]; then
	#dbatch uses the defaults alternative is make config-recursive
	make -C "${FS_PDIR}" "${MAKE_ARGS}" install clean
else
	if [ .$switch_source = ."portpkghybrid" ]; then
		PKGS=""
		for dir in `make -C "${FS_PDIR}" "${MAKE_ARGS}" build-depends-list run-depends-list | sort -u`
		do
			PKGS="`make -C "${dir}" -V PKGNAME | sed 's|-[^-]*$||'` ${PKGS}"
		done
		pkg install --yes --automatic ${PKGS}
		make -C "${FS_PDIR}" "${MAKE_ARGS}" clean install clean
		pkg autoremove --yes
	else
		pkg install --yes freeswitch
	fi
fi

#set the original working directory
cd $cwd

#configure system service
#cp "$(dirname $0)/rc.d.freeswitch" /usr/local/etc/rc.d/freeswitch
#chmod u-w,ugo+x /usr/local/etc/rc.d/freeswitch

#enable the services
echo 'memcached_enable="YES"' >> /etc/rc.conf
echo 'freeswitch_enable="YES"' >> /etc/rc.conf
echo 'freeswitch_flags="-nonat"' >> /etc/rc.conf
echo 'freeswitch_user="www"' >> /etc/rc.conf
echo 'freeswitch_group="www"' >> /etc/rc.conf

#start the service
service memcached start
