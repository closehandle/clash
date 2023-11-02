#!/usr/bin/env bash
ip rule add fwmark 1 lookup 1
ip route add local default dev lo table 1

iptables -t nat -A PREROUTING -d $SUBNET -j RETURN
iptables -t nat -A PREROUTING -m addrtype ! --dst-type UNICAST -j RETURN
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 53 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -p udp -m udp --dport 53 -j REDIRECT --to-ports 53

iptables -t nat -A POSTROUTING -o lo -j RETURN
iptables -t nat -A POSTROUTING -j MASQUERADE

iptables -t mangle -A PREROUTING -m addrtype ! --dst-type UNICAST -j RETURN
iptables -t mangle -A PREROUTING -p udp -m udp --dport 443 -j DROP
iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 53 -j RETURN
iptables -t mangle -A PREROUTING -p udp -m udp --dport 53 -j RETURN
iptables -t mangle -A PREROUTING -p tcp -j TPROXY --on-port 2001 --on-ip 0.0.0.0 --tproxy-mark 1
iptables -t mangle -A PREROUTING -p udp -j TPROXY --on-port 2001 --on-ip 0.0.0.0 --tproxy-mark 1

exec clash -d /var/lib/clash -f /etc/clash.yml
