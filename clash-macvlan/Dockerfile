FROM debian:latest

RUN apt update
RUN apt dist-upgrade -y
RUN apt autoremove --purge -y
RUN apt install dnsutils -y
RUN apt install iproute2 -y
RUN apt install iptables -y
RUN apt install net-tools -y
RUN apt install ca-certificates -y

ADD clash /usr/bin/clash
ADD docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN mkdir /usr/share/clash
ADD yacd  /usr/share/clash/yacd
ADD https://raw.githubusercontent.com/closehandle/ipip2mmdb/release/Country.mmdb /usr/share/clash/Country.mmdb

CMD ["bash", "docker-entrypoint.sh"]
