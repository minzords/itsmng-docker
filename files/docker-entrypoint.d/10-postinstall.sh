#!/bin/sh
sleep 10

if [ ! -f /etc/itsm-ng/config_db.php ]; then
	echo "Installing ITSM-NG"
	cd /usr/share/itsm-ng && php bin/console itsmng:database:install -H $MARIADB_HOST -u $MARIADB_USER -p $MARIADB_PASSWORD -d $MARIADB_DATABASE -n
fi

if [ -f /etc/itsm-ng/config_db.php ]; then
	echo "Updating ITSM-NG"
	cd /usr/share/itsm-ng && php bin/console itsmng:database:update -n
fi

if [ -f /usr/share/itsm-ng/install/install.php ]; then
	echo "Removing install.php file"
	rm /usr/share/itsm-ng/install/install.php
fi
