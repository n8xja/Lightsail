#!/bin/bash

TF="/opt/bitnami/php/etc/php.ini"

TFT="$TF.tmp"

echo -n "Modifying $TF ... hold on..."

#create backup of orig php.ini file
sudo cp --preserve $TF $TF.save

# use SED magic to change the default limit from 40M to 128M
# write result to temp file
sudo cat $TF | sed -e 's/post_max_size = 40M/post_max_size = 128M/g' | sed -e 's/upload_max_filesize = 40M/upload_max_filesize = 128M/g' > $TFT

#copy TMP file to production file, leaving privs alone
sudo cat $TFT > $TF 

echo "Done.... Miss me? "

echo "restarting......"
sudo /opt/bitnami/ctlscript.sh restart
