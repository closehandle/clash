#!/usr/bin/env bash
CLASH_VERSION='v1.18.0'

wget -O         clash-linux-amd64-$CLASH_VERSION.gz https://github.com/Dreamacro/clash/releases/download/$CLASH_VERSION/clash-linux-amd64-$CLASH_VERSION.gz
gzip -d         clash-linux-amd64-$CLASH_VERSION.gz
chown root:root clash-linux-amd64-$CLASH_VERSION
chmod +x        clash-linux-amd64-$CLASH_VERSION
cp -f           clash-linux-amd64-$CLASH_VERSION clash/clash
cp -f           clash-linux-amd64-$CLASH_VERSION clash-macvlan/clash
rm -f           clash-linux-amd64-$CLASH_VERSION

wget -O yacd-gh-pages.zip https://github.com/haishanh/yacd/archive/refs/heads/gh-pages.zip
unzip   yacd-gh-pages.zip && rm -f yacd-gh-pages.zip
mv -f   yacd-gh-pages yacd
cp -fr  yacd clash
cp -fr  yacd clash-macvlan
rm -fr  yacd

exit 0
