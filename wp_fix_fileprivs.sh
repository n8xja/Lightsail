#!/bin/bash

sudo chown -R bitnami:daemon /opt/bitnami/apps/wordpress/htdocs/*
sudo find /opt/bitnami/apps/wordpress/htdocs -type d -exec chmod 0775 {} \;
sudo find /opt/bitnami/apps/wordpress/htdocs -type f -exec chmod 0664 {} \;
sudo chmod -R g+w /opt/bitnami/apps/wordpress/htdocs/wp-content
sudo chmod 640 /opt/bitnami/apps/wordpress/htdocs/wp-config.php
