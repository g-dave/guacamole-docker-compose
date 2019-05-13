#!/bin/sh
#
echo "Preparing folder init and creating ./init/initdb.sql"
mkdir ./init >/dev/null 2>&1
mkdir -p ./guacamole/extensions/
wget -O ./guacamole/extensions/guacamole-auth-totp-1.0.0.tar.gz "http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/1.0.0/binary/guacamole-auth-totp-1.0.0.tar.gz"
tar xfvz ./guacamole/extensions/guacamole-auth-totp-1.0.0.tar.gz -C ./guacamole/extensions/
mv ./guacamole/extensions/guacamole-auth-totp-1.0.0/guacamole-auth-totp-1.0.0.jar ./guacamole/extensions/
chmod -R +x ./init
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > ./init/initdb.sql

echo "done"
