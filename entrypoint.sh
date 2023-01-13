#!/bin/sh
apt update && apt install -y supervisor wget unzip iproute2
xpid=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 6)
xr(){
wget -qO- https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep -o '"https://github.com/XTLS/Xray-core/releases/download/.*/Xray-linux-64.zip"' | xargs wget -O m.zip
[ ! -f m.zip ] && wget -O xm.zip https://github.com/XTLS/Xray-core/releases/download/v1.7.2/Xray-linux-64.zip
unzip m.zip
rm -f m.zip && chmod a+x xray
mv xray $xpid
}
vr(){
wget -O m.zip https://github.com/v2fly/v2ray-core/releases/download/v4.45.0/v2ray-linux-64.zip
unzip m.zip
rm -f m.zip && chmod a+x v2ray
mv v2ray $xpid
}
[ -z "${v2ray}" ] && xr || vr
sed -i "s/uuid/$uuid/g" ./config.json
sed -i "s/uuid/$uuid/g" /etc/nginx/nginx.conf
[ -n "${www}" ] && rm -rf /usr/share/nginx/* && wget -c -P /usr/share/nginx "https://github.com/yonggekkk/doprax-xray/raw/main/3w/html${www}.zip" && unzip -o "/usr/share/nginx/html${www}.zip" -d /usr/share/nginx/html
cat config.json | base64 > config
rm -f config.json
nginx
base64 -d config > config.json; ./$xpid -config=config.json
