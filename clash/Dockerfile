FROM debian:latest

RUN apt update && \
    apt dist-upgrade -y && \
    apt autoremove --purge -y && \
    apt install dnsutils iproute2 iptables net-tools ca-certificates -y

ADD clash /usr/bin/clash
ADD yacd  /usr/share/yacd
ADD docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN mkdir /usr/share/clash
ADD https://raw.githubusercontent.com/closehandle/ipip2mmdb/release/Country.mmdb /usr/share/clash/Country.mmdb

CMD ["bash", "docker-entrypoint.sh"]
