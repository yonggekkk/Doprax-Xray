#!/bin/sh
# Create By ifeng ygkkk
# wget -q -O /tmp/xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/download/v1.7.0/Xray-linux-64.zip
wget -qO- https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep -o '"https://github.com/XTLS/Xray-core/releases/download/.*/Xray-linux-64.zip"' | xargs wget -qO /tmp/Xray-linux-64.zip
unzip -d /usr/local/xray /tmp/Xray-linux-64.zip
sed -i "s/uuid/$uuid/g" /etc/xray/config.yaml
sed -i "s/uuid/$uuid/g" /etc/nginx/nginx.conf
rm -rf /usr/share/nginx/*
www=${www:-'1'}
wget -c -P /usr/share/nginx "https://github.com/yonggekkk/doprax-xray/raw/main/3w/html${www}.zip" 
unzip -o "/usr/share/nginx/html${www}.zip" -d /usr/share/nginx/html
exec "$@"

