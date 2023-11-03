#!/usr/bin/env bash
GEOIP="/usr/share/clash/Country.mmdb"

ip rule add fwmark 1 lookup 1
ip route add local default dev lo table 1

iptables -t nat -A PREROUTING -d 0.0.0.0/8 -j RETURN
iptables -t nat -A PREROUTING -d 10.0.0.0/8 -j RETURN
iptables -t nat -A PREROUTING -d 100.64.0.0/10 -j RETURN
iptables -t nat -A PREROUTING -d 127.0.0.0/8 -j RETURN
iptables -t nat -A PREROUTING -d 169.254.0.0/16 -j RETURN
iptables -t nat -A PREROUTING -d 172.16.0.0/12 -j RETURN
iptables -t nat -A PREROUTING -d 192.0.0.0/24 -j RETURN
iptables -t nat -A PREROUTING -d 192.0.2.0/24 -j RETURN
iptables -t nat -A PREROUTING -d 192.88.99.0/24 -j RETURN
iptables -t nat -A PREROUTING -d 192.168.0.0/16 -j RETURN
iptables -t nat -A PREROUTING -d 198.51.100.0/24 -j RETURN
iptables -t nat -A PREROUTING -d 203.0.113.0/24 -j RETURN
iptables -t nat -A PREROUTING -d 224.0.0.0/4 -j RETURN
iptables -t nat -A PREROUTING -d 233.252.0.0/24 -j RETURN
iptables -t nat -A PREROUTING -d 240.0.0.0/4 -j RETURN
iptables -t nat -A PREROUTING -d 255.255.255.255/32 -j RETURN
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 53 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp -m udp --dport 53 -j REDIRECT --to-ports 53

iptables -t nat -A POSTROUTING -o lo -j RETURN
iptables -t nat -A POSTROUTING -j MASQUERADE

iptables -t mangle -A PREROUTING -d 0.0.0.0/8 -j RETURN
iptables -t mangle -A PREROUTING -d 10.0.0.0/8 -j RETURN
iptables -t mangle -A PREROUTING -d 100.64.0.0/10 -j RETURN
iptables -t mangle -A PREROUTING -d 127.0.0.0/8 -j RETURN
iptables -t mangle -A PREROUTING -d 169.254.0.0/16 -j RETURN
iptables -t mangle -A PREROUTING -d 172.16.0.0/12 -j RETURN
iptables -t mangle -A PREROUTING -d 192.0.0.0/24 -j RETURN
iptables -t mangle -A PREROUTING -d 192.0.2.0/24 -j RETURN
iptables -t mangle -A PREROUTING -d 192.88.99.0/24 -j RETURN
iptables -t mangle -A PREROUTING -d 192.168.0.0/16 -j RETURN
iptables -t mangle -A PREROUTING -d 198.51.100.0/24 -j RETURN
iptables -t mangle -A PREROUTING -d 203.0.113.0/24 -j RETURN
iptables -t mangle -A PREROUTING -d 224.0.0.0/4 -j RETURN
iptables -t mangle -A PREROUTING -d 233.252.0.0/24 -j RETURN
iptables -t mangle -A PREROUTING -d 240.0.0.0/4 -j RETURN
iptables -t mangle -A PREROUTING -d 255.255.255.255/32 -j RETURN
iptables -t mangle -A PREROUTING -p udp -m udp --dport 443 -j DROP
iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 53 -j RETURN
iptables -t mangle -A PREROUTING -p udp -m udp --dport 53 -j RETURN
iptables -t mangle -A PREROUTING ! -d 198.18.0.0/15 -p udp -m udp --dport 123 -j RETURN
iptables -t mangle -A PREROUTING -p tcp -j TPROXY --on-port 2001 --on-ip 0.0.0.0 --tproxy-mark 1
iptables -t mangle -A PREROUTING -p udp -j TPROXY --on-port 2001 --on-ip 0.0.0.0 --tproxy-mark 1

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
