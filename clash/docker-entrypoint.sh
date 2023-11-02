#!/usr/bin/env bash

while read -r i; do
    name=$(echo $i | sed 's|.yml||g')

    if [[ "$name" != 'default' ]]; then
        cfgs="/etc/clash/$name.yml"
        dirs="/var/lib/clash/$name"

        if [[ ! -d "$dirs" ]]; then
            mkdir  "$dirs"
            cp -f  /var/lib/clash/Country.mmdb "$dirs"
        fi

        clash -d "$dirs" -f "$cfgs" &
    fi
done < <(ls -1 /etc/clash)

if [[ ! -d /var/lib/clash/default ]]; then
    mkdir  /var/lib/clash/default
    cp -f  /var/lib/clash/Country.mmdb /var/lib/clash/default
fi

exec clash -d /var/lib/clash/default -f /etc/clash/default.yml
