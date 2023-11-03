#!/usr/bin/env bash
GEOIP="/usr/share/clash/Country.mmdb"

while read -r i; do
    name=$(echo $i | sed 's|.yml||g')
    cfgs="/etc/clash/$name.yml"
    dirs="/var/lib/clash/$name"
    [[ ! -d "$dirs" ]] && mkdir "$dirs"
    [[ ! -f "$dirs/Country.mmdb" ]] && cp -f "$GEOIP" "$dirs"

    clash -d "$dirs" -f "$cfgs" &
done < <(ls -1 /etc/clash)

wait -n
exit $?
