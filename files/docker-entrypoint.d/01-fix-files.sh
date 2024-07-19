#!/bin/sh

sleep 15

# Compatibility with old versions of ITSM-NG < 2.0.0
if [ -f /var/www/itsm-ng/config/config_db.php ]; then
    rm /etc/itsm-ng/*
    mv /var/www/itsm-ng/config/* /etc/itsm-ng
    chown -R apache:apache /etc/itsm-ng
fi

if [ ! -f /etc/itsm-ng/local_define.php ]; then
    if [ -f /var/www/itsm-ng/files/_uploads/remove.txt ]; then
        echo -e "<?php\ndefine('GLPI_VAR_DIR', '/var/www/itsm-ng/files');\ndefine('GLPI_DOC_DIR', GLPI_VAR_DIR);\n" > /etc/itsm-ng/local_define.php
        chown -R apache:apache /var/www/itsm-ng/files
    else
        echo -e "<?php\ndefine('GLPI_VAR_DIR', '/var/lib/itsm-ng');\ndefine('GLPI_DOC_DIR', GLPI_VAR_DIR);\n" > /etc/itsm-ng/local_define.php
        chown apache:apache /var/lib/itsm-ng
    fi
fi