#!/bin/bash
TARGET="/opt/bitnami/php/etc/php.ini"

TMPFILE="$HOME/php.ini.tmp"

echo "$TMPFILE"
echo "Modifying $TARGET ... hold on..."


#create backup of orig php.ini file
sudo cp -v --preserve $TARGET $TARGET.save




# use SED magic to change the default limit from 40M to 128M
# write result to temp file

sudo cat $TARGET | sed -e 's/post_max_size = 40M/post_max_size = 128M/g' | sed -e 's/upload_max_filesize = 40M/upload_max_filesize = 128MF/g' > $TMPFILE

#copy TMP file to production file, leaving privs alone

sudo cat $TMPFILE > $TARGET

# remove temp file:
rm -f $TMPFILE


echo "Done.... Miss me? "

echo "restarting......"
sudo /opt/bitnami/ctlscript.sh restart


diff $TARGET $TARGET.save
