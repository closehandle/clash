#!/usr/bin/env bash
CLASH_VERSION='v1.18.0'

wget -O         clash-linux-amd64-$CLASH_VERSION.gz https://github.com/Dreamacro/clash/releases/download/$CLASH_VERSION/clash-linux-amd64-$CLASH_VERSION.gz
gzip -d         clash-linux-amd64-$CLASH_VERSION.gz
chown root:root clash-linux-amd64-$CLASH_VERSION
chmod +x        clash-linux-amd64-$CLASH_VERSION
cp -f           clash-linux-amd64-$CLASH_VERSION clash/clash
cp -f           clash-linux-amd64-$CLASH_VERSION clash-macvlan/clashr
rm -f           clash-linux-amd64-$CLASH_VERSION

wget -O Country.mmdb https://raw.githubusercontent.com/closehandle/ipip2mmdb/release/Country.mmdb
cp   -f Country.mmdb clash
cp   -f Country.mmdb clash-macvlan
rm   -f Country.mmdb

exit 0
