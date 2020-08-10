# Created by Tony Schliesser - N8XJA
# 
# Installs wpcli in lightsail and the tab completion for bash.
# Run the script and then log out and back in to activate the tab completion
# 
#

#!/bin/bash

mkdir /home/bitnami/wpcli
cd /home/bitnami/wpcli

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
echo "*****************************************"
php wp-cli.phar --info
echo "*****************************************"

chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

echo "*****************************************"


wp --info

curl -O https://raw.githubusercontent.com/wp-cli/wp-cli/v2.4.0/utils/wp-completion.bash
echo "source /home/bitnami/wpcli/wp-completion.bash" >> /home/bitnami/.profile

echo "\n\nFinished. Log out and log back in"
